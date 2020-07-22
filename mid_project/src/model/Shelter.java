package model;

public class Shelter {
	private int shelter_no;
	private int location_no;
	private String name;
	private String tel;
	private String del;
	
	public int getShelter_no() {
		return shelter_no;
	}
	public void setShelter_no(int shelter_no) {
		this.shelter_no = shelter_no;
	}
	public int getLocation_no() {
		return location_no;
	}
	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
}