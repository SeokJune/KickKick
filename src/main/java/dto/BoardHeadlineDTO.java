package dto;

public class BoardHeadlineDTO {
	private int code;
	private String name;
	private int board_kind_code;
	private String board_name;

	public BoardHeadlineDTO() {}
	public BoardHeadlineDTO(int code, String name, int board_kind_code, String board_name) {
		super();
		this.code = code;
		this.name = name;
		this.board_kind_code = board_kind_code;
		this.board_name = board_name;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBoard_kind_code() {
		return board_kind_code;
	}
	public void setBoard_kind_code(int board_kind_code) {
		this.board_kind_code = board_kind_code;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	
}
