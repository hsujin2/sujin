package com.mommefatale.user.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.mommefatale.user.model.UserVO;

public class UserDAOImpl implements UserDAO {
	
	private static final String namespace = "com.mommefatale.user.dao.UserMapper";
	private SqlSessionTemplate session;

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
		System.out.println("");
	}

	@Override
	public UserVO idCheck(String userid) {
		return session.selectOne(namespace + ".selectId", userid);
	}
	

}
