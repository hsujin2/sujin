package com.mommefatale.admin.member.dao;

import java.util.List;

import com.mommefatale.admin.member.model.MemberVO;

public interface MemberDAO {
	
	// ȸ�� ����Ʈ ��������
	public List<MemberVO> getMemberList(Object obj);
	
	// ȸ���� ��������
	public int getMemberCount();
	
	// Ż���� ȸ�� ����Ʈ ��������
	public List<MemberVO> getMemberByeList(Object obj);
	
}
