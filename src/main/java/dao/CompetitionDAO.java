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

import commons.Settings;
import dto.AbilityDTO;
import dto.CompetitionApplicationDTO;
import dto.CompetitionApplicationListDTO;
import dto.CompetitionApplyFormDTO;
import dto.CompetitionDTO;
import dto.CompetitionKindDTO;
import dto.CompetitionListDTO;
import dto.CompetitionRegistrationDTO;
import dto.HometownDTO;
import dto.StatusDTO;
import dto.TeamDTO;

public class CompetitionDAO {

	private CompetitionDAO() {
	};

	private static CompetitionDAO instance = null;

	public synchronized static CompetitionDAO getinstance() {
		if (instance == null) {
			instance = new CompetitionDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context iCtx = new InitialContext();

		DataSource ds = (DataSource) iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}

	public List<AbilityDTO> ability() throws Exception {
		String sql = "select * from ability";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			List<AbilityDTO> ability = new ArrayList<>();

			while (rs.next()) {

				int code = rs.getInt("code");
				String name = rs.getString("name");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");

				AbilityDTO dto = new AbilityDTO(code, name, reg_date, mod_date, del_date);
				ability.add(dto);

			}

			return ability;

		}
	}

	public List<CompetitionKindDTO> kind() throws Exception {
		String sql = "select * from competition_kind";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			List<CompetitionKindDTO> kind = new ArrayList<>();

			while (rs.next()) {

				int code = rs.getInt("code");
				String name = rs.getString("name");
				int headcount = rs.getInt("headcount");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");

				CompetitionKindDTO dto = new CompetitionKindDTO(code, name, headcount, reg_date, mod_date, del_date);
				kind.add(dto);

			}

			return kind;

		}
	}

	public List<HometownDTO> hometown() throws Exception {
		String sql = "select * from hometown";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			List<HometownDTO> place = new ArrayList<>();

			while (rs.next()) {

				int code = rs.getInt("code");
				String name = rs.getString("name");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");

				HometownDTO dto = new HometownDTO(code, name, reg_date, mod_date, del_date);
				place.add(dto);

			}

			return place;

		}
	}

	public List<TeamDTO> teamname(int c) throws Exception {
		String sql = "select * from team where team.member_code = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);)

		{
			List<TeamDTO> teamname = new ArrayList<>();

			pstat.setInt(1, c);

			try (ResultSet rs = pstat.executeQuery();) {
				while (rs.next()) {

					int code = rs.getInt("code");
					int logo_path_code = rs.getInt("logo_path_code");
					// String logo_path = rs.getString("logo_path");
					// String logo_name = rs.getString("logo_name");
					String logo = rs.getString("logo");
					String name = rs.getString("name");
					int member_code = rs.getInt("member_code");
					// String member_name = rs.getString("member_name");
					// String member_phone = rs.getString("member_phone");
					int hometown_code = rs.getInt("hometown_code");
					// String hometown_name = rs.getString("hometown_name");
					String outline = rs.getString("outline");
					String content = rs.getString("content");
					Timestamp reg_date = rs.getTimestamp("reg_date");
					Timestamp mod_date = rs.getTimestamp("mod_date");
					Timestamp del_date = rs.getTimestamp("del_date");

					TeamDTO dto = new TeamDTO(code, logo_path_code, logo, name, member_code, hometown_code, outline,
							content, reg_date, mod_date, del_date);
					teamname.add(dto);

				}

				return teamname;
			}
		}
	}

	// 비동기
	public TeamDTO team(String t) throws Exception {
		String sql = "select * from team_view where code = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, t);

			try (ResultSet rs = pstat.executeQuery();) {

				rs.next();

				int code = rs.getInt("code");
				int logo_path_code = rs.getInt("logo_path_code");
				String logo_path = rs.getString("logo_path"); // 로고 이미 이름 전까지

				String logo_name = rs.getString("logo_name");
				String logo = rs.getString("logo"); // 사진 이름
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

				TeamDTO team = new TeamDTO(code, logo_path_code, logo_path, logo_name, logo, name, member_code,
						member_name, member_phone, hometown_code, hometown_name, outline, content, reg_date, mod_date,
						del_date);

				return team;

			}
		}

	}

	public List<StatusDTO> status() throws Exception {
		String sql = "select * from status";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			List<StatusDTO> status = new ArrayList<>();

			while (rs.next()) {

				int code = rs.getInt("code");
				String name = rs.getString("name");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp mod_date = rs.getTimestamp("mod_date");
				Timestamp del_date = rs.getTimestamp("del_date");

				StatusDTO dto = new StatusDTO(code, name, reg_date, mod_date, del_date);
				status.add(dto);

			}

			return status;

		}
	}

	public void insertreg(CompetitionRegistrationDTO dto) throws Exception {
		String sql = "insert into competition_registration values(competition_registration_code.nextval,?,?,?,?,?,?,?,?,sysdate,?,?)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);)

		{

			pstat.setInt(1, dto.getTeam_code());
			pstat.setInt(2, dto.getCompetition_kind_code());
			pstat.setDouble(3, dto.getLatirude());
			pstat.setDouble(4, dto.getLongitude());
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

	//리스트에 출력 -검색 - 등록 관련
	public List<CompetitionListDTO> search(String searching) throws Exception{
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
				+ "where cr.status_code = 1101 and cr.competition_date >= sysdate and tv.name like ? ";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)

		{
			pstat.setString(1,"%"+searching+"%");

			try(ResultSet rs = pstat.executeQuery();){


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
	}



	//신청할때 출력해주는 것 
	public CompetitionApplyFormDTO show_applyform(String date) throws Exception{
		String sql = "select tv.name team_name , tv.member_name, tv.member_phone, tv.logo_path, tv.logo , tv.member_code, \r\n"
				+ "cr.competition_date , cr.latirude, cr.longitude , cr.content, cr.code registration_code,\r\n"
				+ "ck.name competition_name , t.code apply_teamcode , ck.headcount , ab.name ability_name\r\n"
				+ "from competition_registration cr join  team_view tv on (cr.team_code=tv.code)\r\n"
				+ "join competition_kind ck on (cr.competition_kind_code = ck.code)\r\n"
				+ "join ability ab on (cr.ability_code = ab.code)\r\n" + "join team t on (cr.team_code= t.code)\r\n"
				+ "where cr.competition_date >= sysdate and cr.competition_date = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);)

		{
			pstat.setString(1, date);

			try (ResultSet rs = pstat.executeQuery();) {

				rs.next();

				String team_name = rs.getString("team_name");
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

				CompetitionApplyFormDTO dto = new CompetitionApplyFormDTO(team_name, member_name, member_phone,
						logo_path, logo, member_code, competition_date, latirude, longitude, content, registration_code,
						competition_name, headcount, ability_name, apply_teamcode);
				return dto;
			}
		}
	}

	// 신청할때 로그인한사람의 팀코드를 뽑아주는것
	public List<TeamDTO> getteamcode(int c) throws Exception {
		String sql = "select code,name from team where team.member_code = ? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);)

		{
			pstat.setInt(1, c);

			try (ResultSet rs = pstat.executeQuery();) {
				List<TeamDTO> list = new ArrayList<>();

				while(rs.next()) {
					int code = 	rs.getInt("code");
					String name = 	rs.getString("name");
					TeamDTO dto = new TeamDTO(code,name);
					list.add(dto);

				}

				return list;
			}
		}
	}

	// 신청했을떄 db에 들어가는 데이터
	public void apply(CompetitionApplicationDTO dto) throws Exception {
		String sql = "insert into competition_application values(competition_application_code.nextval,?,?,?,?,?,sysdate,?,?)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);)

		{

			pstat.setInt(1, dto.getCompetition_registration_code());
			pstat.setInt(2, dto.getTeam_code());
			pstat.setInt(3, dto.getAbility_code());
			pstat.setString(4, dto.getContent());
			pstat.setInt(5, dto.getStatus_code());
			pstat.setTimestamp(6, dto.getMod_date());
			pstat.setTimestamp(7, dto.getDel_date());

			pstat.executeUpdate();
			con.commit();

		}
	}

	// 로그인한 사람이랑 글쓴 사람이 같을떄 리스트에 출력 - 신청받아주거나 거절하거나
	public List<CompetitionApplicationListDTO> selectmatch(String rcode) throws Exception {
		String sql = "select tv.logo_path , tv.logo , tv.name team_name , tv.member_name , tv.member_phone, ab.name ability_name , ca.content, ca.team_code\r\n"
				+ "from competition_application ca join team_view tv on (ca.team_code = tv.code)\r\n"
				+ "join ability ab on (ca.ability_code = ab.code) where ca.competition_registration_code = ? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);)

		{

			pstat.setString(1, rcode);

			try (ResultSet rs = pstat.executeQuery();)

			{
				List<CompetitionApplicationListDTO> list = new ArrayList<>();

				while (rs.next()) {

					String logo_path = rs.getString("logo_path");
					String logo = rs.getString("logo");
					String team_name = rs.getString("team_name");
					String member_name = rs.getString("member_name");
					String member_phone = rs.getString("member_phone");
					String ability_name = rs.getString("ability_name");
					String content = rs.getString("content");
					int team_code = rs.getInt("team_code");

					CompetitionApplicationListDTO dto = new CompetitionApplicationListDTO(logo_path, logo, team_name,
							member_name, member_phone, ability_name, content, team_code);
					list.add(dto);

				}

				return list;
			}
		}
	}

	// 로그인한 사람이랑 글쓴 사람이 같을떄 리스트에서의 삭제하기를 눌렀을때
	public void delete_application(String delcode) throws Exception {
		String sql = "delete from competition_registration where code = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);)

		{
			pstat.setString(1, delcode);

			pstat.executeUpdate();
			con.commit();

		}
	}

	//신청폼에서 수락하기를 눌렀을때
	public void accept1(String reg_code , String team_code) throws Exception{
		String sql = "update competition_application set status_code = 1202 where COMPETITION_REGISTRATION_CODE = ? and team_code = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)

		{
			pstat.setString(1, reg_code);
			pstat.setString(2, team_code);

			pstat.executeUpdate();
			con.commit();

		}
	}
	
	//신청폼에서 수락되고 나머지
		public void accept2(String reg_code , String team_code) throws Exception{
			String sql = "update competition_application set status_code = 1203 where COMPETITION_REGISTRATION_CODE = ? and team_code != ? ";
			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);)

			{
				pstat.setString(1, reg_code);
				pstat.setString(2, team_code);

				pstat.executeUpdate();
				con.commit();

			}
		}
	
	

	//신청폼에서 거절하기를 눌렀을때
	public void refuse(String reg_code , String team_code) throws Exception{
		String sql = "update competition_application set status_code = 1203 where COMPETITION_REGISTRATION_CODE = ? and team_code = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)

		{
		
			pstat.setString(1, reg_code);
			pstat.setString(2, team_code);

			pstat.executeUpdate();
			con.commit();

		}
	}

	//게시판 페이지 기능 -1
	private int getRecordCount() throws Exception{

		String sql = "select count (*) from competition_registration";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()) {

			rs.next();
			return rs.getInt(1);
		}
	}

	//	//리스트에 출력 - 등록 관련
	//		public List<CompetitionListDTO> selectlist() throws Exception{
	//			String sql = "select tv.name team_name,\r\n"
	//					+ "tv.member_name,\r\n"
	//					+ "tv.member_phone,\r\n"
	//					+ "tv.logo_path,\r\n"
	//					+ "tv.logo,\r\n"
	//					+ "cr.latirude,\r\n"
	//					+ "cr.longitude,\r\n"
	//					+ "cr.competition_date,\r\n"
	//					+ "cr.STATUS_CODE,\r\n"
	//					+ "st.name status_name,\r\n"
	//					+ "ck.name kind_name , cr.code \r\n"
	//					+ "from \r\n"
	//					+ "competition_registration cr join team_view tv on (cr.team_code=tv.code)\r\n"
	//					+ "join status st on (cr.status_code = st.code)\r\n"
	//					+ "join competition_kind ck on (cr.competition_kind_code = ck.code)\r\n"
	//					+ "where cr.status_code = 1101 and cr.competition_date >= sysdate" ;
	//			
	//			
	//			
	//			try(Connection con = this.getConnection();
	//					PreparedStatement pstat = con.prepareStatement(sql);
	//					ResultSet rs = pstat.executeQuery();)
	//			{
	//				List<CompetitionListDTO> list = new ArrayList<>();
	//
	//				while(rs.next()) {
	//					String team_name = 	rs.getString("team_name");
	//					String member_name = rs.getString("member_name");
	//					String member_phone = rs.getString("member_phone");
	//					String logo_path = rs.getString("logo_path");
	//					String logo = rs.getString("logo");
	//					double latirude = rs.getDouble("latirude");
	//					double longitude = rs.getDouble("longitude");
	//					Timestamp competition_date = rs.getTimestamp("competition_date");
	//					int status_code = rs.getInt("status_code");
	//					String status_name = rs.getString("status_name");
	//					String kind_name = rs.getString("kind_name");
	//					int code = rs.getInt("code");
	//
	//					CompetitionListDTO dto = new CompetitionListDTO(team_name,member_name,member_phone,logo_path,logo,latirude,longitude,competition_date,status_code,status_name,kind_name,code);
	//					list.add(dto);
	//				}
	//				return list;
	//			}
	//		}
	//

	//	//게시판 페이지 기능 -2
	//	public List<CompetitionRegistrationDTO> select_cr(int start, int end) throws Exception{
	//		String sql = "select * from (select competition_registration.* , row_number() over(order by code desc) rn\r\n"
	//				+ "from competition_registration)\r\n"
	//				+ "where rn between ? and ? "; 
	//
	//		try(Connection con = this.getConnection();
	//				PreparedStatement pstat = con.prepareStatement(sql);) {
	//
	//			pstat.setInt(1, start);
	//			pstat.setInt(2, end);
	//
	//			try(ResultSet rs = pstat.executeQuery()) {
	//
	//				List<CompetitionRegistrationDTO> list = new ArrayList<> ();
	//				while(rs.next()) {
	//					
	//					int code = rs.getInt("code");
	//					int team_code = rs.getInt("team_code");
	//					int competition_kind_code = rs.getInt("competition_kind_code");
	//					double latirude = rs.getDouble("latirude");
	//					double longitude = rs.getDouble("longitude");
	//					Timestamp competition_date = rs.getTimestamp("competition_date");
	//					int ability_code = rs.getInt("abiltiy_code");
	//					String content = rs.getString("content");
	//					int status_code = rs.getInt("status_code");
	//					Timestamp reg_date = rs.getTimestamp("reg_date");
	//					Timestamp mod_date =rs.getTimestamp("mod_date");
	//					Timestamp del_date =rs.getTimestamp("del_date");
	//					
	//					
	//
	//	CompetitionRegistrationDTO dto = new CompetitionRegistrationDTO(code,team_code,competition_kind_code,latirude,longitude,competition_date ,ability_code,content,status_code,reg_date,mod_date,del_date);
	//					list.add(dto);
	//				}
	//				return list;
	//			}
	//		}
	//	}
	//	

	//게시판 페이지 기능 -2
	public List<CompetitionListDTO> selectlist(int start ,int end) throws Exception{
		String sql = "select tv.name team_name, tv.member_name, tv.member_phone,tv.logo_path,\r\n"
				+ "tv.logo, cr.latirude, cr.longitude, cr.competition_date, cr.STATUS_CODE,\r\n"
				+ "st.name status_name, ck.name kind_name , cr.code\r\n"
				+ "from(select competition_registration.* , row_number() over(order by code desc) rn from competition_registration ) cr\r\n"
				+ "join team_view tv on (cr.team_code=tv.code)\r\n"
				+ "join status st on (cr.status_code = st.code)\r\n"
				+ "join competition_kind ck on (cr.competition_kind_code = ck.code)\r\n"
				+ "where rn between ? and  ? and  cr.status_code = 1101 and cr.competition_date >= sysdate " ;



		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)

		{
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs = pstat.executeQuery()){

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

				}return list;
			}

		}
	
	}

	//게시판 페이지 기능 -3
	//네비게이터를 만들기 위해 필요한 초기정보
	public String getPageNavi(int currentPage) throws Exception{


		int recordTotalCount =this.getRecordCount();     //1. 전체 글의 개수 :  글의 개수를 record total count라는 변수라는 이름으로 만든다;
		int recordCountPerPage = Settings.BOARD_RECORD_COUNT_PER_PAGE ;   //2. 한 페이지당 보여주는 글의 개수
		int naviCountPerPage = Settings.BOARD_NAVI_COUNT_PER_PAGE;      //3. 페이지당 보여줄 네비게이터의 개수

		int pageTotalCount = 0;          //4. 1번과 2번 항목에의해 총 페이지의 개수가 정해진다

		if(recordTotalCount % recordCountPerPage > 0 ) {
			pageTotalCount = recordTotalCount/ recordCountPerPage +1; 
		}else{
			pageTotalCount = recordTotalCount/ recordCountPerPage;
		}

		// 전체글의 개수를 페이지당 보여줄 글의 개수로 나눌때, 나머지가 발생하면 페이지+1 / 나머지 발생하지않으면 그대로

		//   int currentPage = 4 ; 현재 나의 페이지(내가 있는 페이지)


		if(currentPage<1) {
			currentPage = 1;    
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount ; 
		}

		int startNavi = ( currentPage-1) /naviCountPerPage * naviCountPerPage  + 1 ; // 컴퓨터는 나눗셈을 하면 몫만 빼온다 ex) 28/10 = 2.8(x) 2 (O)
		int endNavi = startNavi + (naviCountPerPage - 1 );

		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount ;    // 총페이지 navi보단 endnavi가 더 클수없다
		}
		System.out.println("현재페이지 : " + currentPage);
		System.out.println("네비 시작 값 : " + startNavi);
		System.out.println("네비 끝 값 : " + endNavi);

		boolean needPrev =true;
		boolean needNext = true ;

		if(startNavi == 1) {needPrev= false;}
		if(endNavi == pageTotalCount) {needNext= false;}

		StringBuilder sb = new StringBuilder(); //문자열 조립용 클래스

		if(needPrev) {
			sb.append("<a href= '/list.competition?cpage="+(startNavi-1)+"'> < </a> ");
		}

		for(int i  = startNavi ; i<= endNavi ; i ++) {
			sb.append("<a href= '/list.competition?cpage="+i+"'>" + i + "</a> ");
		} //- cpage 관련 코드

		if(needNext) {
			sb.append("<a href= '/list.competition?cpage="+(endNavi+1)+"'> > </a> ");
		}
		return sb.toString() ;
	}
	}
