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
import dto.ApplyDTO;
import dto.CompetitionDTO;
import dto.RegisterInfoDTO;
import dto.TeamDTO;


public class MercenaryDAO {

	private static MercenaryDAO instance = null;
	public synchronized static MercenaryDAO getInstance() {
		if(instance == null) {
			instance = new MercenaryDAO();
		}
		return instance;
	}

	private MercenaryDAO() {}

	public Connection getConnection() throws Exception {
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}

	// register_form : 로그인 ID로 팀 선택하기 (단, 로그인 ID가 팀장인 경우만)
	public List<TeamDTO> select_team_by_id(String login_id) throws Exception{
		String sql = "select code,logo_path,logo,name,member_name,member_phone from team_view "
				+ "where code in (select team_code from team_member "
				+ "where team_view.member_code = team_member.member_code "
				+ "and team_member.team_member_grade_code = '1001') "
				+ "and team_view.member_code = (select code from member where id=?)";
		List<TeamDTO> list = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, login_id);
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					int code = rs.getInt("code");
					String logo_path = rs.getString("logo_path");
					String logo = rs.getString("logo");
					String name = rs.getString("name");
					String member_name = rs.getString("member_name");
					String member_phone = rs.getString("member_phone");

					list.add(new TeamDTO(code,logo_path,logo,name,member_name,member_phone));
				}
				return list;
			}
		}
	}

	// register_form : 팀 코드로 매치 선택하기 (단, 매치가 신청 완료 되었을 때 / 매치 등록, 신청 둘 다 검색)
	public List<CompetitionDTO> select_match_by_name(int code) throws Exception {
		String sql = "select * from mer_reg_list_view "
				+ "where (registration_team_code=? or application_team_code=?) and status_code=1301";

		List<CompetitionDTO> list = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, code);
			pstat.setInt(2, code);
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					int competition_registration_code = rs.getInt("competition_registration_code");
					int competition_kind_code = rs.getInt("competition_kind_code");
					String competition_kind_name = rs.getString("competition_kind_name");
					int competition_kind_headcount = rs.getInt("headcount");
					double latirude = rs.getDouble("latirude");
					double longitude = rs.getDouble("longitude");
					Timestamp competition_date = rs.getTimestamp("competition_date");

					list.add(new CompetitionDTO(competition_registration_code,competition_kind_code,competition_kind_name,competition_kind_headcount,latirude,longitude,competition_date));
				}
				return list;
			}
		}
	}

	// register_form : 용병 등록 존재 검사
	public boolean is_exist_mercenary_register(int team_code, int competition_registration_code) throws Exception {
		String sql = "select mrv.competition_registration_code, mr.team_code "
				+ "from mer_reg_list_view mrv "
				+ "left join mercenary_registration mr on mrv.competition_registration_code = mr.competition_result_code "
				+ "where mr.team_code = ? and mrv.competition_registration_code = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, team_code);
			pstat.setInt(2, competition_registration_code);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					return true; // 중복됨 (이미 이 팀의 이 매치에서는 용병을 등록했음)
				}else {
					return false; // 중복되지 않음
				}
			}
		}
	}

	// register_form : 용병 등록 insert문
	public int insert_register_mercenary(RegisterInfoDTO r) throws Exception {
		String sql = "insert into mercenary_registration values(MERCENARY_REGISTRATION_CODE.nextval,?,?,?,?,?,sysdate,null,null)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1,r.getCompetition_result_code());
			pstat.setInt(2,r.getTeam_code());
			pstat.setInt(3,r.getAbility_code());
			pstat.setInt(4,r.getHeadcount());
			pstat.setInt(5,r.getStatus_code());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// register_list : mercenary_regitstration_view에 몇 개의 record가 존재하는지 세줌
	private int getRecordCount(String searchOption, String searchWord) throws Exception{
		String sql = "select count(*) from mercenary_registration_view mrv "
				+ "join competition_view cv on mrv.competition_result_code = cv.competition_registration_code "
				+ "where " + searchOption + " like ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%"+searchWord+"%");

			try(ResultSet rs = pstat.executeQuery()){
				rs.next();
				return rs.getInt(1); // 컬럼 번호
			}
		}

	}

	// register_list : 네비게이터를 만들기 위해 필요한 초기 정보
	public String getPageNavi(int currentPage,String searchOption, String searchWord) throws Exception {
		int recordTotalCount = this.getRecordCount(searchOption, searchWord); // 1. 전체 글의 개수
		int recordCountPerPage = Settings.BOARD_RECORD_COUNT_PER_PAGE; // 2. 페이지당 보여줄 글의 개수
		int naviCountPerPage = Settings.BOARD_NAVI_COUNT_PER_PAGE; // 3. 페이지당 보여줄 네비게이터의 개수

		int pageTotalCount = 0;

		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1; 
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		// 화살표 만들기 위한 초기 설정
		boolean needPrev = true;
		boolean needNext = true;

		// 오버되지 않도록 조건 설정
		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}

		StringBuilder sb = new StringBuilder();

		if(searchWord == null) {
			// 왼쪽 화살표 만들기
			if(needPrev) {
				sb.append("<a href='/to_register_list.mercenary?cpage="+(startNavi-1)+"'>< </a> ");
			}

			// 중앙에 있는 네비게이터
			for(int i = startNavi;i <= endNavi;i++) {sb.append("<a href='/to_register_list.mercenary?cpage="+i+"'>" + i + "</a> ");}

			// 오른쪽 화살표 만들기
			if(needNext) {sb.append("<a href='/to_register_list.mercenary?cpage="+(endNavi+1)+"'>></a>");}
		}else {
			if(needPrev) {
				sb.append("<a href='/to_register_list.mercenary?cpage="+(startNavi-1)+"&searchOption="+searchOption+"&searchWord="+searchWord+"'>< </a> ");
			}

			for(int i = startNavi;i <= endNavi;i++) {sb.append("<a href='/to_register_list.mercenary?cpage="+i+"&searchOption="+searchOption+"&searchWord="+searchWord+"'>" + i + "</a> ");}

			if(needNext) {
				sb.append("<a href='/to_register_list.mercenary?cpage="+(endNavi+1)+"&searchOption="+searchOption+"&searchWord="+searchWord+"'>></a>");}
		}

		return sb.toString(); // 지금까지 축적된 String 반환
	}

	// register_list : 용병 등록한 리스트 출력
	public List<RegisterInfoDTO> select_register_list(int start, int end, String searchOption, String searchWord) throws Exception {
		String sql = "select * from (select mrv.code, mrv.competition_result_code, mrv.team_code, mrv.ability_code, mrv.headcount, "
				+ "    mrv.status_code, mrv.team_name, cv.latirude, cv.longitude, cv.competition_date, (select id from member where code = t.member_code) leader_id, "
				+ "    row_number() over(order by cv.competition_date asc ) rn "
				+ "    from mercenary_registration_view mrv "
				+ "    join competition_view cv on mrv.competition_result_code = cv.competition_registration_code "
				+ "    join team t on mrv.team_code = t.code "
				+ "    where " + searchOption + " like ?) "
				+ "where rn between ? and ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%"+searchWord+"%");
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			
			try(ResultSet rs = pstat.executeQuery();){
				List<RegisterInfoDTO> list = new ArrayList<>();
				while(rs.next()) {
					int code = rs.getInt("code");
					int competition_result_code = rs.getInt("competition_result_code");
					int team_code = rs.getInt("team_code");
					int ability_code = rs.getInt("ability_code");
					int headcount = rs.getInt("headcount");
					int status_code = rs.getInt("status_code");
					String name = rs.getString("team_name");
					double latirude = rs.getDouble("latirude");
					double longitude = rs.getDouble("longitude");
					Timestamp competition_date = rs.getTimestamp("competition_date");
					String leader_id = rs.getString("leader_id");

					list.add(new RegisterInfoDTO(code,competition_result_code,team_code,ability_code,headcount,status_code,name,latirude,longitude,competition_date,leader_id));
				}
				return list;
			}
		}
	}
	
	// register_modify_form : 용병 등록 수정하는 폼 정보 가져오기
	public ApplyDTO select_register_modify_form(int mercenary_registration_code) throws Exception {
		String sql = "select mrv.code, mrv.logo_path,mrv.logo, mrv.team_name, mrv.member_name, mrv.member_phone, mrlv.latirude, mrlv.longitude, "
				+ "mrlv.competition_date, mrlv.competition_kind_name, mrlv.headcount "
				+ "from mercenary_registration_view mrv "
				+ "join mer_reg_list_view mrlv on mrv.competition_result_code = mrlv.competition_registration_code "
				+ "where code=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1,mercenary_registration_code);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				int code = rs.getInt("code");
				String logo_path = rs.getString("logo_path");
				String logo = rs.getString("logo");
				String team_name = rs.getString("team_name");
				String member_name = rs.getString("member_name");
				String member_phone = rs.getString("member_phone");
				String competition_kind_name = rs.getString("competition_kind_name");
				int competition_kind_headcount = rs.getInt("headcount");
				double latirude = rs.getDouble("latirude");
				double longitude = rs.getDouble("longitude");
				Timestamp competition_date = rs.getTimestamp("competition_date");
				
				return new ApplyDTO(code,logo_path,logo,team_name,member_name,member_phone,competition_kind_name,competition_kind_headcount,latirude,longitude,competition_date);
			}
		}
	}
	
	// register_list : 해당하는 용병 등록 수정
	public int modify_mercenary_register(int code, int ability_code, int people_count) throws Exception {
		String sql = "update mercenary_registration set ability_code=?,headcount=? where code=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, ability_code);
			pstat.setInt(2, people_count);
			pstat.setInt(3, code);
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	// register_list : 해당하는 용병 등록 삭제 (mercenary_registration)
	public int delete_mercenary_registration(int code) throws Exception {
		String sql = "delete from mercenary_registration where code = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, code);
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	// register_list : 로그인 ID의 팀 코드와 신청하려는 팀 코드가 같은지 검사
	public boolean is_apply_same_team(String login_id, int team_code) throws Exception {
		String sql = "select * from member m "
				+ "join team_member tm on m.code = tm.member_code "
				+ "where m.id = ? and tm.team_code = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1,login_id);
			pstat.setInt(2,team_code);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next(); // 같은 팀이면 true 반환
			}
		}
	}

	// register_list : 매치에 이미 용병 등록되어있는지 검사
	public boolean is_exist_mercenary_apply(String login_id, int competition_result_code) throws Exception {
		String sql = "select ma.*,mr.competition_result_code from mercenary_application ma join mercenary_registration mr on ma.mercenary_registration_code = mr.code "
				+ "where member_code = (select code from member where id=?) and competition_result_code=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1,login_id);
			pstat.setInt(2,competition_result_code);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next(); // 이미 신청 했으면 true 반환
			}
		}
	}

	// apply_form : 전체 정보 가져오기
	public ApplyDTO select_apply_form_info(int mercenary_registration_code) throws Exception {
		String sql = "select mrv.*, ck.headcount competition_kind_headcount, ck.name, cr.competition_kind_code,cr.latirude,cr.longitude,cr.competition_date "
				+ "from mercenary_registration_view mrv "
				+ "left join competition_registration cr on mrv.competition_result_code = cr.code "
				+ "left join competition_kind ck on cr.competition_kind_code = ck.code "
				+ "where mrv.code=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, mercenary_registration_code);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				int code = rs.getInt("code");
				String logo_path = rs.getString("logo_path");
				String logo = rs.getString("logo");
				int team_code = rs.getInt("team_code");
				String team_name = rs.getString("team_name");
				String member_name = rs.getString("member_name");
				String member_phone = rs.getString("member_phone");
				String opposing_team_name = rs.getString("opposing_team_name");
				int ability_code = rs.getInt("ability_code");
				int competition_result_code = rs.getInt("competition_result_code");
				int competition_kind_code = rs.getInt("competition_kind_code");
				String competition_kind_name = rs.getString("name");
				int competition_kind_headcount = rs.getInt("competition_kind_headcount");
				double latirude = rs.getDouble("latirude");
				double longitude = rs.getDouble("longitude");
				Timestamp competition_date = rs.getTimestamp("competition_date");

				return new ApplyDTO(code,logo_path,logo,team_code,team_name,member_name,member_phone,opposing_team_name,ability_code,competition_result_code,competition_kind_code,competition_kind_name,competition_kind_headcount,latirude,longitude,competition_date);
			}
		}
	}

	// apply_form : 용병 신청 insert문
	public int insert_apply_mercenary(ApplyDTO d) throws Exception {
		String sql = "insert into mercenary_application values(mercenary_application_code.nextval,?,(select code from member where id=?),?,?,2201,sysdate,null,null)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1,d.getCode());
			pstat.setString(2,d.getLogin_id());
			pstat.setInt(3,d.getAbility_code());
			pstat.setString(4,d.getContent());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// apply_list : 용병 신청 리스트 출력
	public List<ApplyDTO> select_apply_list(ApplyDTO d) throws Exception {
		String sql = "select ma.code, ma.mercenary_registration_code,(select name from member where code = ma.member_code) mer_name, "
				+ "ma.content, mrv.team_code, cv.competition_registration_code, cv.competition_date "
				+ "from mercenary_application ma "
				+ "join mercenary_registration_view mrv on ma.mercenary_registration_code = mrv.code "
				+ "join competition_view cv on mrv.competition_result_code = cv.competition_registration_code "
				+ "where mrv.team_code = ? and cv.competition_registration_code = ? and ma.status_code=2201";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, d.getTeam_code());
			pstat.setInt(2, d.getCompetition_registration_code());
			try(ResultSet rs = pstat.executeQuery();){
				List<ApplyDTO> list = new ArrayList<>();
				while(rs.next()) {
					int mercenary_registration_code = rs.getInt("mercenary_registration_code");
					int team_code = rs.getInt("team_code");
					String member_name = rs.getString("mer_name");
					Timestamp competition_date = rs.getTimestamp("competition_date");
					String content = rs.getString("content");
					int competition_registration_code = rs.getInt("competition_registration_code");
					int mercenary_application_code = rs.getInt("code");

					list.add(new ApplyDTO(mercenary_registration_code,team_code,member_name,competition_date,content,competition_registration_code,mercenary_application_code));
				}
				return list;
			}
		}
	}

	// apply_list : 버튼에 따른 상태 변경
	public int modify_apply_list_status(String status, int mercenary_application_code) throws Exception {
		String sql = "";
		if(status.equals("accept")) {
			sql = "update mercenary_application set status_code = 2202 where code = ?"; // 수락
		}else {
			sql = "update mercenary_application set status_code = 2203 where code = ?"; // 거절
		}
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, mercenary_application_code);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}




}
