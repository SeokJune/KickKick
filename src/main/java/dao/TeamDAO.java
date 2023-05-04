package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.TeamDTO;

public class TeamDAO {
	private static TeamDAO instance = null;

	public static TeamDAO getInstance() {
		if (instance == null) {
			instance = new TeamDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource) iCtx.lookup("java:/comp/env/jdbc/ora");

		return ds.getConnection();
	}

	// 내 팀 리스트 가져오기
	public List<TeamDTO> my_team_list(int member_code) throws Exception {
		String sql = "select team.*, (select path from logo_path where logo_path.code = team.logo_path_code) logo_path, (select name from hometown where hometown.code = team.hometown_code) hometown_name from team where code in (select team_code from team_member where member_code= ?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, member_code);
			try (ResultSet rs = pstat.executeQuery()) {

				List<TeamDTO> list = new ArrayList<TeamDTO>();
				while (rs.next()) {
					int team_code = rs.getInt("code");
					String logo_path = rs.getString("logo_path");
					String logo = rs.getString("logo");
					String team_name = rs.getString("name");
					String hometown_name = rs.getString("hometown_name");
					TeamDTO dto = new TeamDTO(team_code, logo_path, logo, team_name, hometown_name);
					list.add(dto);
				}
				return list;
			}
		}
	}

	//검색한 팀이름으로 팀리스트들 가져오기
	public List<TeamDTO> search_team_list(String search_team) throws Exception {
		String sql = "select * from team where name like ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, "%"+search_team+"%");
			
			try (ResultSet rs = pstat.executeQuery()) {
				List<TeamDTO> list = new ArrayList<TeamDTO>();
				while (rs.next()) {
					int team_code = rs.getInt("code");
					String logo_path = rs.getString("logo_path");
					String logo = rs.getString("logo");
					String team_name = rs.getString("name");
					String hometown_name = rs.getString("hometown_name");
					TeamDTO dto = new TeamDTO(team_code, logo_path, logo, team_name, hometown_name);
					list.add(dto);
				}
				return list;
			}

		}
	}

}
