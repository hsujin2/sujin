package com.mommefatale.admin.sitestatus.service;

import java.util.List;

import com.mommefatale.admin.sitestatus.dao.StatusDAO;
import com.mommefatale.admin.sitestatus.model.SalesVO;

public class SalesStatusServiceImpl implements SalesStatusService{
	private StatusDAO dao;

	public void setDao(StatusDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<Integer> thisWeekSalse() {
		return dao.thisWeekSalse();
	}

	@Override
	public List<Integer> lastWeekSalse() {
		return dao.lastWeekSalse();
	}

}
