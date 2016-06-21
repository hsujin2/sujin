package com.mommefatale.user.model;

public class UserVO {
	private String userid;
	public UserVO(){}
	public UserVO(String userid) {
		this.userid = userid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
}
