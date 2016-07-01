package com.mommefatale.cart.service;

import java.util.List;

import com.mommefatale.cart.model.CartVO;

public interface CartService {
	public void insertCart(CartVO cartVO);
	public List<CartVO> cartList(String userid);
}
