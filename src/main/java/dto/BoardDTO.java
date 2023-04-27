package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardDTO {
	private int code;
	private int board_kind_code;
	private int board_headline_code;
	private int member_code;
	private String title;
	private String content;
	private int view_count;
	private int like_count;
	private Timestamp reg_date;
	private Timestamp mod_date;
	private Timestamp del_date;

	public BoardDTO() {
	}

	public BoardDTO(int code, int board_kind_code, int board_headline_code, int member_code, String title, String content, int view_count, int like_count, Timestamp reg_date, Timestamp mod_date, Timestamp del_date) {
		this.code = code;
		this.board_kind_code = board_kind_code;
		this.board_headline_code = board_headline_code;
		this.member_code = member_code;
		this.title = title;
		this.content = content;
		this.view_count = view_count;
		this.like_count = like_count;
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

	public int getBoard_kind_code() {
		return board_kind_code;
	}

	public void setBoard_kind_code(int board_kind_code) {
		this.board_kind_code = board_kind_code;
	}

	public int getBoard_headline_code() {
		return board_headline_code;
	}

	public void setBoard_headline_code(int board_headline_code) {
		this.board_headline_code = board_headline_code;
	}

	public int getMember_code() {
		return member_code;
	}

	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
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

	public String calculated_date(Timestamp reg_date) {
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
