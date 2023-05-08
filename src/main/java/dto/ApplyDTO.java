package dto;

import java.sql.Timestamp;

public class ApplyDTO {
	private int code; // mercenary_registration_code
	private String logo_path;
	private String logo;
	private int team_code;
	private String team_name;
	private String member_name;
	private String member_phone;
	private String opposing_team_name;
	private int ability_code;
	private int competition_result_code;
	private int competition_kind_code;
	private String competition_kind_name;
	private int competition_kind_headcount;
	private double latirude;
	private double longitude;
	private Timestamp competition_date;
	
	private String login_id;
	private int member_code;
	private String content;
	private int competition_registration_code;
	
	private int mercenary_application_code;
	
	public ApplyDTO() {}

	public ApplyDTO(int team_code, int competition_registration_code) {
		super();
		this.team_code = team_code;
		this.competition_registration_code = competition_registration_code;
	}

	public ApplyDTO(int code, int ability_code, String login_id, String content) {
		super();
		this.code = code;
		this.ability_code = ability_code;
		this.login_id = login_id;
		this.content = content;
	}
	
	public ApplyDTO(int code, int team_code, String member_name, Timestamp competition_date, String content,
			int competition_registration_code, int mercenary_application_code) {
		super();
		this.code = code;
		this.team_code = team_code;
		this.member_name = member_name;
		this.competition_date = competition_date;
		this.content = content;
		this.competition_registration_code = competition_registration_code;
		this.mercenary_application_code = mercenary_application_code;
	}
	
	// register_modify_form
	public ApplyDTO(int code, String logo_path, String logo, String team_name, String member_name, String member_phone,
			String competition_kind_name, int competition_kind_headcount, double latirude, double longitude,
			Timestamp competition_date) {
		super();
		this.code = code;
		this.logo_path = logo_path;
		this.logo = logo;
		this.team_name = team_name;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.competition_kind_name = competition_kind_name;
		this.competition_kind_headcount = competition_kind_headcount;
		this.latirude = latirude;
		this.longitude = longitude;
		this.competition_date = competition_date;
	}

	public ApplyDTO(int code, String logo_path, String logo, int team_code, String team_name, String member_name,
			String member_phone, String opposing_team_name, int ability_code, int competition_result_code,
			int competition_kind_code, String competition_kind_name, int competition_kind_headcount, double latirude, double longitude,
			Timestamp competition_date) {
		super();
		this.code = code;
		this.logo_path = logo_path;
		this.logo = logo;
		this.team_code = team_code;
		this.team_name = team_name;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.opposing_team_name = opposing_team_name;
		this.ability_code = ability_code;
		this.competition_result_code = competition_result_code;
		this.competition_kind_code = competition_kind_code;
		this.competition_kind_name = competition_kind_name;
		this.competition_kind_headcount = competition_kind_headcount;
		this.latirude = latirude;
		this.longitude = longitude;
		this.competition_date = competition_date;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getLogo_path() {
		return logo_path;
	}

	public void setLogo_path(String logo_path) {
		this.logo_path = logo_path;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public int getTeam_code() {
		return team_code;
	}

	public void setTeam_code(int team_code) {
		this.team_code = team_code;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getOpposing_team_name() {
		return opposing_team_name;
	}

	public void setOpposing_team_name(String opposing_team_name) {
		this.opposing_team_name = opposing_team_name;
	}

	public int getAbility_code() {
		return ability_code;
	}

	public void setAbility_code(int ability_code) {
		this.ability_code = ability_code;
	}

	public int getCompetition_result_code() {
		return competition_result_code;
	}

	public void setCompetition_result_code(int competition_result_code) {
		this.competition_result_code = competition_result_code;
	}

	public int getCompetition_kind_code() {
		return competition_kind_code;
	}

	public void setCompetition_kind_code(int competition_kind_code) {
		this.competition_kind_code = competition_kind_code;
	}

	public String getCompetition_kind_name() {
		return competition_kind_name;
	}

	public void setCompetition_kind_name(String competition_kind_name) {
		this.competition_kind_name = competition_kind_name;
	}

	public int getCompetition_kind_headcount() {
		return competition_kind_headcount;
	}

	public void setCompetition_kind_headcount(int competition_kind_headcount) {
		this.competition_kind_headcount = competition_kind_headcount;
	}
	
	public double getLatirude() {
		return latirude;
	}

	public void setLatirude(double latirude) {
		this.latirude = latirude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public Timestamp getCompetition_date() {
		return competition_date;
	}

	public void setCompetition_date(Timestamp competition_date) {
		this.competition_date = competition_date;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public int getMember_code() {
		return member_code;
	}

	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCompetition_registration_code() {
		return competition_registration_code;
	}

	public void setCompetition_registration_code(int competition_registration_code) {
		this.competition_registration_code = competition_registration_code;
	}

	public int getMercenary_application_code() {
		return mercenary_application_code;
	}

	public void setMercenary_application_code(int mercenary_application_code) {
		this.mercenary_application_code = mercenary_application_code;
	}
	
}
