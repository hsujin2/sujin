package com.mommefatale.admin.sitestatus.service;

import com.mommefatale.admin.sitestatus.dao.GenderDAO;

public class GenderStatusServiceImpl implements GenderStatusService{
	private GenderDAO dao;

	public void setDao(GenderDAO dao) {
		this.dao = dao;
	}

	@Override
	public Integer manCount() {
		return dao.manCount();
	}

	@Override
	public Integer womanCount() {
		return dao.womanCount();
	}

}
