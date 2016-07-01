package com.mommefatale.cart.service;

import com.mommefatale.cart.dao.CartDAO;
import com.mommefatale.cart.model.CartVO;

public class CartServiceImpl implements CartService{
	private CartDAO dao;

	public void setDao(CartDAO dao) {
		this.dao = dao;
	}

	@Override
	public void insertCart(CartVO cartVO) {
		dao.insertCart(cartVO);
	}

}
