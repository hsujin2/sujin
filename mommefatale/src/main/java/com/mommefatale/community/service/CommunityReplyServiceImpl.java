package com.mommefatale.community.service;

import java.util.Map;

import com.mommefatale.community.dao.CommunityBoardDAO;

public class CommunityReplyServiceImpl implements CommunityReplyService {

	public CommunityBoardDAO dao;

	public CommunityBoardDAO getDao() {
		return dao;
	}

	public void setDao(CommunityBoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public void communityReply(Map<String, Object> vo) {
		System.out.println("자유게시판 답글쓰기 서비스");
		dao.communityReply(vo);

	}

}
