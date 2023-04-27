package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import commons.Settings;
import dto.BoardDTO;
import dto.BoardHeadlineDTO;

public class BoardDAO {
	private BoardDAO() {}
	private static BoardDAO instance = null;
	public synchronized static BoardDAO getInstance() {
		if(instance==null) {
			instance=new BoardDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}

	//	public int insert(BoardDTO dto) throws Exception{
	//		String sql1 = "select table_name from board_kind where code=?";
	//		String board_name;
	//		String headline_name;
	//		try(Connection con = this.getConnection()){				
	//			try(PreparedStatement pstat = con.prepareStatement(sql1)){
	//				pstat.setInt(1, dto.getBoard_kind_code());
	//				try(ResultSet rs = pstat.executeQuery()){
	//					while(rs.next()) {
	//						board_name = rs.getString("table_name");
	//					}
	//				}
	//			}
	//
	//			String sql2 = "insert into ? values(?,?)";
	//			try(PreparedStatement pstat = con.prepareStatement(sql2)){
	//				pstat.setString(1, board_name);
	//				pstat.setString(2, dto.getBoard_headline_code());
	//			}
	//		}
	//	}

	public List<BoardHeadlineDTO> select_board_headline() throws Exception{
		String sql = "select h.code, h.name, b.code as \"board_kind_code\", b.name as \"board_name\" from board_kind b join board_headline h on b.code=h.board_kind_code";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()){
			List<BoardHeadlineDTO> result = new ArrayList<>();
			while(rs.next()) {
				int code = rs.getInt("code");
				String name = rs.getString("name");
				int board_kind_code = rs.getInt("board_kind_code");
				String board_name = rs.getString("board_name");
				result.add(new BoardHeadlineDTO(code,name,board_kind_code,board_name));
			}
			return result;
		}
	}
	
	public String select_board_name(int board_code) throws Exception{
		String sql = "select name from board_kind where code = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, board_code);
			try(ResultSet rs = pstat.executeQuery()){
				rs.next();
				return rs.getString("name");
			}
		}
	}
	
	//검색옵션에 따라 출력되어야 할 게시물 개수 세기
	private int get_record_count(String board_table_name, String search_option, String search_word) throws Exception{
		String sql = "select count(*) from "+board_table_name+" where "+search_option+" like ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, "%"+search_word+"%");
			try(ResultSet rs = pstat.executeQuery()){
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	
	//페이지 번호가 적힌 pagination 만들기
	public String get_page_navi(String board_table_name, int current_page, String search_option, String search_word) throws Exception{
		//네비 기본 설정
		int record_total_count = get_record_count(board_table_name,search_option,search_word);
		int record_count_per_page = Settings.BOARD_RECORD_COUNT_PER_PAGE;
		int navi_count_per_page = Settings.BOARD_NAVI_COUNT_PER_PAGE;
		int page_total_count = (int)Math.ceil((double)record_total_count/record_count_per_page);
		if(record_total_count==0) {
			page_total_count=1;
		}
		//현재 페이지 값 조작 방지
		if(current_page<1) {
			current_page=1;
		}
		else if(current_page>page_total_count) {
			current_page=page_total_count;
		}
		
		//네비의 시작과 끝 설정
		int start_navi = (current_page-1)/navi_count_per_page*navi_count_per_page +1;
		int end_navi = start_navi+navi_count_per_page-1;
		if(end_navi>page_total_count) {
			end_navi = page_total_count;
		}
		
		//이전페이지, 다음페이지 화살표 생성여부 결정
		boolean need_prev = true;
		boolean need_next = true;
		if(start_navi==1) {
			need_prev = false;
		}
		if(end_navi==page_total_count) {
			need_next=false;
		}
		
		//navi 문자열 생성
		StringBuilder sb = new StringBuilder();
		if(search_option==null) {
			if(need_prev) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.board?cpage="+(start_navi-1)+"' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span></a></li>");
			}
			for(int i=start_navi;i<=end_navi;i++) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.board?cpage="+i+"'>"+i+"</a></li>");
			}
			if(need_next) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.board?cpage="+(end_navi+1)+"' aria-label='Next'> <span aria-hidden='true'>&raquo;</span></a></li>");
			}
		}
		else {
			if(need_prev) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.board?cpage="+(start_navi-1)+"&search_option="+search_option+"&search_word="+search_word+"' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span></a></li>");
			}
			for(int i=start_navi;i<=end_navi;i++) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.board?cpage="+i+"&search_option="+search_option+"&search_word="+search_word+"'>"+i+"</a></li>");
			}
			if(need_next) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.board?cpage="+(end_navi+1)+"&search_option="+search_option+"&search_word="+search_word+"' aria-label='Next'> <span aria-hidden='true'>&raquo;</span></a></li>");
			}
		}
		return sb.toString();
	}
	
	//한 페이지에 띄워야 할 게시물 리스트 반환
	public List<BoardDTO> select_bound(String board_table_name, int start, int end, String search_option, String search_word) throws Exception{
		String sql = "select * from (select "+board_table_name+".*, row_number() over(order by reg_date desc) rn from "+board_table_name+" where "+search_option+" like ?) where rn between ? and ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, "%"+search_word+"%");
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			
			try(ResultSet rs = pstat.executeQuery()){
				List<BoardDTO> result = new ArrayList<>();
				while(rs.next()) {
					int code = rs.getInt("code");
					int board_kind_code = rs.getInt("board_kind_code");
					int board_headline_code = rs.getInt("board_headline_code");
					int member_code = rs.getInt("member_code");
					String title = rs.getString("title");
					String content = rs.getString("content");
					int view_count = rs.getInt("view_count");
					int like_count = rs.getInt("like_count");
					Timestamp reg_date = rs.getTimestamp("reg_date");
					Timestamp mod_date = rs.getTimestamp("mod_date");
					Timestamp del_date = rs.getTimestamp("del_date");
					result.add(new BoardDTO(code,board_kind_code,board_headline_code,member_code,title,content,view_count,like_count,reg_date,mod_date,del_date));
				}
				return result;
			}
		}
		
	}
}
