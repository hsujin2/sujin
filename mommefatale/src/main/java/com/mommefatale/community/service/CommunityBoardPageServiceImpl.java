package com.mommefatale.community.service;

import java.util.List;

import com.mommefatale.community.dao.CommunityBoardDAO;
import com.mommefatale.community.model.CommunityBoardVO;

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
		System.out.println("자유게시판 리스트 서비스");
		return dao.getCommunityList(obj);
	}

	@Override
	public int CommunityPageCount() {
		return dao.getCommunityCount();
	}

}
