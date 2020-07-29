package model;

import java.util.Date;

public class Adopt_board {
	
	private int adopt_no;
	private String member_id;
	private String largecate_id;
	private String smallcate_id;
	private int location_no;
	private String subject;
	private String content;
	private int applier_count;
	private Date reg_date;
	private String del;
	// location_name
	private String location_name;
	
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public int getAdopt_no() {
		return adopt_no;
	}
	public void setAdopt_no(int adopt_no) {
		this.adopt_no = adopt_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getLargecate_id() {
		return largecate_id;
	}
	public void setLargecate_id(String largecate_id) {
		this.largecate_id = largecate_id;
	}
	public String getSmallcate_id() {
		return smallcate_id;
	}
	public void setSmallcate_id(String smallcate_id) {
		this.smallcate_id = smallcate_id;
	}
	public int getLocation_no() {
		return location_no;
	}
	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getApplier_count() {
		return applier_count;
	}
	public void setApplier_count(int applier_count) {
		this.applier_count = applier_count;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	
}
