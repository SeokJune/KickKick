package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.TeamCheckDTO;
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
	
	public List<TeamCheckDTO> teamSelect(String loginID) throws Exception{
		String sql = "select tm.team_code, t.team_name from team_member tm join member m on tm.member_code = m.member_code join team t on tm.team_code = t.team_code "
				+ "join team_member_grade tmg on tm.member_grade_code = tmg.grade_code where m.id=? and tmg.grade_name='팀장'";
		List<TeamCheckDTO> teamList = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, loginID);
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					int team_code = rs.getInt("team_code");
					String team_name = rs.getString("team_name");
					
					teamList.add(new TeamCheckDTO(team_code,team_name));
				}
				return teamList;
			}
		}
	}
	
	public TeamInfoDTO selectTeamInfo(int search_team_code) throws Exception {
		String sql = "select t.team_logo,t.team_name,m.name,m.phone from member m join team_member tm on m.member_code=tm.member_code join team t on"
				+ " t.team_code=tm.team_code join team_member_grade tmg on tm.member_grade_code = tmg.grade_code where t.team_code=? and tm.member_grade_code=2";
		
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, search_team_code);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				
				String team_logo = rs.getString("team_logo");
				String team_name = rs.getString("team_name");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				
				return new TeamInfoDTO(team_logo,team_name,name,phone);
			}
		}
	}
	
	
	
	
	
}
