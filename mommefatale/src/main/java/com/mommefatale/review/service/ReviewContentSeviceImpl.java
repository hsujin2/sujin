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
		System.out.println("���� �۳��� ����");
		return dao.getReviewContent(no);
	}

	@Override
	public void reviewView(int no) {
		System.out.println("���� ��ȸ�� ����");
		dao.reviewView(no);
	}

}
