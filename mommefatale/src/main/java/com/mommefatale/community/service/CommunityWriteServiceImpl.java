package com.mommefatale.community.service;

import java.util.Map;

import com.mommefatale.community.dao.CommunityBoardDAO;

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
		System.out.println("�����Խ��� �۾��� ����");
		dao.communityWrite(vo);
	}

}
