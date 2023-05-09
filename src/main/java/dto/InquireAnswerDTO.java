package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class InquireAnswerDTO {
	private int code;
	private int inquire_code;
	private String content;
	private int status_code;
	private String status_name;
	private Timestamp reg_date;
	private Timestamp mod_date;
	private Timestamp del_date;
	
	public InquireAnswerDTO() {}
	//기본 테이블 생성자
	public InquireAnswerDTO(int code, int inquire_code, String content, int status_code, Timestamp reg_date,
			Timestamp mod_date, Timestamp del_date) {
		super();
		this.code = code;
		this.inquire_code = inquire_code;
		this.content = content;
		this.status_code = status_code;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		this.del_date = del_date;
	}
	//insert용 생성자
	
	//select용 생성자
	public InquireAnswerDTO(int code, int inquire_code, String content, String status_name, Timestamp reg_date) {
		super();
		this.code = code;
		this.inquire_code = inquire_code;
		this.content = content;
		this.status_name = status_name;
		this.reg_date = reg_date;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getInquire_code() {
		return inquire_code;
	}
	public void setInquire_code(int inquire_code) {
		this.inquire_code = inquire_code;
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
	public String getStatus_name() {
		return status_name;
	}
	public void setStatus_name(String status_name) {
		this.status_name = status_name;
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
