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

import dto.ApplyInfoDTO;
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
	
	// register_list : 용병 등록한 리스트 출력
	public List<RegisterInfoDTO> select_register_list() throws Exception {
		String sql = "select mre.code, mre.competition_result_code, mre.team_code, mre.ability_code, mre.headcount,"
				+ "mre.status_code, t.name, cr.latirude, cr.longitude, cr.competition_date "
				+ "from MERCENARY_REGISTRATION mre "
				+ "join team t on mre.team_code = t.code "
				+ "join competition_registration cr on mre.competition_result_code = cr.code";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List<RegisterInfoDTO> list = new ArrayList<>();
			while(rs.next()) {
				int code = rs.getInt("code");
				int competition_result_code = rs.getInt("competition_result_code");
				int team_code = rs.getInt("team_code");
				int ability_code = rs.getInt("ability_code");
				int headcount = rs.getInt("headcount");
				int status_code = rs.getInt("status_code");
				String name = rs.getString("name");
				double latirude = rs.getDouble("latirude");
				double longitude = rs.getDouble("longitude");
				Timestamp competition_date = rs.getTimestamp("competition_date");

				list.add(new RegisterInfoDTO(code,competition_result_code,team_code,ability_code,headcount,status_code,name,latirude,longitude,competition_date));
			}
			return list;
		}
	}
	
	// apply_form : 해당하는 팀에 대한 팀 정보
	public TeamDTO select_team_info(int team_code, int competition_result_code) throws Exception {
		String sql = "select tv.code,tv.logo_path,tv.logo,tv.name,tv.member_name,tv.member_phone "
				+ "from team_view tv "
				+ "join mercenary_registration mr on tv.code = mr.team_code "
				+ "where tv.code=? and mr.competition_result_code=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, team_code);
			pstat.setInt(2, competition_result_code);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				int code = rs.getInt("code");
				String logo_path = rs.getString("logo_path");
				String logo = rs.getString("logo");
				String name = rs.getString("name");
				String member_name = rs.getString("member_name");
				String member_phone = rs.getString("member_phone");

				return new TeamDTO(code,logo_path,logo,name,member_name,member_phone);
			}
		}
	}
	
	// apply_form : 해당하는 팀에 대한 매치 정보
	public CompetitionDTO select_match_info(int team_code, int competition_result_code) throws Exception {
		String sql = "select cv.competition_registration_code,cv.competition_kind_code,cv.competition_kind_name,cv.competition_kind_headcount,cv.latirude,cv.longitude,cv.competition_date "
				+ "from competition_view cv "
				+ "join mercenary_registration mr on cv.competition_registration_code = mr.competition_result_code "
				+ "where mr.team_code=? and mr.competition_result_code=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, team_code);
			pstat.setInt(2, competition_result_code);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				int competition_registration_code = rs.getInt("competition_registration_code");
				int competition_kind_code = rs.getInt("competition_kind_code");
				String competition_kind_name = rs.getString("competition_kind_name");
				int competition_kind_headcount = rs.getInt("competition_kind_headcount");
				double latirude = rs.getDouble("latirude");
				double longitude = rs.getDouble("longitude");
				Timestamp competition_date = rs.getTimestamp("competition_date");

				return new CompetitionDTO(competition_registration_code,competition_kind_code,competition_kind_name,competition_kind_headcount,latirude,longitude,competition_date);
			}
		}
	}
	
	// apply_form : 상대 팀 이름 출력
	public String select_opponent_team(int team_code, int competition_result_code, String team_name) throws Exception {
		String sql = "select registration_team_name, application_team_name "
				+ "from competition_view "
				+ "where (registration_team_code=? or application_team_code=?) and competition_registration_code=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, team_code);
			pstat.setInt(2, team_code);
			pstat.setInt(3, competition_result_code);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				String registration_team_name = rs.getString("registration_team_name");
				String application_team_name = rs.getString("application_team_name");
				
				if(team_name.equals(registration_team_name)) {
					return application_team_name;
				}else {
					return registration_team_name;
				}
			}
		}
	}
	
//	public ? select_apply_info(int code) throws Exception {
//		String sql = "select * from mercenary_registration_view mrv "
//				+ "left join competition_registration cr on mrv.competition_result_code = cr.code "
//				+ "where mrv.code=?";
//		try(
//				Connection con = this.getConnection();
//				PreparedStatement pstat = con.prepareStatement(sql);){
//			pstat.setInt(1, code);
//			try(ResultSet rs = pstat.executeQuery();){
//				rs.next();
//				String logo_path
//				String logo_name
//				String team_name
//				String member_name
//				String member_phone
//				String opposing_team_name
//				
//				int competition_result_code = rs.getInt("competition_result_code");
//				int competition_kind_code = rs.getInt("competition_kind_code");
//				String competition_kind_name = rs.getString("competition_kind_name");
//				int competition_kind_headcount = rs.getInt("competition_kind_headcount");
//				double latirude = rs.getDouble("latirude");
//				double longitude = rs.getDouble("longitude");
//				Timestamp competition_date = rs.getTimestamp("competition_date");
//			}
//		}
//	}
	
	// apply_form : 용병 신청 insert문
	public int insert_apply_mercenary(ApplyInfoDTO d) throws Exception {
		String sql = "insert into mercenary_application values(mercenary_application_code.nextval,?,(select code from member where id=?),?,?,2101,sysdate,null,null)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1,d.getMercenary_registration_code());
			pstat.setString(2,d.getLogin_id());
			pstat.setInt(3,d.getAbility_code());
			pstat.setString(4,d.getContent());
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	// apply_list : 용병 신청 리스트 출력
	public List<ApplyInfoDTO> select_apply_list(ApplyInfoDTO d) throws Exception {
		String sql = "select cr.code,cr.latirude,cr.longitude,cr.competition_date,(select name from member where code = ma.member_code) 이름, ma.content from mercenary_application ma "
				+ "join mercenary_registration mr on ma.mercenary_registration_code = mr.code "
				+ "join competition_registration cr on cr.code = mr.competition_result_code "
				+ "where mr.team_code in (select t.code from team t "
				+ "join member m on t.member_code = m.code "
				+ "where m.id=? and t.code=?) and cr.code=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, d.getLogin_id());
			pstat.setInt(2, d.getTeam_code());
			pstat.setInt(3, d.getCompetition_registration_code());
			try(ResultSet rs = pstat.executeQuery();){
				List<ApplyInfoDTO> list = new ArrayList<>();
				while(rs.next()) {
					String name = rs.getString("이름");
					String content = rs.getString("content");
					int competition_registration_code = rs.getInt("code");
					double latirude = rs.getDouble("latirude");
					double longitude = rs.getDouble("longitude");
					Timestamp competition_date = rs.getTimestamp("competition_date");
					
					list.add(new ApplyInfoDTO(name,content,competition_registration_code,latirude,longitude,competition_date));
				}
				return list;
			}
		}
	}
	




}
