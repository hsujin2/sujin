package com.mommefatale.review.service;

import java.util.Map;

import com.mommefatale.review.dao.ReviewDAO;

public class ReviewWriteServiceImpl implements ReviewWriteService {
	private ReviewDAO dao;

	public ReviewDAO getDao() {
		return dao;
	}

	public void setDao(ReviewDAO dao) {
		this.dao = dao;
	}

	@Override
	public void reviewWrite(Map<String, Object> vo) {
		System.out.println("¸®ºä ±Û¾²±â");
		dao.reviewWrite(vo);
	}

}
