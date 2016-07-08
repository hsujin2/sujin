package com.mommefatale.review.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.review.model.ReviewVO;

public interface ReviewDAO {
	// �ۼ�
	public void reviewWrite(Map<String, Object> vo);

	// ���
	public List<ReviewVO> getReviewList(Object obj);

	// ����
	public ReviewVO getReviewContent(int no);

	// ����
	public void reviewUpdate(Map<String, Object> vo);

	// ����
	public void reviewDelete(int no);

	// �� ��
	public int getReviewCount();

	// ��ȸ��
	public void reviewView(int no);

}