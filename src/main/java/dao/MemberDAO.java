package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	private static MemberDAO instance = null;
	public synchronized static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}

//아이디 중복 체크: 비동기로 수정 예정
	public boolean id_over_check(String member_id) throws Exception{
		String sql = "select * from members where id = ?";
		try( Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1,member_id);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}
	
	
	
	
	

}
