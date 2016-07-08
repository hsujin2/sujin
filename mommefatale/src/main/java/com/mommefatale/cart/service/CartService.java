package com.mommefatale.cart.service;

import java.util.List;
import java.util.Map;

import com.mommefatale.cart.model.CartVO;

public interface CartService {
	public void insertCart(CartVO cartVO);
	public List<CartVO> cartList(String userid);
	public CartVO getCart(Integer cart_no);
	public void updateCart(CartVO cartVO);
	public String getCartItem(Map<String, Object> id);
}
