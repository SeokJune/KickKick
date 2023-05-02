package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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

	// 닉네임 중복 체크: 비동기
	public boolean nickname_over_check(String member_nickname) throws Exception {
		String sql = "select * from member where nickname = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, member_nickname);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}// nickname_over_check

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
					String id = rs.getString("id");
					String pw = rs.getString("pw");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					String birthdate = rs.getString("birthdate");
					String email = rs.getString("email");
					String nickname = rs.getString("nickname");
					
					MemberDTO dto = new MemberDTO(0,0,id,pw,name,nickname,birthdate,phone,email,null,0,null,null,null);
					return	dto;
				}
			}
		}

	public String get_id_by_phone(String phone) throws Exception {
		String sql = "select id from member where phone = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, phone);
			String result = "";
			try (ResultSet rs = pstat.executeQuery()) {
				while (rs.next()) {
					result = rs.getString("id");
				}
			}
			return result;
		}
	}

	public int update_pw(String pw, String id) throws Exception {
		String sql = "update member set pw =? where id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, pw);
			pstat.setString(2, id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	//내정보 수정
		public int modify_member(MemberDTO dto) throws Exception{
			String sql = "update member set pw=? , nickname=?, birthdate=?, phone=?, email=?, mod_date=sysdate where id=?";
			try( Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);){
				pstat.setString(1, dto.getPw());
				pstat.setString(2, dto.getNick_name());
				pstat.setString(3, dto.getBirth_date());
				pstat.setString(4, dto.getPhone());
				pstat.setString(5, dto.getEmail());
				pstat.setString(6, dto.getId());
				int result = pstat.executeUpdate();
				con.commit();
				return result;
			}
		}

	public MemberDTO get_info_by_id(String id) throws Exception {
		String sql = "select code, nickname from member where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			MemberDTO result = new MemberDTO();
			try (ResultSet rs = pstat.executeQuery()) {
				while (rs.next()) {
					result.setCode(rs.getInt("code"));
					result.setNick_name(rs.getString("nickname"));;
				}
			}
			return result;
		}
	}

	//멤버코드 가져오기
	public String get_memberCode_by_id(String id) throws Exception {
		String sql = "select code from member where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			String result = "";
			try (ResultSet rs = pstat.executeQuery()) {
				while (rs.next()) {
					result = rs.getString("code");
				}
			}
			return result;
		}
	}
	
	//회원 탈퇴
			public int delete_member(String id) throws Exception{
				String sql = "delete from member where id = ?";
				try (Connection con = this.getConnection(); 
						PreparedStatement pstat = con.prepareStatement(sql);) {
					pstat.setString(1, id);
					int result = pstat.executeUpdate();
					con.commit();
					return result;
				}
			}

}