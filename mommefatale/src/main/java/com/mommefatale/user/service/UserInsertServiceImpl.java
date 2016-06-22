package com.mommefatale.user.service;

import java.util.Map;

import com.mommefatale.user.dao.UserDAO;


public class UserInsertServiceImpl implements UserInsertService{
	private UserDAO dao;
	public void setDao(UserDAO dao) {
		this.dao = dao;
	}
	@Override
	public void insertUser(Map<String, Object> vo) {
		dao.insertUser(vo);
	}

}
