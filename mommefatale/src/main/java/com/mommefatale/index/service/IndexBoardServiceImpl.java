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
		System.out.println("인덱스 자유게시판 서비스");
		return dao.indexCommunityList();
	}

	@Override
	public List<CommunityBoardVO> indexNoticeList() {
		System.out.println("인덱스 공지사항 서비스");
		return dao.indexNoticeList();
	}

}
