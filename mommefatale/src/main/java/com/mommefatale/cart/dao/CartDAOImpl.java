package com.mommefatale.cart.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public CartVO getCart(Integer cart_no) {
		return session.selectOne(namespace + ".getCart",cart_no);
	}

	@Override
	public void updateCart(CartVO cartVO) {
		session.update(namespace + ".updateCart",cartVO);
	}

	@Override
	public String getCartItem(Map<String, Object> id) {
		return session.selectOne(namespace + ".getCartItem",id);
	}

	@Override
	public void cartDelete(String cart_no) {
		session.delete(namespace + ".cartDelete",cart_no);
	}
	

}
