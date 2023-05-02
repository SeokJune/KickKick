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
import dto.ReplyDTO;

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
	
	public String set_table(String board_kind_name) {
		if(board_kind_name.equals("공지사항")) {
			return "ANNOUNCEMENT";
		}
		else if(board_kind_name.equals("자유게시판")) {
			return "FREE";
		}
		else if(board_kind_name.equals("홍보게시판")) {
			return "PROMOTION";
		}
		//문의하기 게시판은 컬럼이 다르니까 따로 처리하자
		return "";
	}
	
	public List<BoardHeadlineDTO> select_board_headline_list() throws Exception{
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
	
	public BoardHeadlineDTO select_board_headline(String headline_name) throws Exception{
		String sql = "select b.code board_code, b.name board_name, h.code headline_code, h.name headline_name from board_kind b join board_headline h on b.code=h.board_kind_code where h.name=?";
		try(Connection con  = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, headline_name);
			try(ResultSet rs = pstat.executeQuery()){
				BoardHeadlineDTO result = new BoardHeadlineDTO();
				while(rs.next()) {
					result.setBoard_kind_code(rs.getInt("board_code"));
					result.setBoard_name(rs.getString("board_name"));
					result.setCode(rs.getInt("headline_code"));
					result.setName(rs.getString("headline_name"));
				}
				return result;
			}
		}
	}
	
	//게시판 코드로 게시판 이름 get
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
		String sql = "select count(*) from board_"+board_table_name+" where "+search_option+" like ?";
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
	public String get_page_navi(int b_c, String board_table_name, int current_page, String search_option, String search_word) throws Exception{
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
				sb.append("<li class='page-item'><a class='page-link' href='/list.board?b_c="+b_c+"&cpage="+(start_navi-1)+"' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span></a></li>");
			}
			for(int i=start_navi;i<=end_navi;i++) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.board?b_c="+b_c+"&cpage="+i+"'>"+i+"</a></li>");
			}
			if(need_next) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.board?b_c="+b_c+"&cpage="+(end_navi+1)+"' aria-label='Next'> <span aria-hidden='true'>&raquo;</span></a></li>");
			}
		}
		else {
			if(need_prev) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.board?b_c="+b_c+"&cpage="+(start_navi-1)+"&search_option="+search_option+"&search_word="+search_word+"' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span></a></li>");
			}
			for(int i=start_navi;i<=end_navi;i++) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.board?b_c="+b_c+"&cpage="+i+"&search_option="+search_option+"&search_word="+search_word+"'>"+i+"</a></li>");
			}
			if(need_next) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.board?b_c="+b_c+"&cpage="+(end_navi+1)+"&search_option="+search_option+"&search_word="+search_word+"' aria-label='Next'> <span aria-hidden='true'>&raquo;</span></a></li>");
			}
		}
		return sb.toString();
	}
	
	//한 페이지에 띄워야 할 게시물 리스트 반환
	public List<BoardDTO> select_board_list(String board_table_name, int start, int end, String search_option, String search_word) throws Exception{
//		String sql = "select * from (select "+board_table_name+".*, row_number() over(order by reg_date desc) rn from "+board_table_name+" where "+search_option+" like ?) where rn between ? and ?";
		//수정한 쿼리.. 좀 심각하게 길어요
		String sql = "select * from (select t.*, row_number() over(order by reg_date desc) rnk from "
				+ "(select b.code, b.board_kind_code, h.name board_headline_name, b.title, b.content, "
				+ "m.code member_code, m.nickname member_nickname, b.view_count, b.like_count, "
				+ "r.*, b.reg_date, b.mod_date from board_"+board_table_name+" b left join (select board_"
				+board_table_name+"_code,count(code) reply_count from reply_"+board_table_name
				+" group by board_"+board_table_name+"_code) r on b.code=r.board_"+board_table_name
				+"_code join (select code, id, nickname from member) m on b.member_code=m.code join "
				+ "(select code, name from board_headline) h on b.board_headline_code=h.code) t where "
				+search_option+" like ?) where rnk between ? and ?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%"+search_word+"%");
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			
			try(ResultSet rs = pstat.executeQuery();){
				List<BoardDTO> result = new ArrayList<>();
				while(rs.next()) {
					int code = rs.getInt("code");
					int board_kind_code = rs.getInt("board_kind_code");
					String board_headline_name = rs.getString("board_headline_name");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String member_nickname = rs.getString("member_nickname");
					int view_count = rs.getInt("view_count");
					int like_count = rs.getInt("like_count");
					int reply_count = rs.getInt("reply_count");
					Timestamp reg_date = rs.getTimestamp("reg_date");
					Timestamp mod_date = rs.getTimestamp("mod_date");
					result.add(new BoardDTO(code,board_kind_code,board_headline_name,title,content,member_nickname,view_count,like_count,reply_count,reg_date,mod_date));
				}
				return result;
			}
		}
	}
	
	//글 하나의 정보 담아보내기
	public BoardDTO select_board(String board_table_name, int code) throws Exception{
		String sql = "select b.code, b.board_kind_code, h.name \"board_headline_name\", "
				+ "b.title, b.content, m.code \"member_code\", m.nickname \"member_nickname\", "
				+ "b.view_count, b.like_count, r.*, b.reg_date, b.mod_date from board_"
				+board_table_name+" b left join (select board_"+board_table_name+"_code,"
						+ "count(code) \"reply_count\" from reply_"+board_table_name
						+" group by board_"+board_table_name+"_code) r on b.code=r.board_"
						+board_table_name+"_code join (select code, id, nickname from member) m "
						+ "on b.member_code=m.code join (select code, name from board_headline) h "
						+ "on b.board_headline_code=h.code where b.code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, code);
			try(ResultSet rs = pstat.executeQuery()){
				BoardDTO result = new BoardDTO();
				while(rs.next()) {
					result.setCode(rs.getInt("code"));
					result.setBoard_kind_code(rs.getInt("board_kind_code"));
					result.setBoard_headline_name(rs.getString("board_headline_name"));
					result.setTitle(rs.getString("title"));
					result.setContent(rs.getString("content"));
					result.setMember_nickname(rs.getString("member_nickname"));
					result.setView_count(rs.getInt("view_count"));
					result.setLike_count(rs.getInt("like_count"));
					result.setReply_count(rs.getInt("reply_count"));
					result.setReg_date(rs.getTimestamp("reg_date"));
					result.setMod_date(rs.getTimestamp("mod_date"));
				}
				return result;
			}
		}
	}
	
	//해당 글 코드와 이전글, 다음글 코드 정보를 담은 데이터 출력 
	public int[] select_prev_next_post(String board_table_name, int code) throws Exception{
		String sql = "select * from (select code, lag(code) over(order by reg_date) as prev, lead(code) over(order by reg_date) as next from board_"+board_table_name+" order by reg_date desc) where code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, code);
			try(ResultSet rs = pstat.executeQuery()){
				int[] result = new int[3];
				while(rs.next()) {
					result[0] = rs.getInt("code");
					result[1] = rs.getInt("prev");
					result[2] = rs.getInt("next");
				}
				return result;
			}
		}
	}
	
	public int add_view_count(String board_table_name, int code) throws Exception{
		String sql = "update board_"+board_table_name+" set view_count=view_count+1 where code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, code);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int substract_view_count(String board_table_name, int code) throws Exception{
		String sql = "update board_"+board_table_name+" set view_count=view_count-1 where code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, code);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	//(임시)insert기능 
	public int insert_post(String board_table_name, BoardDTO dto) throws Exception{
			String sql = "insert into board_"+board_table_name+" values(board_"+board_table_name+"_code.nextval,?,?,?,?,?,default,default,default,null,null)";
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql)){
				pstat.setInt(1, dto.getBoard_kind_code());
				pstat.setInt(2, dto.getBoard_headline_code());
				pstat.setInt(3, dto.getMember_code());
				pstat.setString(4, dto.getTitle());
				pstat.setString(5, dto.getContent());
				int result = pstat.executeUpdate();
				con.commit();
				return result;
		}
	}
	
	public int update_post(String board_table_name, BoardDTO dto) throws Exception{
		String sql = "update board_"+board_table_name+" set board_headline_code=(select code from board_headline where name=?), title=?, content=?, mod_date=sysdate where code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, dto.getBoard_headline_name());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getContent());
			pstat.setInt(4, dto.getCode());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int delete_post(String board_table_name, int code) throws Exception{
		String sql = "delete from board_"+board_table_name+" where code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, code);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
