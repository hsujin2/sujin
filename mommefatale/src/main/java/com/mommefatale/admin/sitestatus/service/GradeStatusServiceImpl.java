package com.mommefatale.admin.sitestatus.service;

import java.util.List;

import com.mommefatale.admin.sitestatus.dao.StatusDAO;
import com.mommefatale.admin.sitestatus.model.GradeVO;


public class GradeStatusServiceImpl implements GradeStatusService{
	private StatusDAO dao;

	public void setDao(StatusDAO dao) {
		this.dao = dao;
	}
	@Override
	public List<GradeVO> gradeStatus() {
		return dao.gradeStatus();
	}

}
