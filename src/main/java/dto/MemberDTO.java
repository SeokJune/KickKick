package dto;

import java.sql.Timestamp;

public class MemberDTO {
	private int code;
	private int join_kind_code;
	private String id;
	private String pw;
	private String name;
	private String nick_name;
	private String birth_date;
	private String phone;
	private String email;
	private String agree;
	private int authority_grade_code;
	private Timestamp reg_date;
	private Timestamp mod_date;
	private Timestamp del_date;

	public MemberDTO() {
	}

	public MemberDTO(int code, int join_kind_code, String id, String pw, String name, String nick_name, String birth_date, String phone, String email, String agree, int authority_grade_code, Timestamp reg_date, Timestamp mod_date, Timestamp del_date) {
		this.code = code;
		this.join_kind_code = join_kind_code;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nick_name = nick_name;
		this.birth_date = birth_date;
		this.phone = phone;
		this.email = email;
		this.agree = agree;
		this.authority_grade_code = authority_grade_code;
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

	public int getJoin_kind_code() {
		return join_kind_code;
	}

	public void setJoin_kind_code(int join_kind_code) {
		this.join_kind_code = join_kind_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public String getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAgree() {
		return agree;
	}

	public void setAgree(String agree) {
		this.agree = agree;
	}

	public int getAuthority_grade_code() {
		return authority_grade_code;
	}

	public void setAuthority_grade_code(int authority_grade_code) {
		this.authority_grade_code = authority_grade_code;
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
