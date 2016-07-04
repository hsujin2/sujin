package com.mommefatale.cart.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.cart.model.CartVO;

public interface CartDAO {
	public void insertCart(CartVO cartVO);
	public List<CartVO> cartList(String userid);
	public CartVO getCart(Integer cart_no);
	public void updateCart(CartVO cartVO);
	public List<CartVO> getCartItem(Map<String, Object> id);
}
