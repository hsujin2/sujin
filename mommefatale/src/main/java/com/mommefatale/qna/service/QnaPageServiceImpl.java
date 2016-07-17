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
	public List<QnaVO> qnaPage(Object obj) {
		System.out.println("Q&A�Խ��� ����Ʈ ����");
		return dao.getQnaList(obj);
	}

	@Override
	public int qnaPageCount() {
		return dao.getQnaCount();
	}

}
