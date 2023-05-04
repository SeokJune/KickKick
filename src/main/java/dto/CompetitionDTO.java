package dto;

import java.sql.Timestamp;

public class CompetitionDTO {
	private int competition_registration_code;
	private int competition_kind_code;
	private String competition_kind_name;
	private int competition_kind_headcount;
	private double latirude;
	private double longitude;
	private Timestamp competition_date;
	private int registration_team_code;
	private String registration_team_name;
	private int registration_team_score;
	private int application_team_code;
	private String application_team_name;
	private int application_team_score;
	private int status_code;
	private String status_name;
	private Timestamp reg_date;
	private Timestamp mod_date;
	private Timestamp del_date;
	
	public CompetitionDTO() {}
	
	public CompetitionDTO(int competition_registration_code, int competition_kind_code, String competition_kind_name,
			int competition_kind_headcount, double latirude, double longitude, Timestamp competition_date) {
		super();
		this.competition_registration_code = competition_registration_code;
		this.competition_kind_code = competition_kind_code;
		this.competition_kind_name = competition_kind_name;
		this.competition_kind_headcount = competition_kind_headcount;
		this.latirude = latirude;
		this.longitude = longitude;
		this.competition_date = competition_date;
	}

	public CompetitionDTO(int competition_registration_code, int competition_kind_code, String competition_kind_name,
			int competition_kind_headcount, double latirude, double longitude, Timestamp competition_date,int registration_team_code, String registration_team_name,int registration_team_score,int application_team_code,String application_team_name,int application_team_score,int status_code,String status_name) {
		super();
		this.competition_registration_code = competition_registration_code;
		this.competition_kind_code = competition_kind_code;
		this.competition_kind_name = competition_kind_name;
		this.competition_kind_headcount = competition_kind_headcount;
		this.latirude = latirude;
		this.longitude = longitude;
		this.competition_date = competition_date;
		this.registration_team_code = registration_team_code;
		this.registration_team_name = registration_team_name;
		this.registration_team_score = registration_team_score;
		this.application_team_code = application_team_code;
		this.application_team_name = application_team_name;
		this.application_team_score = application_team_score;
		this.status_code = status_code;
		this.status_name = status_name;
	}

	public int getCompetition_registration_code() {
		return competition_registration_code;
	}

	public void setCompetition_registration_code(int competition_registration_code) {
		this.competition_registration_code = competition_registration_code;
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

	public int getRegistration_team_code() {
		return registration_team_code;
	}

	public void setRegistration_team_code(int registration_team_code) {
		this.registration_team_code = registration_team_code;
	}

	public String getRegistration_team_name() {
		return registration_team_name;
	}

	public void setRegistration_team_name(String registration_team_name) {
		this.registration_team_name = registration_team_name;
	}

	public int getRegistration_team_score() {
		return registration_team_score;
	}

	public void setRegistration_team_score(int registration_team_score) {
		this.registration_team_score = registration_team_score;
	}

	public int getApplication_team_code() {
		return application_team_code;
	}

	public void setApplication_team_code(int application_team_code) {
		this.application_team_code = application_team_code;
	}

	public String getApplication_team_name() {
		return application_team_name;
	}

	public void setApplication_team_name(String application_team_name) {
		this.application_team_name = application_team_name;
	}

	public int getApplication_team_score() {
		return application_team_score;
	}

	public void setApplication_team_score(int application_team_score) {
		this.application_team_score = application_team_score;
	}

	public int getStatus_code() {
		return status_code;
	}

	public void setStatus_code(int status_code) {
		this.status_code = status_code;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
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
	}
	
}
