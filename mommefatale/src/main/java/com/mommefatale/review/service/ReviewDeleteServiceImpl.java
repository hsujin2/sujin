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
		System.out.println("리뷰 삭제 서비스");
		dao.reviewDelete(no);
	}

}
