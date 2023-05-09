package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReportDTO {
	private int code;
	//신고 하는 사람
	private int member_code;
	private String member_nickname;
	private int board_kind_code;
	private int board_code;
	//신고당하는 글 내용
	private String report_board_content;
	private String report_reply_content;
	//신고 당하는 사람
	private String report_member_nickname;
	private int reply_code;
	private int report_kind_code;
	private String report_kind_name;
	//신고사유 상세(선택)
	private String content;
	private int status_code;
	private String status_name;
	private Timestamp reg_date;
	private Timestamp mod_date;
	private Timestamp del_date;
	
	public ReportDTO() {}
	//기본 테이블 그대로 담은 생성자
	public ReportDTO(int code, int member_code, int board_kind_code, int board_code, int reply_code,
			int report_kind_code, String content, int status_code, Timestamp reg_date, Timestamp mod_date,
			Timestamp del_date) {
		super();
		this.code = code;
		this.member_code = member_code;
		this.board_kind_code = board_kind_code;
		this.board_code = board_code;
		this.reply_code = reply_code;
		this.report_kind_code = report_kind_code;
		this.content = content;
		this.status_code = status_code;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		this.del_date = del_date;
	}
	//insert할때 사용하는 생성자
	public ReportDTO(int member_code,int board_kind_code,int board_code, int reply_code,int report_kind_code,String content) {
		this.member_code = member_code;
		this.board_kind_code = board_kind_code;
		this.board_code = board_code;
		this.reply_code = reply_code;
		this.report_kind_code = report_kind_code;
		this.content = content;
	}
	//list 출력할 때 사용하는 생성자
	public ReportDTO(int code, String member_nickname, int board_kind_code, int board_code, String report_board_content,
			String report_reply_content, int reply_code, String report_kind_name, String content, String status_name,
			Timestamp reg_date) {
		super();
		this.code = code;
		this.member_nickname = member_nickname;
		this.board_kind_code = board_kind_code;
		this.board_code = board_code;
		this.report_board_content = report_board_content;
		this.report_reply_content = report_reply_content;
		this.reply_code = reply_code;
		this.report_kind_name = report_kind_name;
		this.content = content;
		this.status_name = status_name;
		this.reg_date = reg_date;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public String getStatus_name() {
		return status_name;
	}
	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getReport_board_content() {
		return report_board_content;
	}
	public void setReport_board_content(String report_board_content) {
		this.report_board_content = report_board_content;
	}
	public String getReport_reply_content() {
		return report_reply_content;
	}
	public void setReport_reply_content(String report_reply_content) {
		this.report_reply_content = report_reply_content;
	}
	public String getReport_member_nickname() {
		return report_member_nickname;
	}
	public void setReport_member_nickname(String report_member_nickname) {
		this.report_member_nickname = report_member_nickname;
	}
	public String getReport_kind_name() {
		return report_kind_name;
	}
	public void setReport_kind_name(String report_kind_name) {
		this.report_kind_name = report_kind_name;
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
	public int getBoard_kind_code() {
		return board_kind_code;
	}
	public void setBoard_kind_code(int board_kind_code) {
		this.board_kind_code = board_kind_code;
	}
	public int getBoard_code() {
		return board_code;
	}
	public void setBoard_code(int board_code) {
		this.board_code = board_code;
	}
	public int getReply_code() {
		return reply_code;
	}
	public void setReply_code(int reply_code) {
		this.reply_code = reply_code;
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
