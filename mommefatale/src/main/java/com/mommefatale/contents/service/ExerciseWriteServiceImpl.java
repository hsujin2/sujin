package com.mommefatale.contents.service;

import java.util.Map;

import com.mommefatale.contents.dao.ExerciseDAO;

public class ExerciseWriteServiceImpl implements ExerciseWriteService {

	private ExerciseDAO dao;
	
	public ExerciseDAO getDao() {
		return dao;
	}
	
	public void setDao(ExerciseDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public void exerciseWrite(Map<String, Object> vo) {
		System.out.println("��� �۾��� ����");
		dao.exerciseWrite(vo);

	}

}
