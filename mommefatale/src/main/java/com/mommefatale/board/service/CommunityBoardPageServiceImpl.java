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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int CommunityPageCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
