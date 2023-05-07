package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ReportDTO;

public class ReportDAO {

	private ReportDAO() {}
	private static ReportDAO instance = null;
	public synchronized static ReportDAO getInstance() {
		if(instance==null) {
			instance=new ReportDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	
	public int insert(ReportDTO dto) throws Exception{
		String sql = "insert into report values(report_code.nextval,?,?,?,?,?,?,default,default,null,null)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, dto.getMember_code());
			pstat.setInt(2, dto.getBoard_kind_code());
			pstat.setInt(3, dto.getBoard_code());
			pstat.setInt(4, dto.getReply_code());
			pstat.setInt(5, dto.getReport_kind_code());
			pstat.setString(6, dto.getContent());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
