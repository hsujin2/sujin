package com.mommefatale.board.service;

import java.util.List;

import com.mommefatale.board.dao.CommunityBoardDAO;
import com.mommefatale.board.model.CommunityBoardVO;

public class CommunityBoardPageServiceImpl implements CommunityBoardPageService {

	
	private CommunityBoardDAO dao;
	
	public CommunityBoardDAO getDao() {
		return dao;
	}

	public void setDao(CommunityBoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<CommunityBoardVO> CommunityBoardPage(Object obj) {
		System.out.println("�����Խ��� ����Ʈ ����");
		return dao.getCommunityList(obj);
	}

	@Override
	public int CommunityPageCount() {
		return dao.getCommunityCount();
	}

}
