package com.mommefatale.user.service;

import com.mommefatale.user.dao.UserDAO;
import com.mommefatale.user.model.UserVO;

public class UserIdCheckServiceImpl implements UserIdCheckService{
	
	private UserDAO dao;
	
	public void setDao(UserDAO dao) {
		this.dao = dao;
	}

	@Override
	public UserVO idCheck(String userid) {
		UserVO result = dao.idCheck(userid);
		return result;
	}

}
