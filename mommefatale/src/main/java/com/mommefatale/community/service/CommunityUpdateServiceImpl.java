package com.mommefatale.community.service;

import java.util.Map;

import com.mommefatale.community.dao.CommunityBoardDAO;

public class CommunityUpdateServiceImpl implements CommunityUpdateService {

	private CommunityBoardDAO dao;

	public CommunityBoardDAO getDao() {
		return dao;
	}

	public void setDao(CommunityBoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public void communityUpdate(Map<String, Object> vo) {
		System.out.println("자유게시판 글수정 서비스");
		dao.communityUpdate(vo);
	}

}
