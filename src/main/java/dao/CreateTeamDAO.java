package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import commons.Settings;
import dto.HometownDTO;
import dto.TeamApDTO;
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

	// 팀 생성 시 연고지 목록 가져오기
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
	// 팀 생성 시 정보 insert
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
	// 팀명 중복 검사
	public boolean team_name_exist(String team_name) throws Exception {
		String sql = "select * from team where name=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {

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

	//	public List<TeamDTO> select_team() throws Exception {
	//		String sql = "select * from team_view"; 
	//		try(Connection con = this.getConnection();
	//				PreparedStatement pstat = con.prepareStatement(sql);
	//				ResultSet rs = pstat.executeQuery();) {
	//
	//			List<TeamDTO> arr = new ArrayList<>();
	//
	//			while(rs.next()) {
	//				int code = rs.getInt("code");
	//				int logo_path_code = rs.getInt("logo_path_code");
	//				String logo_path = rs.getString("logo_path");
	//				String logo_name = rs.getString("logo_name");
	//				String logo = rs.getString("logo");
	//				String name = rs.getString("name");
	//				int member_code = rs.getInt("member_code");
	//				String member_name = rs.getString("member_name");
	//				String member_phone = rs.getString("member_phone");
	//				int hometown_code = rs.getInt("hometown_code");
	//				String hometown_name = rs.getString("hometown_name");
	//				String outline = rs.getString("outline");
	//				String content = rs.getString("content");
	//				Timestamp reg_date = rs.getTimestamp("reg_date");
	//				Timestamp mod_date = rs.getTimestamp("mod_date");
	//				Timestamp del_date = rs.getTimestamp("del_date");
	//
	//
	//				TeamDTO dto = new TeamDTO(code, logo_path_code, logo_path, logo_name, logo, name, member_code, member_name, member_phone, hometown_code, hometown_name, outline, content, reg_date, mod_date, del_date);
	//				arr.add(dto);
	//			}
	//			return arr;
	//		}
	//	}
	// 생성된 팀의 리스트 출력
	public List<TeamDTO> select_team(int start, int end) throws Exception{
		String sql = "select * from\r\n"
				+ "(select team_view.*, row_number() over(order by code desc) rn \r\n"
				+ "from team_view)\r\n"
				+ "where rn between ? and ?"; 

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs = pstat.executeQuery()) {

				List<TeamDTO> list = new ArrayList();
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
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	
	// 팀 페이지에 보여질 팀의 정보 
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
	// 팀 리스트에서 팀명으로 검색
	public List<TeamDTO> search_team_name(String team_name) throws Exception {
		String sql = "select * from team_view where name like ? "; 
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, "%"+team_name+"%");

			try(ResultSet rs = pstat.executeQuery();) {

				List<TeamDTO> list = new ArrayList();
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

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
					String form_date = sdf.format(reg_date);

					TeamDTO dto = new TeamDTO
							(code, logo_path_code, logo_path, logo_name, logo, name, member_code, 
									member_name, form_date, hometown_code,  hometown_name, outline,
									content, reg_date, mod_date, del_date);
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	// 로그인한 사람의 team_code가 팀 페이지의 code와 일치 할 때 (즉 팀원일 때) 보이는 팀 페이지
	public List<Integer> team_code(int member_code) throws Exception {
		String sql = "select team_code from team_member where member_code = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, member_code);
			
			try(ResultSet rs = pstat.executeQuery();) {
				
				List<Integer> list = new ArrayList();
				while(rs.next()) {
					int team_code = rs.getInt("team_code");
					list.add(team_code);
				}
				return list;
			}
		}
	}
	// 가입 신청한 사람의 입력 정보 담기
	public int insert_ap(TeamApDTO dto) throws Exception {
		String sql = "insert into team_join_apply values(team_join_apply_code.nextval,?,?,?,1001,sysdate,null,null)"; 
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {

				pstat.setInt(1, dto.getTeam_code());
				pstat.setInt(2, dto.getMember_code());
				pstat.setString(3, dto.getContent());
				int result = pstat.executeUpdate();
				con.commit();
				
				return result;
		}
	}
	// 팀 가입신청한 회원 목록 뽑아오기 (팀장만 보기)
	public List<TeamApDTO> join_wait(int team_code1) throws Exception {
		String sql = "select t.code, t.team_code, t.member_code, m.nickname, m.phone, t.content, t.status_code\r\n"
				+ "from team_join_apply t join member m on t.member_code = m.code\r\n"
				+ "where t.team_code = ? and status_code = 1001";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			
			pstat.setInt(1, team_code1);			
			ResultSet rs = pstat.executeQuery(); {
				
				List<TeamApDTO> arr = new ArrayList<>();
				while(rs.next()) {
					int code = rs.getInt("code");
					int team_code = rs.getInt("team_code");
					int member_code = rs.getInt("member_code");
					String nickname = rs.getString("nickname");
					String phone = rs.getString("phone");
					String content = rs.getString("content");
					int status_code = rs.getInt("status_code");
					
					TeamApDTO dto = new TeamApDTO(code, team_code, member_code, nickname, phone, content, status_code);
					arr.add(dto);
				}
				return arr;
			}
			
				
		}
	}
	// 현재 로그인한 사람의 status 가져오기(팀신청을 한 사람인지 확인하기 위해서)
	public int member_status(int member_code1, int team_code1) throws Exception {
		String sql = "select status_code from team_join_apply where member_code = ? and team_code = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			
			pstat.setInt(1, member_code1);
			pstat.setInt(2, team_code1);
			ResultSet rs = pstat.executeQuery(); {
				
				int status_code = 0;
				
					if(rs.next()) {
						status_code = rs.getInt("status_code");
					}
				return status_code;	
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
