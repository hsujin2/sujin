package com.mommefatale.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mommefatale.cart.model.CartVO;

public class CartDAOImpl implements CartDAO{
	private static final String namespace = "com.mommefatale.cart.dao.CartMapper";
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertCart(CartVO cartVO) {
		session.insert(namespace + ".insertCart",cartVO);
	}

	@Override
	public List<CartVO> cartList(String userid) {
		return session.selectList(namespace + ".cartList",userid);
	}

}
