package com.mommefatale.admin.member.service;

import java.util.List;

import com.mommefatale.admin.member.model.MemberVO;

public interface MemberService {
	
	public List<MemberVO> adminMember(Object obj);
	public int adminMemberCount();
	public List<MemberVO> adminMemberBye(Object obj);
	public MemberVO memberInfo(String id);
}
