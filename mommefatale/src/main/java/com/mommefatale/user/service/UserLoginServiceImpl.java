package com.mommefatale.user.service;

import com.mommefatale.user.dao.UserDAO;
import com.mommefatale.user.model.UserVO;

public class UserLoginServiceImpl implements UserLoginService{
	private UserDAO dao;
	public void setDao(UserDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public UserVO loginCheck(String id) {
		System.out.println(id);
		return dao.loginCheck(id);
	}

}
