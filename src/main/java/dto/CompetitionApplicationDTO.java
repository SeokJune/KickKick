package dto;

import java.sql.Timestamp;

public class CompetitionApplicationDTO {
private int code;
private int competition_registration_code ;
private int team_code;
private int ability_code;
private String content;
private int status_code;
private Timestamp reg_date;
private Timestamp mod_date;
private Timestamp del_date;

public CompetitionApplicationDTO() {} ;

public CompetitionApplicationDTO(int code, int competition_registration_code, int team_code, int ability_code,
		String content, int status_code, Timestamp reg_date, Timestamp mod_date, Timestamp del_date) {
	super();
	this.code = code;
	this.competition_registration_code = competition_registration_code;
	this.team_code = team_code;
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

public int getCompetition_registration_code() {
	return competition_registration_code;
}

public void setCompetition_registration_code(int competition_registration_code) {
	this.competition_registration_code = competition_registration_code;
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
}

}
