package dto;

import java.sql.Timestamp;

public class CompetitionApplyFormDTO {
private String team_name;
private String member_name;
private String member_phone;
private Timestamp competition_date;
private double latirude;
private double longitude;
private String content;
private int registration_code;
private String competition_name;
private int headcount;
private String ability_name;
private int member_code;
private int apply_teamcode;
public CompetitionApplyFormDTO() {}
public CompetitionApplyFormDTO(String team_name, String member_name, String member_phone, Timestamp competition_date,
		double latirude, double longitude, String content, int registration_code, String competition_name,
		int headcount, String ability_name, int member_code, int apply_teamcode) {
	super();
	this.team_name = team_name;
	this.member_name = member_name;
	this.member_phone = member_phone;
	this.competition_date = competition_date;
	this.latirude = latirude;
	this.longitude = longitude;
	this.content = content;
	this.registration_code = registration_code;
	this.competition_name = competition_name;
	this.headcount = headcount;
	this.ability_name = ability_name;
	this.member_code = member_code;
	this.apply_teamcode = apply_teamcode;
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
public Timestamp getCompetition_date() {
	return competition_date;
}
public void setCompetition_date(Timestamp competition_date) {
	this.competition_date = competition_date;
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
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getRegistration_code() {
	return registration_code;
}
public void setRegistration_code(int registration_code) {
	this.registration_code = registration_code;
}
public String getCompetition_name() {
	return competition_name;
}
public void setCompetition_name(String competition_name) {
	this.competition_name = competition_name;
}
public int getHeadcount() {
	return headcount;
}
public void setHeadcount(int headcount) {
	this.headcount = headcount;
}
public String getAbility_name() {
	return ability_name;
}
public void setAbility_name(String ability_name) {
	this.ability_name = ability_name;
}
public int getMember_code() {
	return member_code;
}
public void setMember_code(int member_code) {
	this.member_code = member_code;
}
public int getApply_teamcode() {
	return apply_teamcode;
}
public void setApply_teamcode(int apply_teamcode) {
	this.apply_teamcode = apply_teamcode;
}


}
