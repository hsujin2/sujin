package com.mommefatale.review.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.review.model.ReviewVO;

public interface ReviewDAO {
	// 작성
	public void reviewWrite(Map<String, Object> vo);

	// 목록
	public List<ReviewVO> getReviewList(Object obj);

	// 내용
	public ReviewVO getReviewContent(int no);

	// 수정
	public void reviewUpdate(Map<String, Object> vo);

	// 삭제
	public void reviewDelete(int no);

	// 글 수
	public int getReviewCount();

	// 조회수
	public void reviewView(int no);

}