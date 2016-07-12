package com.mommefatale.user.service;

import com.mommefatale.user.dao.UserDAO;

public class VisitServiceImpl implements VisitService {
	private UserDAO dao;

	public void setDao(UserDAO dao) {
		this.dao = dao;
	}

	@Override
	public void visitDate(String userid) {
		dao.visitDate(userid);
	}

}
