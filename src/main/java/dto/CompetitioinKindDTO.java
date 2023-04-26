package dto;

import java.sql.Timestamp;

public class CompetitioinKindDTO {
private int code;
private String name;
private int headcount;
private Timestamp reg_date;
private Timestamp mod_date;
private Timestamp del_date;

public CompetitioinKindDTO() {};
public CompetitioinKindDTO(int code, String name, int headcount, Timestamp reg_date, Timestamp mod_date,
		Timestamp del_date) {
	super();
	this.code = code;
	this.name = name;
	this.headcount = headcount;
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
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getHeadcount() {
	return headcount;
}
public void setHeadcount(int headcount) {
	this.headcount = headcount;
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
