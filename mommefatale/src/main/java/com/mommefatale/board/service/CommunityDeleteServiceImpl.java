package com.mommefatale.board.service;

import com.mommefatale.board.dao.CommunityBoardDAO;

public class CommunityDeleteServiceImpl implements CommunityDeleteService {
	private CommunityBoardDAO dao;

	public CommunityBoardDAO getDao() {
		return dao;
	}

	public void setDao(CommunityBoardDAO dao) {
		this.dao = dao;
	}
	@Override
	public void communityDelete(int no) {
		System.out.println("자유게시판 글삭제 서비스");
		dao.CommunityDelete(no);
	}

}
