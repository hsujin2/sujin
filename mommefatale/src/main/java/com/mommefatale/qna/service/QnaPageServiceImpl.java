package com.mommefatale.qna.service;

import java.util.List;

import com.mommefatale.qna.dao.QnaDAO;
import com.mommefatale.qna.model.QnaVO;

public class QnaPageServiceImpl implements QnaPageService {

	private QnaDAO dao;
	
	public QnaDAO getDao() {
		return dao;
	}

	public void setDao(QnaDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<QnaVO> QnaPage(Object obj) {
		System.out.println("Q&A게시판 리스트 서비스");
		return dao.getQnaList(obj);
	}

	@Override
	public int QnaPageCount() {
		return dao.getQnaCount();
	}

}
