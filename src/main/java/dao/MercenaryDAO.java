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
					int team_code = rs.getInt("code");
					String logo_path = rs.getString("logo_path");
					String logo = rs.getString("logo");
					String name = rs.getString("name");
					String member_name = rs.getString("member_name");
					String member_phone = rs.getString("member_phone");
					
					list.add(new TeamDTO(team_code,logo_path,logo,name,member_name,member_phone));
				}
				return list;
			}
		}
	}
	
	public List<CompetitionDTO> select_match_by_name(int code) throws Exception {
		String sql = "select competition_kind_code,latirude,longitude,competition_date,competition_kind_headcount "
				+ "from competition_view "
				+ "where (registration_team_code=? or application_team_code=?) and status_code=1202;";
		
		List<CompetitionDTO> list = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, code);
			pstat.setInt(2, code);
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					int competition_kind_code = rs.getInt("competition_kind_code");
					int competition_kind_headcount = rs.getInt("competition_kind_headcount");
					int latirude = rs.getInt("latirude");
					int longitude = rs.getInt("longitude");
					Timestamp competition_date = rs.getTimestamp("competition_date");
					
					list.add(new CompetitionDTO(competition_kind_code,competition_kind_headcount,latirude,longitude,competition_date));
				}
				return list;
			}
		}
	}
	
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
	
	public List<RegisterInfoDTO> select_register_list() throws Exception {
		String sql = "select mre.code, mre.competition_result_code, mre.team_code, mre.ability_code, mre.headcount,"
				+ "mre.status_code, t.name, cr.latirude, cr.longitude, cr.competition_date "
				+ "from MERCENARY_REGISTRATION mre "
				+ "join team t on mre.team_code = t.code "
				+ "join competition_registration cr on cr.team_code = t.code";
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
				int latirude = rs.getInt("latirude");
				int longitude = rs.getInt("longitude");;
				Timestamp competition_date = rs.getTimestamp("competition_date");
				
				list.add(new RegisterInfoDTO(code,competition_result_code,team_code,ability_code,headcount,status_code,name,latirude,longitude,competition_date));
			}
			return list;
		}
	}
	
	
	/*
	public TeamInfoDTO select_team_info(int sc_team_code, int sc_competition_result_code) throws Exception {
		String sql = "select t.team_code,t.team_logo,t.team_name,m.name,m.phone, mr.competition_result_code "
				+ "from member m join team_member tm on m.member_code=tm.member_code "
				+ "join team t on t.team_code=tm.team_code "
				+ "join team_member_grade tmg on tm.member_grade_code = tmg.grade_code "
				+ "join mercenary_registration mr on t.team_code = mr.team_code "
				+ "where tm.member_grade_code=2 and t.team_code=? and mr.competition_result_code=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, sc_team_code);
			pstat.setInt(2, sc_competition_result_code);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				int team_code = rs.getInt("team_code");
				String team_logo = rs.getString("team_logo");
				String team_name = rs.getString("team_name");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				
				return new TeamInfoDTO(team_code,team_logo,team_name,name,phone);
			}
		}
	}
	*/
//	public ? select_match_info(int sc_team_code, int sc_competition_result_code) throws Exception {
//		String sql = "";
//		try(
//				Connection con = this.getConnection();
//				PreparedStatement pstat = con.prepareStatement(sql);){
//			pstat.setInt(1, sc_team_code);
//			pstat.setInt(2, sc_competition_result_code);
//			try(ResultSet rs = pstat.executeQuery();){
//				
//				
//			}
//		}
//	}
	
	
	
	
	
}
