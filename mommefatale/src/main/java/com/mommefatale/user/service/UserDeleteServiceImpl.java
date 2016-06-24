package com.mommefatale.user.service;

import com.mommefatale.user.dao.UserDAO;
import com.mommefatale.user.model.UserVO;

public class UserDeleteServiceImpl implements UserDeleteService{

	private UserDAO dao;
	public void setDao(UserDAO dao){
		this.dao = dao;
	}
	@Override
	public void deleteUser(String userid) {
		dao.deleteUser(userid);
	}

}
