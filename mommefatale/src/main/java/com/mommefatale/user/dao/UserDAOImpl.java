package com.mommefatale.user.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mommefatale.user.model.UserVO;

public class UserDAOImpl implements UserDAO {
	
	private static final String namespace = "com.mommefatale.user.dao.UserMapper";
	private SqlSessionTemplate session;

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
		System.out.println("session");
		
	}

	@Override
	public UserVO idCheck(String userid) {
		return session.selectOne(namespace + ".selectId", userid);
	}

	@Override
	public UserVO emailCheck(String useremail) {
		return session.selectOne(namespace + ".selectEmail", useremail);
	}

	@Override
	public void insertUser(Map<String, Object> vo) {
		session.insert(namespace + ".insertUser", vo);
	}
	
	
	

}
