package com.mommefatale.community.service;

import com.mommefatale.community.dao.CommunityBoardDAO;
import com.mommefatale.community.model.CommunityBoardVO;

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

		System.out.println("자유게시판 글내용 서비스");
		return dao.getCommunityContent(no);
	}

	@Override
	public void communityView(int no) {

		System.out.println("조회수 증가 서비스");
		dao.communityView(no);
	}

}
