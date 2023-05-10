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

import commons.XSSUtils;
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
				+" r left join member m on r.member_code=m.code where r.board_"+board_table_name
				+"_code=? order by r.reg_date";
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
	
	public int count_reply(String board_table_name, int board_code) throws Exception{
		String sql = "select count(*) reply_count from reply_"+board_table_name+" where board_"+board_table_name+"_code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, board_code);
			try(ResultSet rs = pstat.executeQuery()){
				rs.next();
				return rs.getInt("reply_count");
			}
		}
	}
	
	//댓글 하나의 정보 담아보내기
	public ReplyDTO select_reply(String board_table_name, int code) throws Exception{
		String sql = "select r.code, r.board_"+board_table_name+"_code board_code, "
				+ "m.nickname member_nickname, r.content, r.like_count, r.reg_date, "
				+ "r.mod_date from reply_"+board_table_name
				+" r left join member m on r.member_code=m.code where r.code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, code);
			try(ResultSet rs = pstat.executeQuery()){
				ReplyDTO result = new ReplyDTO();
				while(rs.next()) {
					result.setCode(rs.getInt("code"));
					result.setBoard_code(rs.getInt("board_code"));
					result.setMember_nickname(rs.getString("member_nickname"));
					result.setContent(rs.getString("content"));
					result.setLike_count(rs.getInt("like_count"));
					result.setReg_date(rs.getTimestamp("reg_date"));
					result.setMod_date(rs.getTimestamp("mod_date"));
				}
				return result;
			}
		}
		
	}
	
	public int insert_reply(String board_table_name, ReplyDTO dto) throws Exception{
		String sql = "insert into reply_"+board_table_name+" values(reply_"+board_table_name+"_code.nextval,?,?,?,default,default,null,null)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, dto.getBoard_code());
			pstat.setInt(2, dto.getMember_code());
			pstat.setString(3, dto.getContent());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	} 
	
	public int delete_reply(String board_table_name, int code) throws Exception{
		String sql = "delete from reply_"+board_table_name+" where code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, code);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int update_reply(String board_table_name, ReplyDTO dto) throws Exception{
		String sql = "update reply_"+board_table_name+" set content=?, mod_date=sysdate where code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, dto.getContent());
			pstat.setInt(2, dto.getCode());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int like_reply(String board_table_name,int code) throws Exception{
		String sql = "update reply_"+board_table_name+" set like_count = like_count+1 where code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, code);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int select_like_count(String board_table_name,int code) throws Exception{
		String sql = "select like_count from reply_"+board_table_name+" where code=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, code);
			try(ResultSet rs = pstat.executeQuery()){
				rs.next();
				return rs.getInt("like_count");
			}
		}
	}
}
