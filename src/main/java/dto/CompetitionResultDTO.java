package dto;

import java.sql.Timestamp;

public class CompetitionResultDTO {
private int competition_registration_code;
private int registration_team_code;
private int registration_team_score;
private int application_team_code;
private int application_team_score;
private Timestamp reg_date;
private Timestamp mod_date;
private Timestamp del_date;

public CompetitionResultDTO() {};
public CompetitionResultDTO(int competition_registration_code, int registration_team_code, int registration_team_score,
		int application_team_code, int application_team_score, Timestamp reg_date, Timestamp mod_date,
		Timestamp del_date) {
	super();
	this.competition_registration_code = competition_registration_code;
	this.registration_team_code = registration_team_code;
	this.registration_team_score = registration_team_score;
	this.application_team_code = application_team_code;
	this.application_team_score = application_team_score;
	this.reg_date = reg_date;
	this.mod_date = mod_date;
	this.del_date = del_date;
}
public int getCompetition_registration_code() {
	return competition_registration_code;
}
public void setCompetition_registration_code(int competition_registration_code) {
	this.competition_registration_code = competition_registration_code;
}
public int getRegistration_team_code() {
	return registration_team_code;
}
public void setRegistration_team_code(int registration_team_code) {
	this.registration_team_code = registration_team_code;
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
public int getApplication_team_score() {
	return application_team_score;
}
public void setApplication_team_score(int application_team_score) {
	this.application_team_score = application_team_score;
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
