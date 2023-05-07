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
import dto.CompetitionApplicationDTO;
import dto.CompetitionApplicationListDTO;
import dto.CompetitionApplyFormDTO;
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
				+ "ck.name kind_name , cr.code \r\n"
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
				int code = rs.getInt("code");

				CompetitionListDTO dto = new CompetitionListDTO(team_name,member_name,member_phone,logo_path,logo,latirude,longitude,competition_date,status_code,status_name,kind_name,code);
				list.add(dto);
			}
			return list;
		}
	}

	//신청할때 출력해주는 것
	public CompetitionApplyFormDTO show_applyform(String date) throws Exception{
		String sql = "select tv.name team_name , tv.member_name, tv.member_phone, tv.logo_path, tv.logo , tv.member_code, \r\n"
				+ "cr.competition_date , cr.latirude, cr.longitude , cr.content, cr.code registration_code,\r\n"
				+ "ck.name competition_name , t.code apply_teamcode , ck.headcount , ab.name ability_name\r\n"
				+ "from competition_registration cr join  team_view tv on (cr.team_code=tv.code)\r\n"
				+ "join competition_kind ck on (cr.competition_kind_code = ck.code)\r\n"
				+ "join ability ab on (cr.ability_code = ab.code)\r\n"
				+ "join team t on (cr.team_code= t.code)\r\n"
				+ "where cr.competition_date >= sysdate and cr.competition_date = ?" ;
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)

		{
			pstat.setString(1, date);

			try(ResultSet rs = pstat.executeQuery();){


				rs.next();

				String team_name = 	rs.getString("team_name");
				String member_name = rs.getString("member_name");
				String member_phone = rs.getString("member_phone");
				String logo_path = rs.getString("logo_path");
				String logo = rs.getString("logo");
				int member_code = rs.getInt("member_code");
				Timestamp competition_date = rs.getTimestamp("competition_date");
				double latirude = rs.getDouble("latirude");
				double longitude = rs.getDouble("longitude");
				String content = rs.getString("content");
				int registration_code = rs.getInt("registration_code");
				String competition_name = rs.getString("competition_name");
				int headcount = rs.getInt("headcount");
				String ability_name = rs.getString("ability_name");
				int apply_teamcode = rs.getInt("apply_teamcode");

				CompetitionApplyFormDTO dto = new CompetitionApplyFormDTO(team_name,member_name,member_phone,logo_path,logo,member_code, competition_date,latirude,longitude,content,registration_code,competition_name,headcount,ability_name,apply_teamcode);
				return dto;
			}
		}
	}

	//신청했을떄 db에 들어가는 데이터
	public void apply(CompetitionApplicationDTO dto) throws Exception{
		String sql = "insert into competition_application values(competition_application_code.nextval,?,?,?,?,?,sysdate,?,?)";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)

		{

			pstat.setInt(1, dto.getCompetition_registration_code());
			pstat.setInt(2, dto.getTeam_code());
			pstat.setInt(3,dto.getAbility_code());
			pstat.setString(4, dto.getContent());
			pstat.setInt(5, dto.getStatus_code());
			pstat.setTimestamp(6, dto.getMod_date());
			pstat.setTimestamp(7, dto.getDel_date());

			pstat.executeUpdate();
			con.commit();

		}
	}


	//로그인한 사람이랑 글쓴 사람이 같을떄 리스트에 출력 - 신청받아주거나 거절하거나
	public List<CompetitionApplicationListDTO> selectmatch(String rcode) throws Exception{
		String sql = "select tv.logo_path , tv.logo , tv.name team_name , tv.member_name , tv.member_phone, ab.name ability_name , ca.content, ca.team_code\r\n"
				+ "from competition_application ca join team_view tv on (ca.team_code = tv.code)\r\n"
				+ "join ability ab on (ca.ability_code = ab.code) where ca.competition_registration_code = ? ";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)

		{

			pstat.setString(1, rcode);

			try( ResultSet rs = pstat.executeQuery(); )
			
			{
				List<CompetitionApplicationListDTO> list = new ArrayList<>();

				while(rs.next()) {

					String logo_path = 	rs.getString("logo_path");
					String logo = 	rs.getString("logo");
					String team_name = 	rs.getString("team_name");
					String member_name = 	rs.getString("member_name");
					String member_phone = 	rs.getString("member_phone");
					String ability_name = 	rs.getString("ability_name");
					String content = 	rs.getString("content");
					int team_code = 	rs.getInt("team_code");

					CompetitionApplicationListDTO dto = new CompetitionApplicationListDTO(logo_path,logo,team_name,member_name,member_phone,ability_name,content,team_code);
					list.add(dto);
					
				}
				
				return list;
			}
		}
	}

	//로그인한 사람이랑 글쓴 사람이 같을떄 리스트에서의 삭제하기를 눌렀을때
	public void delete_application(String delcode) throws Exception{
		String sql = "delete from competition_registration where code = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)

		{
			pstat.setString(1, delcode);

			pstat.executeUpdate();
			con.commit();

		}
	}



}
