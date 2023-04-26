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

	//아이디 중복 체크: 비동기
	public boolean id_over_check(String member_id) throws Exception {
		String sql = "select * from members where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, member_id);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}//id_over_check


}