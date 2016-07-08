package com.mommefatale.review.service;

import java.util.Map;

import com.mommefatale.review.dao.ReviewDAO;

public class ReviewUpdateServiceImpl implements ReviewUpdateService {
	private ReviewDAO dao;

	public ReviewDAO getDao() {
		return dao;
	}

	public void setDao(ReviewDAO dao) {
		this.dao = dao;
	}

	@Override
	public void reviewUpdate(Map<String, Object> vo) {
		System.out.println("¸®ºä ±Û ¼öÁ¤");
		dao.reviewUpdate(vo);
	}

}
