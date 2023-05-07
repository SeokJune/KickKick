package dto;

public class CompetitionApplicationListDTO {
private  String logo_path;
private  String logo;
private  String team_name;
private  String member_name;
private  String member_phone;
private  String ability_name;
private  String content;
private int team_code;
public CompetitionApplicationListDTO() {};
public CompetitionApplicationListDTO(String logo_path, String logo, String team_name, String member_name,
		String member_phone, String ability_name, String content, int team_code) {
	super();
	this.logo_path = logo_path;
	this.logo = logo;
	this.team_name = team_name;
	this.member_name = member_name;
	this.member_phone = member_phone;
	this.ability_name = ability_name;
	this.content = content;
	this.team_code = team_code;
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
public String getAbility_name() {
	return ability_name;
}
public void setAbility_name(String ability_name) {
	this.ability_name = ability_name;
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

}

