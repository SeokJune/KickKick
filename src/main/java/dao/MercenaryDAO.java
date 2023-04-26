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

import dto.MatchInfoDTO;
import dto.RegisterInfoDTO;
import dto.TeamInfoDTO;


public class MercenaryDAO {
	TeamInfoDTO tdto = new TeamInfoDTO();
	
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
	
	public List<TeamInfoDTO> select_team_by_id(String login_id) throws Exception{
		String sql = "select t.team_code,t.team_logo,t.team_name,m.name,m.phone from team_member tm join member m on tm.member_code = m.member_code join team t on tm.team_code = t.team_code "
				+ "join team_member_grade tmg on tm.member_grade_code = tmg.grade_code where m.id=? and tmg.grade_name='팀장'";
		List<TeamInfoDTO> team_select_list = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, login_id);
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					int team_code = rs.getInt("team_code");
					String team_logo = rs.getString("team_logo");
					String team_name = rs.getString("team_name");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					
					team_select_list.add(new TeamInfoDTO(team_code,team_logo,team_name,name,phone));
				}
				return team_select_list;
			}
		}
	}
	
	public List<MatchInfoDTO> select_match_by_name(String team_name) throws Exception {
		String sql = "select mr.match_place, mr.match_date, mr.match_kind_code, mr.match_person_count, mr.match_ability "
				+ "from match_register mr join team t on mr.register_team_code = t.team_code where t.team_name=?";
		
		List<MatchInfoDTO> matchList = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, team_name);
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					String match_place = rs.getString("match_place");
					Timestamp match_date = rs.getTimestamp("match_date");
					int match_kind_code = rs.getInt("match_kind_code");
					int match_person_count = rs.getInt("match_person_count");
					String match_ability = rs.getString("match_ability");
					
					matchList.add(new MatchInfoDTO(match_place,match_date,match_kind_code,match_person_count,match_ability));
				}
				return matchList;
			}
		}
	}
	
	public int register_mercenary(RegisterInfoDTO r) throws Exception {
		String sql = "insert into mercenary_registration values(MERCENARY_REGISTRATION_CODE.nextval,?,?,?,?,?)";
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
	
	
	
	
	
	
}
