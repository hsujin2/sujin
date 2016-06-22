package com.mommefatale.user.model;

import java.util.Date;
import java.util.List;

public class UserVO {
	private String name;
	private String gender;
	private String userid;
	private String password;
	private String birthday;
	private String tel;
	private String useremail;
	private String zipcode;
	private String address1;
	private String address2;
	private String height;
	private String weight;
	private String bmi;
	private String shape;
	private List<String> fat;
	private List<String> activity;
	private int kcal;
	private Date joindate;
	
	
	public UserVO(){}
	
	public UserVO(String name, String gender, String userid, String password, String birthday, String tel,
			String useremail, String zipcode, String address1, String address2, String height, String weight,
			String bmi, String shape, List<String> fat, List<String> activity, int kcal, Date joindate) {
		super();
		this.name = name;
		this.gender = gender;
		this.userid = userid;
		this.password = password;
		this.birthday = birthday;
		this.tel = tel;
		this.useremail = useremail;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.height = height;
		this.weight = weight;
		this.bmi = bmi;
		this.shape = shape;
		this.fat = fat;
		this.activity = activity;
		this.kcal = kcal;
		this.joindate = joindate;
	}



	public int getKcal() {
		return kcal;
	}



	public void setKcal(int kcal) {
		this.kcal = kcal;
	}



	public Date getJoindate() {
		return joindate;
	}



	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}



	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getBirthday() {
		return birthday;
	}


	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getHeight() {
		return height;
	}


	public void setHeight(String height) {
		this.height = height;
	}


	public String getWeight() {
		return weight;
	}


	public void setWeight(String weight) {
		this.weight = weight;
	}


	public String getBmi() {
		return bmi;
	}


	public void setBmi(String bmi) {
		this.bmi = bmi;
	}


	public String getShape() {
		return shape;
	}


	public void setShape(String shape) {
		this.shape = shape;
	}


	public List<String> getFat() {
		return fat;
	}


	public void setFat(List<String> fat) {
		this.fat = fat;
	}


	public List<String> getActivity() {
		return activity;
	}


	public void setActivity(List<String> activity) {
		this.activity = activity;
	}


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	
	
	
}
