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

import dto.ReplyDTO;

public class ReplyDAO {
	private ReplyDAO() {}
	private static ReplyDAO instance = null;
	public synchronized static ReplyDAO getInstance() {
		if(instance==null) {
			instance=new ReplyDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}

	
	//글 하나에 달린 댓글 리스트 담아보내기
	public List<ReplyDTO> select_reply_list(String board_table_name, int board_code) throws Exception{
		String sql = "select r.code, r.board_"+board_table_name
				+"_code \"board_code\", m.nickname \"member_nickname\", r.content, "
				+ "r.like_count, r.reg_date, r.mod_date from reply_"+board_table_name
				+" r join member m on R.MEMBER_CODE=m.code where r.board_"+board_table_name
				+"_code=? order by r.reg_date desc";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, board_code);
			try(ResultSet rs = pstat.executeQuery()){
				List<ReplyDTO> result = new ArrayList<>();
				while(rs.next()) {
					int code = rs.getInt("code");
					board_code = rs.getInt("board_code");
					String member_nickname = rs.getString("member_nickname");
					String content = rs.getString("content");
					int like_count = rs.getInt("like_count");
					Timestamp reg_date = rs.getTimestamp("reg_date");
					Timestamp mod_date = rs.getTimestamp("mod_date");
					result.add(new ReplyDTO(code,board_code,member_nickname,content,like_count,reg_date,mod_date));
				}
				return result;
			}
		}
		
	}
	
	//댓글 하나의 정보 담아보내기
	public ReplyDTO select_reply(String board_table_name, int code) throws Exception{
		String sql = "";
		
		ReplyDTO result = new ReplyDTO();
		return result;
	}
}
