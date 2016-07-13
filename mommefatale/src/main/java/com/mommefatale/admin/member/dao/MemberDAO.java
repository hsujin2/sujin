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
	
	// 수정할 회원 정보 가져오기
	public MemberVO getMemberInfo(String id);
	
	// 회원 정보 수정하기
	public void memberUpdate(MemberVO vo);
	
	// 회원 탈퇴시키기
	public void memberBye(String id);
}
