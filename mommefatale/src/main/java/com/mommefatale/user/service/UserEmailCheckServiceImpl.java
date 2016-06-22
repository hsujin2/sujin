package com.mommefatale.user.service;

import com.mommefatale.user.dao.UserDAO;
import com.mommefatale.user.model.UserVO;

public class UserEmailCheckServiceImpl implements UserEmailCheckService{

private UserDAO dao;
	
	public void setDao(UserDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public UserVO emailCheck(String useremail) {
		UserVO result = dao.emailCheck(useremail);
		return result;
	}

}
