package com.mommefatale.board.service;

import com.mommefatale.board.dao.CommunityBoardDAO;
import com.mommefatale.board.model.CommunityBoardVO;

public class CommunityContentServiceImpl implements CommunityContentService {

	private CommunityBoardDAO dao;

	public CommunityBoardDAO getDao() {
		return dao;
	}

	public void setDao(CommunityBoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public CommunityBoardVO communityContent(int no) {

		System.out.println("�����Խ��� �۳��� ����");
		return dao.getCommunityContent(no);
	}

}
