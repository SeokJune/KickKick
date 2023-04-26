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

import dto.CreateTeamDTO;
import dto.HometownDTO;

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

	public List<HometownDTO> select() throws Exception {
		String sql = "select * from hometown";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			
			List<HometownDTO> arr = new ArrayList<>();
			while(rs.next()) {
				int code = rs.getInt("code");
				String name = rs.getString("name");

				HometownDTO dto = new HometownDTO(code, name);	
				arr.add(dto);
			}
			return arr;
		}
	}
	
	public int insertTeam(CreateTeamDTO dto) throws Exception {
		String sql = "insert into team values(?,?,?,?,?,?,?,?,sysdate,null,null)"; 
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);) {


				pstat.setInt(1, dto.getCode());
				pstat.setInt(2, dto.getLogo_path_code());
				pstat.setString(3, dto.getLogo());
				pstat.setString(4, dto.getName());
				pstat.setInt(5, dto.getMember_code());
				pstat.setInt(6, dto.getHometown_code());
				pstat.setString(7, dto.getOutline());
				pstat.setString(8, dto.getContect());
				
				int result = pstat.executeUpdate();
				con.commit();

				return result;

			}
		
	}
	
	public List<CreateTeamDTO> selectTeam() throws Exception {
		String sql = "select * from T"; 
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);
					ResultSet rs = pstat.executeQuery();) {
				
				List<CreateTeamDTO> arr = new ArrayList();
				
				while(rs.next()) {
					int code = rs.getInt("code");
					int logo_path_code = rs.getInt("logo_path_code");
					String logo = rs.getString("logo");
					String name = rs.getString("name");
					int member_code = rs.getInt("member_code");
					int hometown_code = rs.getInt("hometown_code");
					String outline = rs.getString("outline");
					String contect = rs.getString("contect");
					Timestamp reg_date = rs.getTimestamp("reg_date");
					Timestamp mod_date = rs.getTimestamp("mod_date");
					Timestamp del_date = rs.getTimestamp("del_date");
							
					
					CreateTeamDTO dto = new CreateTeamDTO(code, logo_path_code, logo, name, member_code, hometown_code, outline, contect, reg_date, mod_date, del_date);
					arr.add(dto);
				}
				return arr;
			}
	}
}
