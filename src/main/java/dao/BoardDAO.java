package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BoardHeadlineDTO;

public class BoardDAO {
	private BoardDAO() {}
	private static BoardDAO instance = null;
	public synchronized static BoardDAO getInstance() {
		if(instance==null) {
			instance=new BoardDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}

	//	public int insert(BoardDTO dto) throws Exception{
	//		String sql1 = "select table_name from board_kind where code=?";
	//		String board_name;
	//		String headline_name;
	//		try(Connection con = this.getConnection()){				
	//			try(PreparedStatement pstat = con.prepareStatement(sql1)){
	//				pstat.setInt(1, dto.getBoard_kind_code());
	//				try(ResultSet rs = pstat.executeQuery()){
	//					while(rs.next()) {
	//						board_name = rs.getString("table_name");
	//					}
	//				}
	//			}
	//
	//			String sql2 = "insert into ? values(?,?)";
	//			try(PreparedStatement pstat = con.prepareStatement(sql2)){
	//				pstat.setString(1, board_name);
	//				pstat.setString(2, dto.getBoard_headline_code());
	//			}
	//		}
	//	}

	public List<BoardHeadlineDTO> select_board_headline() throws Exception{
		String sql = "select h.code, h.name, b.code as \"board_kind_code\", b.name as \"board_name\" from board_kind b join board_headline h on b.code=h.board_kind_code";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()){
			List<BoardHeadlineDTO> result = new ArrayList<>();
			while(rs.next()) {
				int code = rs.getInt("code");
				String name = rs.getString("name");
				int board_kind_code = rs.getInt("board_kind_code");
				String board_name = rs.getString("board_name");
				result.add(new BoardHeadlineDTO(code,name,board_kind_code,board_name));
			}
			return result;
		}
	}
}
