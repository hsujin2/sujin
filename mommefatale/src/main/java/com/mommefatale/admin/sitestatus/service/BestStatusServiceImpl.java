package com.mommefatale.admin.sitestatus.service;

import java.util.List;

import com.mommefatale.admin.sitestatus.dao.StatusDAO;
import com.mommefatale.admin.sitestatus.model.BestVO;

public class BestStatusServiceImpl implements BestStatusService{
	private StatusDAO dao;

	public void setDao(StatusDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<BestVO> bestStatus() {
		return dao.bestStatus();
	}

}
