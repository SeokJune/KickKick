package dto;

public class ApplyInfoDTO {
	private String login_id;
	private int mercenary_registration_code;
	private int member_code;
	private int ability_code;
	private String contents;
	
	public ApplyInfoDTO() {}

	public ApplyInfoDTO(String login_id, int mercenary_registration_code, int member_code, int ability_code,
			String contents) {
		super();
		this.login_id = login_id;
		this.mercenary_registration_code = mercenary_registration_code;
		this.member_code = member_code;
		this.ability_code = ability_code;
		this.contents = contents;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public int getMercenary_registration_code() {
		return mercenary_registration_code;
	}

	public void setMercenary_registration_code(int mercenary_registration_code) {
		this.mercenary_registration_code = mercenary_registration_code;
	}

	public int getMember_code() {
		return member_code;
	}

	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	public int getAbility_code() {
		return ability_code;
	}

	public void setAbility_code(int ability_code) {
		this.ability_code = ability_code;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
}
