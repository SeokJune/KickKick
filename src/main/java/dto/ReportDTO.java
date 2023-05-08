package dto;

import java.sql.Timestamp;

public class ReportDTO {
	private int code;
	private int member_code;
	private int board_kind_code;
	private int board_code;
	private int reply_code;
	private int report_kind_code;
	private String content;
	private int status_code;
	private Timestamp reg_dete;
	private Timestamp mod_date;
	private Timestamp del_date;
	
	public ReportDTO() {}
	//기본 테이블 그대로 담은 생성자
	public ReportDTO(int code, int member_code, int board_kind_code, int board_code, int reply_code,
			int report_kind_code, String content, int status_code, Timestamp reg_dete, Timestamp mod_date,
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
		this.reg_dete = reg_dete;
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
	public Timestamp getReg_dete() {
		return reg_dete;
	}
	public void setReg_dete(Timestamp reg_dete) {
		this.reg_dete = reg_dete;
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
