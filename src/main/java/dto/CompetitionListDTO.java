package dto;

import java.sql.Timestamp;

public class CompetitionListDTO {
private String team_name;
private String member_name;
private String member_phone;
private double latirude;
private double longitude;
private Timestamp competition_date;
private int status_code;
private String status_name;
private String kind_name;
public CompetitionListDTO() {} ;
public CompetitionListDTO(String team_name, String member_name, String member_phone, double latirude, double longitude,
		Timestamp competition_date, int status_code, String status_name, String kind_name) {
	super();
	this.team_name = team_name;
	this.member_name = member_name;
	this.member_phone = member_phone;
	this.latirude = latirude;
	this.longitude = longitude;
	this.competition_date = competition_date;
	this.status_code = status_code;
	this.status_name = status_name;
	this.kind_name = kind_name;
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
public String getKind_name() {
	return kind_name;
}
public void setKind_name(String kind_name) {
	this.kind_name = kind_name;
}
}
