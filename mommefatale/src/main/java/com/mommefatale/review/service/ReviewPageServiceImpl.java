package com.mommefatale.review.service;

import java.util.List;

import com.mommefatale.review.dao.ReviewDAO;
import com.mommefatale.review.model.ReviewVO;

public class ReviewPageServiceImpl implements ReviewPageService {
	private ReviewDAO dao;

	public ReviewDAO getDao() {
		return dao;
	}

	public void setDao(ReviewDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<ReviewVO> reviewPage(Object obj) {
		System.out.println("리뷰 리스트 서비스");
		return dao.getReviewList(obj);
	}

	@Override
	public int reviewCountPage() {
		return dao.getReviewCount();
	}

}
