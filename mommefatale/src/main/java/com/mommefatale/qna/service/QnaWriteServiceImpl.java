package com.mommefatale.qna.service;

import java.util.Map;

import com.mommefatale.qna.dao.QnaDAO;

public class QnaWriteServiceImpl implements QnaWriteService {

	private QnaDAO dao;

	public QnaDAO getDao() {
		return dao;
	}

	public void setDao(QnaDAO dao) {
		this.dao = dao;
	}

	@Override
	public void qnaWrite(Map<String, Object> vo) {
		System.out.println("Q&A게시판 글쓰기 서비스");
		dao.qnaWrite(vo);
	}

}
