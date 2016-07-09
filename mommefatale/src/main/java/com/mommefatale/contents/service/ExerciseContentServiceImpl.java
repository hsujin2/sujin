package com.mommefatale.contents.service;

import com.mommefatale.contents.dao.ExerciseDAO;
import com.mommefatale.contents.model.ExerciseVO;

public class ExerciseContentServiceImpl implements ExerciseContentService {
	
	private ExerciseDAO dao;
	
	
	public ExerciseDAO getDao() {
		return dao;
	}

	public void setDao(ExerciseDAO dao) {
		this.dao = dao;
	}

	@Override
	public ExerciseVO exerciseContent(int no) {
		System.out.println("운동법 글내용 서비스");
		return dao.getExerciseContent(no);
	}

	@Override
	public void exerciseView(int no) {
		System.out.println("조회수 증가 서비스");
		dao.exerciseView(no);

	}

}
