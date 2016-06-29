package com.mommefatale.qna.service;

import com.mommefatale.qna.dao.QnaDAO;
import com.mommefatale.qna.model.QnaVO;

public class QnaContentServiceImpl implements QnaContentService {

	public QnaDAO dao;

	public QnaDAO getDao() {
		return dao;
	}

	public void setDao(QnaDAO dao) {
		this.dao = dao;
	}

	@Override
	public QnaVO qnaContent(int no) {
		
		System.out.println("Q&A�Խ��� �۳��� ����");
		return dao.getQnaContent(no);
	}

	@Override
	public void qnaView(int no) {
		
		System.out.println("��ȸ�� ���� ����");
		dao.qnaView(no);
	}

}
