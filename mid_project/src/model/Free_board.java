package model;

import java.sql.Date;

public class Free_board {
	
	private int free_no;
	private String member_id;
	private String category;	// f(잡담)/i(정보)/a(입양후기)
	private String subject;
	private String free_image1;
	private String free_image2;
	private String free_image3;
	private String free_image4;
	private String free_image5;
	private String content;
	private Date reg_date;
	private String del;
	private int cnt;
	
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getFree_no() {
		return free_no;
	}
	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFree_image1() {
		return free_image1;
	}
	public void setFree_image1(String free_image1) {
		this.free_image1 = free_image1;
	}
	public String getFree_image2() {
		return free_image2;
	}
	public void setFree_image2(String free_image2) {
		this.free_image2 = free_image2;
	}
	public String getFree_image3() {
		return free_image3;
	}
	public void setFree_image3(String free_image3) {
		this.free_image3 = free_image3;
	}
	public String getFree_image4() {
		return free_image4;
	}
	public void setFree_image4(String free_image4) {
		this.free_image4 = free_image4;
	}
	public String getFree_image5() {
		return free_image5;
	}
	public void setFree_image5(String free_image5) {
		this.free_image5 = free_image5;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
