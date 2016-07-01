package com.mommefatale.cart.dao;

import java.util.List;
import com.mommefatale.cart.model.CartVO;

public interface CartDAO {
	public void insertCart(CartVO cartVO);
	public List<CartVO> cartList(String userid);
}
