package com.mommefatale.admin.sitestatus.service;

import java.util.List;

import com.mommefatale.admin.sitestatus.dao.StatusDAO;
import com.mommefatale.admin.sitestatus.model.VisitVO;

public class VisitStatusServiceImpl implements VisitStatusService{
	private StatusDAO dao;

	public void setDao(StatusDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<VisitVO> visitStatus() {
		return dao.visitStatus();
	}

}
