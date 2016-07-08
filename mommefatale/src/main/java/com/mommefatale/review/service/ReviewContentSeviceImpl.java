package com.mommefatale.review.service;

import com.mommefatale.review.dao.ReviewDAO;
import com.mommefatale.review.model.ReviewVO;

public class ReviewContentSeviceImpl implements ReviewContentSevice {

	private ReviewDAO dao;

	public ReviewDAO getDao() {
		return dao;
	}

	public void setDao(ReviewDAO dao) {
		this.dao = dao;
	}

	@Override
	public ReviewVO reviewContent(int no) {
		System.out.println("리뷰 글내용 서비스");
		return dao.getReviewContent(no);
	}

	@Override
	public void reviewView(int no) {
		System.out.println("리뷰 조회수 서비스");
		dao.reviewView(no);
	}

}
