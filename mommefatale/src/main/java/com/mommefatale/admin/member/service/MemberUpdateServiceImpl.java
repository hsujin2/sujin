package com.mommefatale.admin.member.service;

import com.mommefatale.admin.member.dao.MemberDAO;
import com.mommefatale.admin.member.model.MemberVO;

public class MemberUpdateServiceImpl implements MemberUpdateService {

	private MemberDAO dao;

	public MemberDAO getDao() {
		return dao;
	}

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	@Override
	public void memberUpdate(MemberVO vo) {
		System.out.println("회원 정보 수정 서비스");
		dao.memberUpdate(vo);
	}

}
