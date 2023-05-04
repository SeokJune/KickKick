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
		String sql = "select \r\n"
				+ "l.path as logo_path,\r\n"
				+ "t.logo,\r\n"
				+ "t.name as team_name,\r\n"
				+ "h.name as hometown_name,\r\n"
				+ "m.name as leader,\r\n"
				+ "t.code as team_code\r\n"
				+ "from team t \r\n"
				+ "left join logo_path l on t.logo_path_code = l.code\r\n"
				+ "left join hometown h on h.code = t.hometown_code\r\n"
				+ "left join member m on m.code = t.member_code\r\n"
				+ "where t.code in   \r\n"
				+ "(select team_code from team_member where member_code = ?)\r\n";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, member_code);
			try (ResultSet rs = pstat.executeQuery()) {

				List<TeamDTO> list = new ArrayList<TeamDTO>();
				while (rs.next()) {
					String logo_path = rs.getString("logo_path");
					String logo = rs.getString("logo");
					String team_name = rs.getString("team_name");
					String hometown_name = rs.getString("hometown_name");
					String leader = rs.getString("leader");
					int team_code = rs.getInt("team_code");
					TeamDTO dto = new TeamDTO(team_code, logo_path, logo, team_name,leader,hometown_name);
					list.add(dto);
				}
				return list;
			}
		}
	}

	//검색한 팀이름으로 팀리스트들 가져오기
	public List<TeamDTO> search_team_list(int memeber_code, String search_team) throws Exception {
		String sql = "select \r\n"
				+ "l.path as logo_path,\r\n"
				+ "t.logo,\r\n"
				+ "t.name as team_name,\r\n"
				+ "h.name as hometown_name,\r\n"
				+ "m.nickname as leader,\r\n"
				+ "t.code as team_code\r\n"
				+ "from team t \r\n"
				+ "left join logo_path l on t.logo_path_code = l.code\r\n"
				+ "left join hometown h on h.code = t.hometown_code\r\n"
				+ "left join member m on m.code = t.member_code\r\n"
				+ "where t.code in   \r\n"
				+ "(select team_code from team_member where member_code = ?)\r\n"
				+ "and t.name like ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1,memeber_code);
			pstat.setString(2, "%"+search_team+"%");
			
			try (ResultSet rs = pstat.executeQuery()) {
				List<TeamDTO> list = new ArrayList<TeamDTO>();
				while (rs.next()) {
					String logo_path = rs.getString("logo_path");
					String logo = rs.getString("logo");
					String team_name = rs.getString("team_name");
					String hometown_name = rs.getString("hometown_name");
					String leader = rs.getString("leader");
					int team_code = rs.getInt("team_code");
					TeamDTO dto = new TeamDTO(team_code, logo_path, logo, team_name,leader,hometown_name);
					list.add(dto);
				}
				return list;
			}

		}
	}

}
