package com.mommefatale.community.service;

import com.mommefatale.community.dao.CommunityBoardDAO;

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
		System.out.println("�����Խ��� �ۻ��� ����");
		dao.communityDelete(no);
	}

}
