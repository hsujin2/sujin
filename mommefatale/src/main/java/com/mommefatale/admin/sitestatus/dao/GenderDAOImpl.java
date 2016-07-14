package com.mommefatale.admin.sitestatus.dao;

import org.apache.ibatis.session.SqlSession;

public class GenderDAOImpl implements GenderDAO{
	private static final String namespace = "com.mommefatale.admin.sitestatus.dao.GenderMapper";
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public Integer manCount() {
		return session.selectOne(namespace + ".manCount");
	}

	@Override
	public Integer womanCount() {
		return session.selectOne(namespace + ".womanCount");
	}

}
