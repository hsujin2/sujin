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
		System.out.println("회원 리스트 DAO");
		return session.selectList(namespace + ".memberList", obj);
	}

	@Override
	public int getMemberCount() {
		int count = session.selectOne(namespace + ".memberCount");
		System.out.println("회원수 DAO, 회원 수 : " + count);
		return count;
	}

	@Override
	public List<MemberVO> getMemberByeList(Object obj) {
		System.out.println("탈퇴회원 리스트 DAO");
		return session.selectList(namespace + ".memberByeList", obj);
	}

}
