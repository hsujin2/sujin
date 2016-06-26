package com.mommefatale.user.service;

import java.util.Map;

import com.mommefatale.user.dao.UserDAO;

public class UserSearchServiceImpl implements UserSearchService {

	private UserDAO dao;
	
	public void setDao(UserDAO dao) {
		this.dao = dao;
	}

	@Override
	public String searchId(Map<String, Object> vo) {
		return dao.searchId(vo);
	}

}
