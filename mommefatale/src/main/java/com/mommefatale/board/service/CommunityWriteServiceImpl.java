package com.mommefatale.board.service;

import java.util.Map;

import com.mommefatale.board.dao.CommunityBoardDAO;

public class CommunityWriteServiceImpl implements CommunityWriteService {

	private CommunityBoardDAO dao;

	public CommunityBoardDAO getDao() {
		return dao;
	}

	public void setDao(CommunityBoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public void communityWrite(Map<String, Object> vo) {
		System.out.println("자유게시판 글쓰기 서비스");
		dao.communityWrite(vo);
	}

	@Override
	public void communityReply(Map<String, Object> vo) {
		System.out.println("자유게시판 답글쓰기 서비스");	
		dao.communityReply(vo);
		
	}

}
