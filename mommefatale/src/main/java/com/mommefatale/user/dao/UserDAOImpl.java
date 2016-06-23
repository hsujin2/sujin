package com.mommefatale.user.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mommefatale.user.model.UserVO;

public class UserDAOImpl implements UserDAO {
	
	private static final String namespace = "com.mommefatale.user.dao.UserMapper";
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
		
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

	@Override
	public UserVO loginCheck(String id) {
		
		String statement = "com.mommefatale.user.dao.UserMapper";
		return session.selectOne(namespace + ".selectId",id);
	}
	
	
	
	

}
