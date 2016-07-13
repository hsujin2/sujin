package com.mommefatale.contents.service;

import com.mommefatale.contents.dao.ExerciseDAO;
import com.mommefatale.contents.model.ExerciseVO;

public class ExerciseUpdateServiceImpl implements ExerciseUpdateService {

	private ExerciseDAO dao;
	
	public ExerciseDAO getDao() {
		return dao;
	}

	public void setDao(ExerciseDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public void exerciseUpdate(ExerciseVO exerciseVO) {
		System.out.println("운동법 글수정 서비스");
		dao.exerciseUpdate(exerciseVO);

	}

}
