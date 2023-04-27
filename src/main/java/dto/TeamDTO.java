package dto;

import java.sql.Timestamp;

public class TeamDTO {
	private int code;
	private int logo_path_code;
	private String logo_path;
	private String logo_name;
	private String logo;
	private String name;
	private int member_code;
	private String member_name;
	private String member_phone;
	private int hometown_code;
	private String homtown_name;
	private String outline;
	private String contect;
	private Timestamp reg_date;
	private Timestamp mod_date;
	private Timestamp del_date;

	public TeamDTO() {
	}

	public TeamDTO(int code, String name) {
		this.code = code;
		this.name = name;
	}

	public TeamDTO(int code, String logo_path, String logo, String name, String member_name, String member_phone) {
		super();
		this.code = code;
		this.logo_path = logo_path;
		this.logo = logo;
		this.name = name;
		this.member_name = member_name;
		this.member_phone = member_phone;
	}

	public TeamDTO(int code, int logo_path_code, String logo, String name, int member_code, int hometown_code, String outline, String contect, Timestamp reg_date, Timestamp mod_date, Timestamp del_date) {
		this.code = code;
		this.logo_path_code = logo_path_code;
		this.logo = logo;
		this.name = name;
		this.member_code = member_code;
		this.hometown_code = hometown_code;
		this.outline = outline;
		this.contect = contect;
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

	public int getLogo_path_code() {
		return logo_path_code;
	}

	public void setLogo_path_code(int logo_path_code) {
		this.logo_path_code = logo_path_code;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMember_code() {
		return member_code;
	}

	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	public int getHometown_code() {
		return hometown_code;
	}

	public void setHometown_code(int hometown_code) {
		this.hometown_code = hometown_code;
	}

	public String getOutline() {
		return outline;
	}

	public void setOutline(String outline) {
		this.outline = outline;
	}

	public String getContect() {
		return contect;
	}

	public void setContect(String contect) {
		this.contect = contect;
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
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
		return sdf.format(this.reg_date);
	}
}
