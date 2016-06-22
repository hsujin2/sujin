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
	private String fat_part1;
	private String fat_part2;
	private String fat_part3;
	private String fat_part4;
	private String fat_part5;
	private String fat_part6;
	private String activity_code1;
	private String activity_code2;
	private String activity_code3;
	private String activity_code4;
	private String activity_code5;
	private int kcal;
	private Date joindate;
	
	
	public UserVO(){}
	
	


	public UserVO(String name, String gender, String userid, String password, String birthday, String tel,
			String useremail, String zipcode, String address1, String address2, String height, String weight,
			String bmi, String shape, String fat_part1, String fat_part2, String fat_part3, String fat_part4,
			String fat_part5, String fat_part6, String activity_code1, String activity_code2, String activity_code3,
			String activity_code4, String activity_code5, int kcal, Date joindate) {
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
		this.fat_part1 = fat_part1;
		this.fat_part2 = fat_part2;
		this.fat_part3 = fat_part3;
		this.fat_part4 = fat_part4;
		this.fat_part5 = fat_part5;
		this.fat_part6 = fat_part6;
		this.activity_code1 = activity_code1;
		this.activity_code2 = activity_code2;
		this.activity_code3 = activity_code3;
		this.activity_code4 = activity_code4;
		this.activity_code5 = activity_code5;
		this.kcal = kcal;
		this.joindate = joindate;
	}

	


	public String getFat_part1() {
		return fat_part1;
	}




	public void setFat_part1(String fat_part1) {
		this.fat_part1 = fat_part1;
	}




	public String getFat_part2() {
		return fat_part2;
	}




	public void setFat_part2(String fat_part2) {
		this.fat_part2 = fat_part2;
	}




	public String getFat_part3() {
		return fat_part3;
	}




	public void setFat_part3(String fat_part3) {
		this.fat_part3 = fat_part3;
	}




	public String getFat_part4() {
		return fat_part4;
	}




	public void setFat_part4(String fat_part4) {
		this.fat_part4 = fat_part4;
	}




	public String getFat_part5() {
		return fat_part5;
	}




	public void setFat_part5(String fat_part5) {
		this.fat_part5 = fat_part5;
	}




	public String getFat_part6() {
		return fat_part6;
	}




	public void setFat_part6(String fat_part6) {
		this.fat_part6 = fat_part6;
	}




	public String getActivity_code1() {
		return activity_code1;
	}




	public void setActivity_code1(String activity_code1) {
		this.activity_code1 = activity_code1;
	}




	public String getActivity_code2() {
		return activity_code2;
	}




	public void setActivity_code2(String activity_code2) {
		this.activity_code2 = activity_code2;
	}




	public String getActivity_code3() {
		return activity_code3;
	}




	public void setActivity_code3(String activity_code3) {
		this.activity_code3 = activity_code3;
	}




	public String getActivity_code4() {
		return activity_code4;
	}




	public void setActivity_code4(String activity_code4) {
		this.activity_code4 = activity_code4;
	}




	public String getActivity_code5() {
		return activity_code5;
	}




	public void setActivity_code5(String activity_code5) {
		this.activity_code5 = activity_code5;
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
