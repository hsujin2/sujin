package com.mommefatale.index.service;

import java.util.List;

import com.mommefatale.board.dao.CommunityBoardDAO;
import com.mommefatale.board.model.CommunityBoardVO;

public class IndexBoardServiceImpl implements IndexBoardService {

	private CommunityBoardDAO dao;

	public CommunityBoardDAO getDao() {
		return dao;
	}

	public void setDao(CommunityBoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<CommunityBoardVO> indexCommunityList() {
		System.out.println("�ε��� �����Խ��� ����");
		return dao.indexCommunityList();
	}

	@Override
	public List<CommunityBoardVO> indexNoticeList() {
		System.out.println("�ε��� �������� ����");
		return dao.indexNoticeList();
	}

}
