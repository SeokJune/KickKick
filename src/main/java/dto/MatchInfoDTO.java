package dto;

import java.sql.Timestamp;

public class MatchInfoDTO {
	private String match_place;
	private Timestamp match_date;
	private int match_kind_code;
	private int match_person_count;
	private String match_ability;

	public MatchInfoDTO() {
	}

	public MatchInfoDTO(String match_place, Timestamp match_date, int match_kind_code, int match_person_count, String match_ability) {
		this.match_place = match_place;
		this.match_date = match_date;
		this.match_kind_code = match_kind_code;
		this.match_person_count = match_person_count;
		this.match_ability = match_ability;
	}

	public String getMatch_place() {
		return match_place;
	}

	public void setMatch_place(String match_place) {
		this.match_place = match_place;
	}

	public Timestamp getMatch_date() {
		return match_date;
	}

	public void setMatch_date(Timestamp match_date) {
		this.match_date = match_date;
	}

	public int getMatch_kind_code() {
		return match_kind_code;
	}

	public void setMatch_kind_code(int match_kind_code) {
		this.match_kind_code = match_kind_code;
	}

	public int getMatch_person_count() {
		return match_person_count;
	}

	public void setMatch_person_count(int match_person_count) {
		this.match_person_count = match_person_count;
	}

	public String getMatch_ability() {
		return match_ability;
	}

	public void setMatch_ability(String match_ability) {
		this.match_ability = match_ability;
	}

}
