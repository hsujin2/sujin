package com.mommefatale.cart.service;

import com.mommefatale.cart.dao.CartDAO;

public class CartDeleteServiceImpl implements CartDeleteService{
	private CartDAO dao;
	
	public void setDao(CartDAO dao) {
		this.dao = dao;
	}

	@Override
	public void cartDelete(String cart_no) {
		dao.cartDelete(cart_no);
	}

}
