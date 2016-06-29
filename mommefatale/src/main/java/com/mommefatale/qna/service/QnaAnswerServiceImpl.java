package com.mommefatale.qna.service;

import java.util.Map;

import com.mommefatale.qna.dao.QnaDAO;

public class QnaAnswerServiceImpl implements QnaAnswerService {

	private QnaDAO dao;

	public QnaDAO getDao() {
		return dao;
	}

	public void setDao(QnaDAO dao) {
		this.dao = dao;
	}

	@Override
	public void qnaAnswer(Map<String, Object> vo) {

		System.out.println("Q&A게시판 답변 서비스");
		dao.qnaAnswer(vo);
	}

}
