package com.mommefatale.user.model;

public class UserVO {
	private String userid;
	private String useremail;
	public UserVO(){}
	public UserVO(String userid,String useremail) {
		this.userid = userid;
		this.useremail = useremail;
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
