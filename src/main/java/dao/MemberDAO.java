package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import dto.MemberDTO;

public class MemberDAO {

	private static MemberDAO instance = null;

	public static MemberDAO getInstance() {
		if (instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource) iCtx.lookup("java:/comp/env/jdbc/ora");

		return ds.getConnection();
	}

	public boolean is_member(String id, String pw) throws Exception {
		String sql = "select * from member where id=? and pw=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			pstat.setString(2, pw);

			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	} // is_member

	// 아이디 중복 체크: 비동기
	public boolean id_over_check(String member_id) throws Exception {
		String sql = "select * from member where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, member_id);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}// id_over_check

	// 전화번호 중복 체크: 비동기
	// 이미 가입된 전화번호가 있는지 check
	public boolean phone_over_check(String phone) throws Exception {
		String sql = "select * from member where phone = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, phone);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}// phone_over_check

	// 이메일 중복 체크: 비동기
	public boolean email_over_check(String member_email) throws Exception {
		String sql = "select * from member where email = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, member_email);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}// email_over_check

	// 회원가입
	public int insert_new_member(MemberDTO dto) throws Exception {
		String sql = "insert into member values(MEMBER_CODE.NEXTVAL,1001,?,?,?,?,?,?,?,?,1001,SYSDATE,NULL,NULL)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getNick_name());
			pstat.setString(5, dto.getBirth_date());
			pstat.setString(6, dto.getPhone());
			pstat.setString(7, dto.getEmail());
			pstat.setString(8, dto.getAgree());
			int result = pstat.executeUpdate();
			con.commit();
			return result;

		}
	}// insert_new_member
	
	//내정보 조회
	public MemberDTO select_member(String member_id) throws Exception{
		String sql = "select * from member where id = ?";
		try( Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1,member_id);
			
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				int code = rs.getInt("code");
				String id = rs.getString("id");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String birthdate = rs.getString("birthdate");
				String email = rs.getString("email");
				String nickname = rs.getString("nickname");
				
				MemberDTO dto = new MemberDTO(code,0,id,null,name,nickname,birthdate,phone,email,null,0,null,null,null);
				return	dto;
			}
		}
	}

	public String get_id_by_phone(String phone) throws Exception {
		String sql = "select id from member where phone = ?";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, phone);
			String result="";
			try(ResultSet rs = pstat.executeQuery()){
				while(rs.next()) {
					result = rs.getString("id");
				}
			}
			return result;
		}
	}
	
	public int update_pw(String pw,String id) throws Exception {
		String sql = "update member set pw =? where id=?";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, pw);
			pstat.setString(2, id);
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	
}