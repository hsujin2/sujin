package com.mommefatale.qna.service;

import java.util.List;

import com.mommefatale.qna.model.QnaVO;

public interface QnaPageService {
	public List<QnaVO> qnaPage(Object obj);
	public int qnaPageCount();
}
