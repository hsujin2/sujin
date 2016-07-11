package com.mommefatale.admin.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.mommefatale.admin.member.model.MemberVO;

public class MemberDAOImpl implements MemberDAO {
	
	private static final String namespace = "MemberMapper";

	private SqlSessionTemplate session;

	public SqlSessionTemplate getSession() {
		return session;
	}

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}
	
	@Override
	public List<MemberVO> getMemberList(Object obj) {
		System.out.println("ȸ�� ����Ʈ DAO");
		return session.selectList(namespace + ".memberList", obj);
	}

	@Override
	public int getMemberCount() {
		int count = session.selectOne(namespace + ".memberCount");
		System.out.println("ȸ���� DAO, ȸ�� �� : " + count);
		return count;
	}

	@Override
	public List<MemberVO> getMemberByeList(Object obj) {
		System.out.println("Ż��ȸ�� ����Ʈ DAO");
		return session.selectList(namespace + ".memberByeList", obj);
	}

}
