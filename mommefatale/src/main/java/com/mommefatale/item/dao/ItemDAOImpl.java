package com.mommefatale.item.dao;

import org.apache.ibatis.session.SqlSession;

import com.mommefatale.item.model.ItemVO;

public class ItemDAOImpl implements ItemDAO{
	private static final String namespace = "com.mommefatale.item.dao.ItemMapper";
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public void insertItem(ItemVO itemVO) {
		session.insert(namespace + ".insertItem",itemVO);
	}

}
