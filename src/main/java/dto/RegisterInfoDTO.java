package dto;

import java.sql.Timestamp;

public class RegisterInfoDTO {
	private int code;
	private int competition_result_code;
	private int team_code;
	private int ability_code;
	private int headcount;
	private int status_code;
	private String name;
	private double latirude;
	private double longitude;
	private Timestamp competition_date;
	private String leader_id;
	
	public RegisterInfoDTO() {}
	public RegisterInfoDTO(int code, int competition_result_code, int team_code, int ability_code, int headcount,
			int status_code, String name, double latirude, double longitude, Timestamp competition_date,
			String leader_id) {
		super();
		this.code = code;
		this.competition_result_code = competition_result_code;
		this.team_code = team_code;
		this.ability_code = ability_code;
		this.headcount = headcount;
		this.status_code = status_code;
		this.name = name;
		this.latirude = latirude;
		this.longitude = longitude;
		this.competition_date = competition_date;
		this.leader_id = leader_id;
	}

	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getCompetition_result_code() {
		return competition_result_code;
	}
	public void setCompetition_result_code(int competition_result_code) {
		this.competition_result_code = competition_result_code;
	}
	public int getTeam_code() {
		return team_code;
	}
	public void setTeam_code(int team_code) {
		this.team_code = team_code;
	}
	public int getAbility_code() {
		return ability_code;
	}
	public void setAbility_code(int ability_code) {
		this.ability_code = ability_code;
	}
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}
	public int getStatus_code() {
		return status_code;
	}
	public void setStatus_code(int status_code) {
		this.status_code = status_code;
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
	public String getLeader_id() {
		return leader_id;
	}
	public void setLeader_id(String leader_id) {
		this.leader_id = leader_id;
	}
	
}
