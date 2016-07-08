package com.mommefatale.review.service;

import java.util.List;

import com.mommefatale.review.model.ReviewVO;

public interface ReviewPageService {
	public List<ReviewVO> reviewPage(Object obj);

	public int reviewCountPage();

}
