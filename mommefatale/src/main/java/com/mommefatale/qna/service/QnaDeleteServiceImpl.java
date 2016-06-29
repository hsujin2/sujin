package com.mommefatale.qna.service;

import com.mommefatale.qna.dao.QnaDAO;

public class QnaDeleteServiceImpl implements QnaDeleteService{

	private QnaDAO dao;
	
	public QnaDAO getDao() {
		return dao;
	}

	public void setDao(QnaDAO dao) {
		this.dao = dao;
	}

	@Override
	public void qnaDelete(int no) {
		
		System.out.println("Q&A게시판 글삭제 서비스");
		dao.qnaDelete(no);
	}

}
