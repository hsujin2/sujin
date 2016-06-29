package com.mommefatale.qna.service;

import java.util.Map;

import com.mommefatale.qna.dao.QnaDAO;

public class QnaUpdateServiceImpl implements QnaUpdateService {

	private QnaDAO dao;

	public QnaDAO getDao() {
		return dao;
	}

	public void setDao(QnaDAO dao) {
		this.dao = dao;
	}

	@Override
	public void qnaUpdate(Map<String, Object> vo) {
		
		System.out.println("Q&A게시판 글수정 서비스");
		dao.qnaUpdate(vo);
	}

}
