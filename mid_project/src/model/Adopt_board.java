package model;

import java.sql.Date;

public class Adopt_board {
	
	private int adopt_no;
	private String member_id;
	private String largecate_id;
	private String smallcate_id;
	private int location_no;
	private String subject;
	private String adopt_image1;
	private String adopt_image2;
	private String adopt_image3;
	private String adopt_image4;
	private String adopt_image5;
	private String content;
	private int applier_count;
	private Date reg_date;
	private String del;
	
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
	public String getAdopt_image1() {
		return adopt_image1;
	}
	public void setAdopt_image1(String adopt_image1) {
		this.adopt_image1 = adopt_image1;
	}
	public String getAdopt_image2() {
		return adopt_image2;
	}
	public void setAdopt_image2(String adopt_image2) {
		this.adopt_image2 = adopt_image2;
	}
	public String getAdopt_image3() {
		return adopt_image3;
	}
	public void setAdopt_image3(String adopt_image3) {
		this.adopt_image3 = adopt_image3;
	}
	public String getAdopt_image4() {
		return adopt_image4;
	}
	public void setAdopt_image4(String adopt_image4) {
		this.adopt_image4 = adopt_image4;
	}
	public String getAdopt_image5() {
		return adopt_image5;
	}
	public void setAdopt_image5(String adopt_image5) {
		this.adopt_image5 = adopt_image5;
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
