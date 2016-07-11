package com.mommefatale.admin.member.dao;

import java.util.List;

import com.mommefatale.admin.member.model.MemberVO;

public interface MemberDAO {
	
	// 회원 리스트 가져오기
	public List<MemberVO> getMemberList(Object obj);
	
	// 회원수 가져오기
	public int getMemberCount();
	
	// 탈퇴한 회원 리스트 가져오기
	public List<MemberVO> getMemberByeList(Object obj);
	
}
