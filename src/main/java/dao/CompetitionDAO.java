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
import dto.CompetitionListDTO;
import dto.CompetitionRegistrationDTO;
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

	//비동기
	public TeamDTO team(String t) throws Exception{
		String sql = "select * from team_view where code = ?" ;
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{
			pstat.setString(1, t);

			try(ResultSet rs = pstat.executeQuery();){



				rs.next();

				int code = 	rs.getInt("code");
				int logo_path_code = rs.getInt("logo_path_code");
				String logo_path = rs.getString("logo_path"); //로고 이미 이름 전까지 
				
				String logo_name = rs.getString("logo_name"); 
				String logo = rs.getString("logo"); //사진 이름
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


	public void insertreg(CompetitionRegistrationDTO dto) throws Exception{
		String sql = "insert into competition_registration values(competition_registration_code.nextval,?,?,?,?,?,?,?,?,sysdate,?,?)";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)

		{

			pstat.setInt(1, dto.getTeam_code());
			pstat.setInt(2, dto.getCompetition_kind_code());
			pstat.setDouble(3, dto.getLatirude());
			pstat.setDouble(4,dto.getLongitude());
			pstat.setTimestamp(5, dto.getCompetition_date());
			pstat.setInt(6, dto.getAbility_code());
			pstat.setString(7, dto.getContent());
			pstat.setInt(8, dto.getStatus_code());
			pstat.setTimestamp(9, dto.getMod_date());
			pstat.setTimestamp(10, dto.getDel_date());

			pstat.executeUpdate();
			con.commit();

		}
	}


	//리스트에 출력 - 등록 관련
	public List<CompetitionListDTO> selectlist() throws Exception{
		String sql = "select tv.name team_name,\r\n"
				+ "tv.member_name,\r\n"
				+ "tv.member_phone,\r\n"
				+ "tv.logo_path,\r\n"
				+ "tv.logo,\r\n"
				+ "cr.latirude,\r\n"
				+ "cr.longitude,\r\n"
				+ "cr.competition_date,\r\n"
				+ "cr.STATUS_CODE,\r\n"
				+ "st.name status_name,\r\n"
				+ "ck.name kind_name\r\n"
				+ "from \r\n"
				+ "competition_registration cr join team_view tv on (cr.team_code=tv.code)\r\n"
				+ "join status st on (cr.status_code = st.code)\r\n"
				+ "join competition_kind ck on (cr.competition_kind_code = ck.code)\r\n"
				+ "where cr.status_code = 1101 and cr.competition_date >= sysdate" ;
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();)
		{
			List<CompetitionListDTO> list = new ArrayList<>();

			while(rs.next()) {
				String team_name = 	rs.getString("team_name");
				String member_name = rs.getString("member_name");
				String member_phone = rs.getString("member_phone");
				String logo_path = rs.getString("logo_path");
				String logo = rs.getString("logo");
				double latirude = rs.getDouble("latirude");
				double longitude = rs.getDouble("longitude");
				Timestamp competition_date = rs.getTimestamp("competition_date");
				int status_code = rs.getInt("status_code");
				String status_name = rs.getString("status_name");
				String kind_name = rs.getString("kind_name");


				CompetitionListDTO dto = new CompetitionListDTO(team_name,member_name,member_phone,logo_path,logo,latirude,longitude,competition_date,status_code,status_name,kind_name);
				list.add(dto);
			}
			return list;
		}
	}

	//	//리스트에 출력 - 팀관련
	//	public List<TeamDTO> selectlist_Team() throws Exception{
	//		String sql = "select t.name , t.member_name , t.member_phone  from  competition_registration c\r\n"
	//				+ "left join team_view t\r\n"
	//				+ "on c.team_code = t.code" ;
	//
	//		try(Connection con = this.getConnection();
	//				PreparedStatement pstat = con.prepareStatement(sql);
	//				ResultSet rs = pstat.executeQuery();)
	//		{
	//			List<TeamDTO> list = new ArrayList<>();
	//
	//			while(rs.next()) {
	//
	//				String name = rs.getString("name");
	//				String member_name = rs.getString("member_name");
	//				String member_phone = rs.getString("member_phone");
	//
	//
	//				TeamDTO dto = new TeamDTO(name,member_name,member_phone);
	//
	//
	//				list.add(dto);
	//			}
	//			return list;
	//		}
	//	}




}
