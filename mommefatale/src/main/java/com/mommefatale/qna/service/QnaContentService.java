package com.mommefatale.qna.service;

import com.mommefatale.qna.model.QnaVO;

public interface QnaContentService {

	public QnaVO qnaContent(int no); // 내용보기

	public void qnaView(int no); // 조회수증가
}
