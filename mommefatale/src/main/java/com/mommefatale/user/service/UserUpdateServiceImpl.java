package com.mommefatale.user.service;

import java.util.Map;

import com.mommefatale.user.dao.UserDAO;
import com.mommefatale.user.model.UserVO;

public class UserUpdateServiceImpl implements UserUpdateService{

	private UserDAO dao;

	public void setDao(UserDAO dao) {
		this.dao = dao;
	}

	@Override
	public void userUpdate(Map<String, Object> vo) {
		dao.userUpdate(vo);
	}

	@Override
	public UserVO sessionUpdate(String id) {
		return dao.sessionUpdate(id);
	}
	
	
	

}
