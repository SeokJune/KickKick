package dto;

public class TeamInfoDTO {
	private String team_logo;
	private String team_name;
	private String name;
	private String phone;
	
	public TeamInfoDTO(){}
	public TeamInfoDTO(String team_logo, String team_name, String name, String phone) {
		super();
		this.team_logo = team_logo;
		this.team_name = team_name;
		this.name = name;
		this.phone = phone;
	}

	public String getTeam_logo() {
		return team_logo;
	}

	public void setTeam_logo(String team_logo) {
		this.team_logo = team_logo;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	};
	
}
