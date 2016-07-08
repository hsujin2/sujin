package com.mommefatale.contents.service;

import java.util.List;

import com.mommefatale.contents.dao.ExerciseDAO;
import com.mommefatale.contents.model.ExerciseVO;

public class ExercisePageServiceImpl implements ExercisePageService {

	private ExerciseDAO dao;

	public ExerciseDAO getDao() {
		return dao;
	}

	public void setDao(ExerciseDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<ExerciseVO> ExercisePage(Object obj) {
		System.out.println("운동법 리스트 서비스");
		return dao.getExerciseList(obj);
	}

	@Override
	public int ExercisePageCount() {
		return dao.getExerciseCount();
	}

}
