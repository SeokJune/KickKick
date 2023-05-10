package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class InquireDTO {
	private int code;
	private int member_code;
	private String member_nickname;
	private int report_kind_code;
	private String report_kind_name;
	private String content;
	private int status_code;
	private String status_name;
	private Timestamp reg_date;
	private Timestamp mod_date;
	private Timestamp del_date;
	
	public InquireDTO() {}
	//기본 테이블 컬럼 생성자
	public InquireDTO(int code, int member_code, int report_kind_code, String content, int status_code,
			Timestamp reg_date, Timestamp mod_date, Timestamp del_date) {
		super();
		this.code = code;
		this.member_code = member_code;
		this.report_kind_code = report_kind_code;
		this.content = content;
		this.status_code = status_code;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		this.del_date = del_date;
	}
	//insert할 때 쓸 생성자
	public InquireDTO(int member_code, int report_kind_code, String content) {
		this.member_code = member_code;
		this.report_kind_code = report_kind_code;
		this.content = content;
	}
	//select_list 할 때 쓸 생성자
	public InquireDTO(int code, String member_nickname, String report_kind_name, String content, String status_name, Timestamp reg_date) {
		this.code = code;
		this.member_nickname = member_nickname;
		this.report_kind_name = report_kind_name;
		this.content = content;
		this.status_name = status_name;
		this.reg_date = reg_date;
	}
	
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getReport_kind_name() {
		return report_kind_name;
	}
	public void setReport_kind_name(String report_kind_name) {
		this.report_kind_name = report_kind_name;
	}
	public String getStatus_name() {
		return status_name;
	}
	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	public int getReport_kind_code() {
		return report_kind_code;
	}
	public void setReport_kind_code(int report_kind_code) {
		this.report_kind_code = report_kind_code;
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

	public String getCalculated_date() {
		Timestamp reg_date = this.getReg_date();
		int SEC = 60;
		int MIN = 60;
		int HOUR = 24;
		int DAY = 30;
		int MONTH = 12;

		long curTime = System.currentTimeMillis();
		long writeTime = reg_date.getTime();
		long diffTime = (curTime - writeTime) / 1000;

		String msg = null;

		if (diffTime < SEC) {
			// sec
			msg = diffTime + "초전";
		} else if ((diffTime /= SEC) < MIN) {
			// min
			msg = diffTime + "분전";
		} else if ((diffTime /= MIN) < HOUR) {
			// hour
			msg = (diffTime) + "시간전";
		}
		// else if ((diffTime /= HOUR) < DAY) {
		// // day
		// msg = (diffTime ) + "일전";
		// } else if ((diffTime /= DAY) < MONTH) {
		// // month
		// msg = (diffTime ) + "달전";
		// }
		else {
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			msg = sdf.format(reg_date);
		}
		return msg;
	}
}
