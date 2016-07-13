package com.mommefatale.admin.member.service;

import java.util.List;

import com.mommefatale.admin.member.dao.MemberDAO;
import com.mommefatale.admin.member.model.MemberVO;

public class MemberServiceImpl implements MemberService {

	private MemberDAO dao;

	public MemberDAO getDao() {
		return dao;
	}

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<MemberVO> adminMember(Object obj) {
		System.out.println("회원 리스트 서비스");
		return dao.getMemberList(obj);
	}

	@Override
	public int adminMemberCount() {
		System.out.println("회원 수 서비스");
		return dao.getMemberCount();
	}

	@Override
	public List<MemberVO> adminMemberBye(Object obj) {
		System.out.println("탈퇴회원 리스트 서비스");
		return dao.getMemberByeList(obj);
	}

	@Override
	public MemberVO memberInfo(String id) {
		System.out.println("수정할 회원 상세정보 서비스");
		return dao.getMemberInfo(id);
	}
	
}
