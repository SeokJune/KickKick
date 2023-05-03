package dto;

import java.sql.Timestamp;

public class CompetitionRegistrationDTO {
	private int code;
	private int team_code;
	private int competition_kind_code;
	private double latirude;
	private double longitude;
	private Timestamp competition_date;
	private int ability_code;
	private String content;
	private int status_code;
	private Timestamp reg_date;
	private Timestamp mod_date;
	private Timestamp del_date;

	public CompetitionRegistrationDTO() {
	}

	public CompetitionRegistrationDTO(int code, int team_code, int competition_kind_code, double latirude, double longitude, Timestamp competition_date, int ability_code, String content, int status_code, Timestamp reg_date, Timestamp mod_date, Timestamp del_date) {
		this.code = code;
		this.team_code = team_code;
		this.competition_kind_code = competition_kind_code;
		this.latirude = latirude;
		this.longitude = longitude;
		this.competition_date = competition_date;
		this.ability_code = ability_code;
		this.content = content;
		this.status_code = status_code;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		this.del_date = del_date;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getTeam_code() {
		return team_code;
	}

	public void setTeam_code(int team_code) {
		this.team_code = team_code;
	}

	public int getCompetition_kind_code() {
		return competition_kind_code;
	}

	public void setCompetition_kind_code(int competition_kind_code) {
		this.competition_kind_code = competition_kind_code;
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

	public int getStatus_code() {
		return status_code;
	}

	public void setStatus_code(int status_code) {
		this.status_code = status_code;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public Timestamp getMod_date() {
		return mod_date;
	}

	public void setMod_date(Timestamp mod_date) {
		this.mod_date = mod_date;
	}

	public Timestamp getDel_date() {
		return del_date;
	}

	public void setDel_date(Timestamp del_date) {
		this.del_date = del_date;
	};

}
