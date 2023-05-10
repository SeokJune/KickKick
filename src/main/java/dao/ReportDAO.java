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
import commons.XSSUtils;
import dto.ReportDTO;

public class ReportDAO {

	private ReportDAO() {}
	private static ReportDAO instance = null;
	public synchronized static ReportDAO getInstance() {
		if(instance==null) {
			instance=new ReportDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}

	public int insert(ReportDTO dto) throws Exception{
		String sql = "insert into report values(report_code.nextval,?,?,?,?,?,?,default,default,null,null)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, dto.getMember_code());
			pstat.setInt(2, dto.getBoard_kind_code());
			pstat.setInt(3, dto.getBoard_code());
			pstat.setInt(4, dto.getReply_code());
			pstat.setInt(5, dto.getReport_kind_code());
			pstat.setString(6, XSSUtils.xssFilter(dto.getContent()));
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	//검색옵션에 따라 출력되어야 할 게시물 개수 세기
	private int get_record_count(int b_c, String wide_option, String narrow_option, String search_word) throws Exception{
		String sql = "";
		if(wide_option.equals("신고대상")) {
			if(narrow_option.equals("아이디")) {
				sql = "select count(*) from report r left join member m on r.member_code=m.code where board_kind_code=? and m.id like ?";
			}
			else if(narrow_option.equals("닉네임")) {
				sql = "select count(*) from report r left join member m on r.member_code=m.code where board_kind_code=? and m.nickname like ?";
			}
		}
		else if(wide_option.equals("신고사유")){
			sql = "select count(*) from report r left join report_kind rk on r.report_kind_code=rk.code where board_kind_code=? and rk.name like ?";
		}
		else if(wide_option.equals("상세설명")) {
			sql = "select count(*) from report where board_kind_code=? and nvl(content,0) like ?";
		}
		else {
			sql="?";
		}
		System.out.println("record_count sql: "+sql);
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			if(wide_option.equals("신고사유")) {
				pstat.setInt(1, b_c);
				pstat.setString(2, "%"+narrow_option+"%");
			}else {
				pstat.setInt(1, b_c);
				pstat.setString(2, "%"+search_word+"%");
			}
			try(ResultSet rs = pstat.executeQuery()){
				rs.next();
				return rs.getInt(1);
			}
		}
	}

	//페이지 번호가 적힌 pagination 만들기
	public String get_page_navi(int b_c,int current_page,String wide_option,String narrow_option,String search_word) throws Exception{
		//네비 기본 설정
		int record_total_count = get_record_count(b_c,wide_option,narrow_option,search_word);
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
		if(wide_option==null) {
			if(need_prev) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.report?b_c="+b_c+"&cpage="+(start_navi-1)+"' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span></a></li>");
			}
			for(int i=start_navi;i<=end_navi;i++) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.report?b_c="+b_c+"&cpage="+i+"'>"+i+"</a></li>");
			}
			if(need_next) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.report?b_c="+b_c+"&cpage="+(end_navi+1)+"' aria-label='Next'> <span aria-hidden='true'>&raquo;</span></a></li>");
			}
		}
		else {
			if(need_prev) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.report?b_c="+b_c+"&cpage="+(start_navi-1)+"&wide_option="+wide_option+"&narrow_option="+narrow_option+"&search_word="+search_word+"' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span></a></li>");
			}
			for(int i=start_navi;i<=end_navi;i++) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.report?b_c="+b_c+"&cpage="+i+"&wide_option="+wide_option+"&narrow_option="+narrow_option+"&search_word="+search_word+"'>"+i+"</a></li>");
			}
			if(need_next) {
				sb.append("<li class='page-item'><a class='page-link' href='/list.report?b_c="+b_c+"&cpage="+(end_navi+1)+"&wide_option="+wide_option+"&narrow_option="+narrow_option+"&search_word="+search_word+"' aria-label='Next'> <span aria-hidden='true'>&raquo;</span></a></li>");
			}
		}
		return sb.toString();
	}

	public List<ReportDTO> select_report_list(int b_c,int start,int end,String wide_option,String narrow_option,String search_word) throws Exception{
		String sql;
		String table="";
		if(b_c==1001) {
			table="team";
		}
		else if(b_c==1002) {
			table="announcement";
		}
		else if(b_c==1003) {
			table="free";
		}
		else if(b_c==1004) {
			table="promotion";
		}
		
		if(wide_option.equals("신고사유")) {
			sql = "select * from (select t.*, row_number() over(order by reg_date desc) rnk "
					+ "from (select report.code, report.board_kind_code, s.name status, "
					+ "rk.name report_kind, report.content, m.id member_id, m.nickname member_nickname, "
					+ "report.reg_date, report.board_code, ba.content board_content, report.reply_code, ra.content reply_content from report "
					+ "join status s on report.status_code=s.code join report_kind rk on report.report_kind_code=rk.code "
					+ "left join member m on report.member_code=m.code left join board_"+table+" ba "
					+ "on report.board_code=ba.code left join reply_"+table+" ra on report.reply_code=ra.code) t) where "
					+ "report_kind like ? and board_kind_code=? and rnk between ? and ?";
			System.out.println("select if sql: "+sql);
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql)){
				pstat.setString(1, "%"+narrow_option+"%");
				pstat.setInt(2, b_c);
				pstat.setInt(3, start);
				pstat.setInt(4, end);
				List<ReportDTO> result = new ArrayList<>();
				try(ResultSet rs = pstat.executeQuery()){
					while(rs.next()) {

					}
					return result;
				}
			}
		}
		else {
			if(wide_option.equals("신고대상")) {
				if(narrow_option.equals("아이디")) {
					narrow_option="member_id";
				}
				else if(narrow_option.equals("닉네임")) {
					narrow_option="member_nickname";
				}
			}
			else if(wide_option.equals("상세설명")) {
				narrow_option="content";

			}
			sql = "select * from (select t.*, row_number() over(order by reg_date desc) rnk "
					+ "from (select report.code, report.board_kind_code, s.name status, "
					+ "rk.name report_kind, report.content, m.id member_id, m.nickname member_nickname, "
					+ "report.reg_date, report.board_code, ba.content board_content, report.reply_code, ra.content reply_content from report "
					+ "join status s on report.status_code=s.code join report_kind rk on report.report_kind_code=rk.code "
					+ "left join member m on report.member_code=m.code left join board_"+table+" ba "
					+ "on report.board_code=ba.code left join reply_"+table+" ra on report.reply_code=ra.code) t) where "
					+narrow_option+" like ? and board_kind_code=? and rnk between ? and ?";
			System.out.println("select else sql: "+sql);
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql)){
				pstat.setString(1, "%"+search_word+"%");
				pstat.setInt(2, b_c);
				pstat.setInt(3, start);
				pstat.setInt(4, end);
				List<ReportDTO> result = new ArrayList<>();
				try(ResultSet rs = pstat.executeQuery()){
					while(rs.next()) {
						int code = rs.getInt("code");
						int board_kind_code = rs.getInt("board_kind_code");
						int board_code = rs.getInt("board_code");
						int reply_code = rs.getInt("reply_code");
						String status = rs.getString("status");
						String report_kind = rs.getString("report_kind");
						String content = rs.getString("content");
						String member_nickname = rs.getString("member_nickname");
						Timestamp reg_date = rs.getTimestamp("reg_date");
						String board_content = rs.getString("board_content");
						String reply_content = rs.getString("reply_content");
						result.add(new ReportDTO(code, member_nickname, board_kind_code, board_code, board_content, reply_content, reply_code, report_kind, content, status, reg_date));
					}
					return result;
				}
			}

		}		
	}

	//	public ReportDTO select_report(int code) throws Exception{
	//		String sql = "";
	//	}
}
