package com.mommefatale.review.service;

import com.mommefatale.review.dao.ReviewDAO;

public class ReviewDeleteServiceImpl implements ReviewDeleteService {
	private ReviewDAO dao;

	public ReviewDAO getDao() {
		return dao;
	}

	public void setDao(ReviewDAO dao) {
		this.dao = dao;
	}

	@Override
	public void reviewDelete(int no) {
		System.out.println("���� ���� ����");
		dao.reviewDelete(no);
	}

}
