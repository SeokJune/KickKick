package dto;

public class TeamCheckDTO {
	private int team_code;
	private String team_name;
	
	public TeamCheckDTO() {}
	public TeamCheckDTO(int team_code, String team_name) {
		super();
		this.team_code = team_code;
		this.team_name = team_name;
	}
	
	public int getTeam_code() {
		return team_code;
	}
	public void setTeam_code(int team_code) {
		this.team_code = team_code;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	
}
