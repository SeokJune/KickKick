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

import dto.InquireAnswerDTO;

public class InquireAnswerDAO {
	private InquireAnswerDAO() {}
	private static InquireAnswerDAO instance = null;
	public synchronized static InquireAnswerDAO getInstance(){
		if(instance==null) {
			instance=new InquireAnswerDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	
	public List<InquireAnswerDTO> select_answer_list(int code) throws Exception{
		String sql = "select ia.code, ia.inquire_code,ia.content,s.name status,ia.reg_date from inquire_answer ia join status s on ia.status_code=s.code where inquire_code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, code);
			try(ResultSet rs = pstat.executeQuery()){
				List<InquireAnswerDTO> result = new ArrayList<>();
				while(rs.next()) {
					int answer_code = rs.getInt("code");
					int inquire_code = rs.getInt("inquire_code");
					String content = rs.getString("content");
					String status = rs.getString("status");
					Timestamp reg_date = rs.getTimestamp("reg_date");
					result.add(new InquireAnswerDTO(answer_code,inquire_code,content,status,reg_date));
				}
				return result;
			}
		}
	}
}
