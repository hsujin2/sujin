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
		System.out.println("��� �۳��� ����");
		return dao.getExerciseContent(no);
	}

	@Override
	public void exerciseView(int no) {
		System.out.println("��ȸ�� ���� ����");
		dao.exerciseView(no);

	}

}
