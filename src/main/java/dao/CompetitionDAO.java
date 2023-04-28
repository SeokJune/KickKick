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

import dto.AbilityDTO;
import dto.CompetitionKindDTO;

import dto.HometownDTO;
import dto.StatusDTO;
import dto.TeamDTO;

public class CompetitionDAO {

	private CompetitionDAO() {};

	private static CompetitionDAO instance= null;

	public synchronized static CompetitionDAO getinstance() {
		if(instance == null) {
			instance = new CompetitionDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();

		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}


	public List<AbilityDTO> ability() throws Exception{
		String sql = "select * from ability" ;
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();)
		{
			List<AbilityDTO> ability = new ArrayList<>();

			while(rs.next()) {

				int code = 	rs.getInt("code");
				String name = rs.getString("name");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");

				AbilityDTO dto = new AbilityDTO(code,name,reg_date,mod_date,del_date);
				ability.add(dto);

			}

			return ability;

		}
	}


	public List<CompetitionKindDTO> kind() throws Exception{
		String sql = "select * from competition_kind" ;
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();)
		{
			List<CompetitionKindDTO> kind = new ArrayList<>();

			while(rs.next()) {

				int code = 	rs.getInt("code");
				String name = rs.getString("name");
				int headcount = rs.getInt("headcount");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");

				CompetitionKindDTO dto = new CompetitionKindDTO(code,name,headcount,reg_date,mod_date,del_date);
				kind.add(dto);

			}

			return kind;

		}
	}

	public List<HometownDTO> hometown() throws Exception{
		String sql = "select * from hometown" ;
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();)
		{
			List<HometownDTO> place = new ArrayList<>();

			while(rs.next()) {

				int code = 	rs.getInt("code");
				String name = rs.getString("name");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");

				HometownDTO dto = new HometownDTO(code,name,reg_date,mod_date,del_date);
				place.add(dto);

			}

			return place;

		}
	}

	public List<TeamDTO> teamname() throws Exception{
		String sql = "select * from team" ;
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();)
		{
			List<TeamDTO> teamname = new ArrayList<>();

			while(rs.next()) {

				int code = 	rs.getInt("code");
				int logo_path_code = rs.getInt("logo_path_code");
				//				String logo_path = rs.getString("logo_path");
				//				String logo_name = rs.getString("logo_name");
				String logo = rs.getString("logo");
				String name = rs.getString("name");
				int member_code = rs.getInt("member_code");
				//				String member_name = rs.getString("member_name");
				//				String member_phone = rs.getString("member_phone");
				int hometown_code = rs.getInt("hometown_code");
				//				String hometown_name = rs.getString("hometown_name");
				String outline = rs.getString("outline");
				String content = rs.getString("content");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");

				TeamDTO dto = new TeamDTO(code,logo_path_code,logo,name,member_code,hometown_code,outline,content,reg_date,mod_date,del_date);
				teamname.add(dto);

			}

			return teamname;

		}
	}

	public TeamDTO team(String t) throws Exception{
		String sql = "select * from team_view where name = ?" ;
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{
			pstat.setString(1, t);

			try(ResultSet rs = pstat.executeQuery();){



				rs.next();

				int code = 	rs.getInt("code");
				int logo_path_code = rs.getInt("logo_path_code");
				String logo_path = rs.getString("logo_path");
				String logo_name = rs.getString("logo_name");
				String logo = rs.getString("logo");
				String name = rs.getString("name");
				int member_code = rs.getInt("member_code");
				String member_name = rs.getString("member_name");
				String member_phone = rs.getString("member_phone");
				int hometown_code = rs.getInt("hometown_code");
				String hometown_name = rs.getString("hometown_name");
				String outline = rs.getString("outline");
				String content = rs.getString("content");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");

				TeamDTO team = new TeamDTO(code,logo_path_code,logo_path,logo_name,logo,name,member_code,member_name,member_phone,hometown_code,hometown_name,outline,content,reg_date,mod_date,del_date);

				return team;




			}
		}


	}



	public List<StatusDTO> status() throws Exception{
		String sql = "select * from status" ;
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();)
		{
			List<StatusDTO> status = new ArrayList<>();

			while(rs.next()) {

				int code = 	rs.getInt("code");
				String name = rs.getString("name");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");

				StatusDTO dto = new StatusDTO(code,name,reg_date,mod_date,del_date);
				status.add(dto);

			}

			return status;

		}
	}




}
