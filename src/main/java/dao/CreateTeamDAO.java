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

import dto.TeamDTO;
import dto.HometownDTO;
import dto.MemberDTO;

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


	public List<HometownDTO> selectHometown() throws Exception {
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

	public int insertTeam(TeamDTO dto) throws Exception {
		String sql = "insert into team values(team_code.nextval,?,?,?,?,?,?,?,sysdate,null,null)"; 
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {


			pstat.setInt(1, dto.getLogo_path_code());
			pstat.setString(2, dto.getLogo());
			pstat.setString(3, dto.getName());
			pstat.setInt(4, dto.getMember_code());
			pstat.setInt(5, dto.getHometown_code());
			pstat.setString(6, dto.getOutline());
			pstat.setString(7, dto.getContect());
			

			int result = pstat.executeUpdate();
			System.out.println("여기4");
			con.commit();
			System.out.println("여기5");

			return result;

		}

	}

	public boolean team_nameExist(String team_name) throws Exception {
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

	public List<TeamDTO> selectTeam() throws Exception {
		String sql = "select * from team"; 
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {

			List<TeamDTO> arr = new ArrayList();

			while(rs.next()) {
				int code = rs.getInt("code");
				int logo_path_code = rs.getInt("logo_path_code");
				String logo = rs.getString("logo");
				String name = rs.getString("name");
				int member_code = rs.getInt("member_code");
				int hometown_code = rs.getInt("hometown_code");
				String outline = rs.getString("outline");
				String content = rs.getString("content");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");


				TeamDTO dto = new TeamDTO(code, logo_path_code, logo, name, member_code, hometown_code, outline, content, reg_date, mod_date, del_date);
				arr.add(dto);
			}
			return arr;
		}
	}
}
