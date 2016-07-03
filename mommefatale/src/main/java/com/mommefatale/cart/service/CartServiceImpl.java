package com.mommefatale.cart.service;

import java.util.List;

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

	@Override
	public List<CartVO> cartList(String userid) {
		return dao.cartList(userid);
	}

	@Override
	public CartVO getCart(Integer cart_no) {
		return dao.getCart(cart_no);
	}
	
	

}
