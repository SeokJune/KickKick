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
import dto.InquireDTO;

public class InquireDAO {
	
	private InquireDAO() {}
	private static InquireDAO instance = null;
	public synchronized static InquireDAO getInstance() {
		if(instance==null) {
			instance=new InquireDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	
	public int insert(InquireDTO dto) throws Exception{
		String sql = "insert into inquire values(inquire_code.nextval,?,?,?,default,default,null,null)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, dto.getMember_code());
			pstat.setInt(2, dto.getReport_kind_code());
			pstat.setString(3, dto.getContent());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	//검색옵션에 따라 출력되어야 할 게시물 개수 세기
	private int get_record_count(String search_option, String search_word) throws Exception{
		String sql = "select count(*) from inquire i left join member m on i.member_code=m.code where "+search_option+" like ?";
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
		public String get_page_navi(int current_page, String search_option, String search_word) throws Exception{
			//네비 기본 설정
			int record_total_count = get_record_count(search_option,search_word);
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
					sb.append("<li class='page-item'><a class='page-link' href='/list.inquire?cpage="+(start_navi-1)+"' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span></a></li>");
				}
				for(int i=start_navi;i<=end_navi;i++) {
					sb.append("<li class='page-item'><a class='page-link' href='/list.inquire?cpage="+i+"'>"+i+"</a></li>");
				}
				if(need_next) {
					sb.append("<li class='page-item'><a class='page-link' href='/list.inquire?cpage="+(end_navi+1)+"' aria-label='Next'> <span aria-hidden='true'>&raquo;</span></a></li>");
				}
			}
			else {
				if(need_prev) {
					sb.append("<li class='page-item'><a class='page-link' href='/list.inquire?cpage="+(start_navi-1)+"&search_option="+search_option+"&search_word="+search_word+"' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span></a></li>");
				}
				for(int i=start_navi;i<=end_navi;i++) {
					sb.append("<li class='page-item'><a class='page-link' href='/list.inquire?cpage="+i+"&search_option="+search_option+"&search_word="+search_word+"'>"+i+"</a></li>");
				}
				if(need_next) {
					sb.append("<li class='page-item'><a class='page-link' href='/list.inquire?cpage="+(end_navi+1)+"&search_option="+search_option+"&search_word="+search_word+"' aria-label='Next'> <span aria-hidden='true'>&raquo;</span></a></li>");
				}
			}
			return sb.toString();
		}
		
		//한 페이지에 띄워야 할 게시물 리스트 반환
		public List<InquireDTO> select_inquire_list(int start, int end, String search_option, String search_word) throws Exception{
			String sql = "select * from (select t.*, row_number() over(order by reg_date desc) rnk from "
					+ "(select i.code, s.name status, rk.name report_kind, m.nickname, i.reg_date, i.content "
					+ "from inquire i join status s on i.status_code=s.code join report_kind rk "
					+ "on i.report_kind_code=rk.code left join member m on i.member_code=m.code) t) where "
					+search_option+" like ? and rnk between ? and ?";
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql)){
				pstat.setString(1, "%"+search_word+"%");
				pstat.setInt(2, start);
				pstat.setInt(3, end);
				List<InquireDTO> result = new ArrayList<>();
				try(ResultSet rs = pstat.executeQuery()){
					while(rs.next()) {
						int code = rs.getInt("code");
						String nickname = rs.getString("nickname");
						String report_kind = rs.getString("report_kind");
						String content = rs.getString("content");
						String status = rs.getString("status");
						Timestamp reg_date = rs.getTimestamp("reg_date");
						result.add(new InquireDTO(code,nickname,report_kind,content,status,reg_date));
					}
					return result;
				}
			}
		}
		
		public InquireDTO select_inquire(int select_code) throws Exception{
			String sql = "select i.code, s.name status, rk.name report_kind, m.nickname, i.reg_date, i.content from inquire i join status s on i.status_code=s.code join report_kind rk on i.report_kind_code=rk.code left join member m on i.member_code=m.code where i.code=?";
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql)){
				pstat.setInt(1, select_code);
				try(ResultSet rs = pstat.executeQuery()){
					rs.next();
					int code = rs.getInt("code");
					String nickname = rs.getString("nickname");
					String report_kind = rs.getString("report_kind");
					String content = rs.getString("content");
					String status = rs.getString("status");
					Timestamp reg_date = rs.getTimestamp("reg_date");
					return new InquireDTO(code,nickname,report_kind,content,status,reg_date);
				}
			}
		}
		
		public int[] select_prev_next_post(int code) throws Exception{
			String sql = "select * from (select code, lag(code) over(order by reg_date) as prev, lead(code) over(order by reg_date) as next from inquire order by reg_date desc) where code=?";
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
		
}
