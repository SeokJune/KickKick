package dto;

public class RegisterInfoDTO {
	private int code;
	private int competition_result_code;
	private int team_code;
	private int ability_code;
	private int headcount;
	private int status_code;

	public RegisterInfoDTO() {
	}

	public RegisterInfoDTO(int code, int competition_result_code, int team_code, int ability_code, int headcount, int status_code) {
		this.code = code;
		this.competition_result_code = competition_result_code;
		this.team_code = team_code;
		this.ability_code = ability_code;
		this.headcount = headcount;
		this.status_code = status_code;
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

}
