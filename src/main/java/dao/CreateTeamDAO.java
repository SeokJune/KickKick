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
import dto.HometownDTO;
import dto.TeamDTO;

public class CreateTeamDAO {

	private CreateTeamDAO() {}

	private static CreateTeamDAO instance = null;

	public synchronized static CreateTeamDAO getInstance() {
		if(instance == null) {
			instance = new CreateTeamDAO();
		}
		return instance;
	}


	private Connection getConnection() throws Exception {
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}


	public List<HometownDTO> select_hometown() throws Exception {
		String sql = "select * from hometown";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {

			List<HometownDTO> arr = new ArrayList<>();
			while(rs.next()) {
				int code = rs.getInt("code");
				String name = rs.getString("name");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");

				HometownDTO dto = new HometownDTO(code, name, reg_date, mod_date, del_date);	
				arr.add(dto);
			}
			return arr;
		}
	}

	public int insert_team(TeamDTO dto) throws Exception {
		String sql = "insert into team values(team_code.nextval,?,?,?,?,?,?,?,sysdate,null,null)"; 
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {


			pstat.setInt(1, dto.getLogo_path_code());
			pstat.setString(2, dto.getLogo());
			pstat.setString(3, dto.getName());
			pstat.setInt(4, dto.getMember_code());
			pstat.setInt(5, dto.getHometown_code());
			pstat.setString(6, dto.getOutline());
			pstat.setString(7, dto.getContent());

			int result = pstat.executeUpdate();
			con.commit();

			return result;

		}

	}

	public boolean team_name_exist(String team_name) throws Exception {
		String sql = "select * from team where name=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)) {

			pstat.setString(1, team_name);
			try(ResultSet rs = pstat.executeQuery()) {
				return rs.next();
			}
		}
	}





	//	public List<MemberDTO> selectMember() throws Exception {
	//		String sql = "select * from member";
	//		try(Connection con = this.getConnection();
	//				PreparedStatement pstat = con.prepareStatement(sql);
	//				ResultSet rs = pstat.executeQuery();) {
	//
	//			List<MemberDTO> arr = new ArrayList();
	//
	//			rs.next() ;
	//			int code = rs.getInt("code");
	//			int join_kind_code = rs.getInt("join_kind_code");
	//			String id = rs.getString("id");
	//			String pw = rs.getString("pw");
	//			String name = rs.getString("name");
	//			String nick_name = rs.getString("nick_name");
	//			String birth_date = rs.getString("birth_date");
	//			String phone = rs.getString("phone");
	//			String email = rs.getString("email");
	//			String agree = rs.getString("agree");
	//			int authority_grade_code = rs.getInt("authority_grade_code");
	//			Timestamp reg_date = rs.getTimestamp("reg_date");
	//			Timestamp mod_date = rs.getTimestamp("mod_date");
	//			Timestamp del_date = rs.getTimestamp("del_date");
	//
	//			MemberDTO dto = new MemberDTO(code, join_kind_code, id, pw, name, nick_name, birth_date, phone, email, agree, authority_grade_code, reg_date, mod_date, del_date);
	//			arr.add(dto);
	//			return arr;
	//		}
	//		
	//	}

	public List<TeamDTO> select_team() throws Exception {
		String sql = "select * from team_view"; 
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {

			List<TeamDTO> arr = new ArrayList<>();

			while(rs.next()) {
				int code = rs.getInt("code");
				int logo_path_code = rs.getInt("logo_path_code");
				String logo_path = rs.getString("logo_path");
				String logo_name = rs.getString("logo_name");
				String logo = rs.getString("logo");
				String name = rs.getString("name");
				int member_code = rs.getInt("member_code");
				String member_name = rs.getString("member_name");
				String member_phone = rs.getString("member_phone");
				int hometown_code = rs.getInt("hometown_code");
				String hometown_name = rs.getString("hometown_name");
				String outline = rs.getString("outline");
				String content = rs.getString("content");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");


				TeamDTO dto = new TeamDTO(code, logo_path_code, logo_path, logo_name, logo, name, member_code, member_name, member_phone, hometown_code, hometown_name, outline, content, reg_date, mod_date, del_date);
				arr.add(dto);
			}
			return arr;
		}
	}

	public TeamDTO team_info(int team_code) throws Exception {
		String sql = "select * from team_view where code = ?"; 
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, team_code);

			try(ResultSet rs = pstat.executeQuery();) {

				
				rs.next();
				int code = rs.getInt("code");
				int logo_path_code = rs.getInt("logo_path_code");
				String logo_path = rs.getString("logo_path");
				String logo_name = rs.getString("logo_name");
				String logo = rs.getString("logo");
				String name = rs.getString("name");
				int member_code = rs.getInt("member_code");
				String member_name = rs.getString("member_name");
				String member_phone = rs.getString("member_phone");
				int hometown_code = rs.getInt("hometown_code");
				String hometown_name = rs.getString("hometown_name");
				String outline = rs.getString("outline");
				String content = rs.getString("content");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");
				
				
				return new TeamDTO
						(code, logo_path_code, logo_path, logo_name, logo, name, member_code, 
								member_name, member_phone, hometown_code,  hometown_name, outline,
								content, reg_date, mod_date, del_date);
			}
		}
	}


	private int get_recode_count() throws Exception {
		String sql = "select count(*) from team";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);
		}
	}

	public String get_page_navi(int currentPage) throws Exception {
		// 네비게이터를 만들기 위해 필요한 초기 정보
		int recordTotalCount = this.get_recode_count(); // 1. 전체 글의 개수
		int recordCountPerPage = Settings.BOARD_RECORD_COUNT_PER_PAGE; // 2. 페이지 당 보여줄 글의 갯수
		int naviCountPerPage = Settings.BOARD_NAVI_COUNT_PER_PAGE; // 3. 페이지 당 보여줄 네비게이터의 갯수

		int pageTotalCount = 0; // 4. 1번과 2번 항목에 의해 총 페이지의 개수가 정해짐

		// 전체 글의 개수를 페이지 당 보여줄 글의 갯수를 나누었을 때 나머지가 발생하면 페이지 +1
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage +1;
		}
		else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}



		if(currentPage < 1) {	// currentPage가 1보단 작을 수 없다..
			currentPage = 1;
		}
		else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1;  // 일반적으로 그냥 samesame이지만 자바언어 특성 상 소숫점을 날리는 과정이 된다.
		int endNavi = startNavi + (naviCountPerPage - 1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}



		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		}
		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		// 문자열 조립?
		StringBuilder sb = new StringBuilder();



		// 네비게이터의 양 끝 화살표
		if(needPrev) {
			sb.append("<a href='/list.team?cpage="+(startNavi-1)+"'> < </a>");
		}

		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='/list.team?cpage="+i+"'>" + i + "</a> ");
		}
		if(needNext) {
			sb.append("<a href='/list.team?cpage="+(endNavi+1)+"'> > </a>");
		}	

		return sb.toString();
	}
}
