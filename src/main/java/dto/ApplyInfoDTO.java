package dto;

import java.sql.Timestamp;

public class ApplyInfoDTO {
	private String login_id;
	private int mercenary_registration_code;
	private int member_code;
	private int ability_code;
	private String name;
	private String content;
	private int team_code;
	private int competition_registration_code;
	private double latirude;
	private double longitude;
	private Timestamp competition_date;
	
	public ApplyInfoDTO() {}
	
	public ApplyInfoDTO(String login_id, int team_code, int competition_registration_code) {
		super();
		this.login_id = login_id;
		this.team_code = team_code;
		this.competition_registration_code = competition_registration_code;
	}
	
	public ApplyInfoDTO(String name, String content, int competition_registration_code, double latirude, double longitude,
			Timestamp competition_date) {
		super();
		this.name = name;
		this.content = content;
		this.competition_registration_code = competition_registration_code;
		this.latirude = latirude;
		this.longitude = longitude;
		this.competition_date = competition_date;
	}

	public ApplyInfoDTO(String login_id, int mercenary_registration_code, int member_code, int ability_code,
			String content) {
		super();
		this.login_id = login_id;
		this.mercenary_registration_code = mercenary_registration_code;
		this.member_code = member_code;
		this.ability_code = ability_code;
		this.content = content;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public int getMercenary_registration_code() {
		return mercenary_registration_code;
	}

	public void setMercenary_registration_code(int mercenary_registration_code) {
		this.mercenary_registration_code = mercenary_registration_code;
	}

	public int getMember_code() {
		return member_code;
	}

	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	public int getAbility_code() {
		return ability_code;
	}

	public void setAbility_code(int ability_code) {
		this.ability_code = ability_code;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getTeam_code() {
		return team_code;
	}


	public void setTeam_code(int team_code) {
		this.team_code = team_code;
	}

	public int getCompetition_registration_code() {
		return competition_registration_code;
	}

	public void setCompetition_registration_code(int competition_registration_code) {
		this.competition_registration_code = competition_registration_code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
}
