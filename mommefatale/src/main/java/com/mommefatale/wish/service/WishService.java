package com.mommefatale.wish.service;

import java.util.List;
import java.util.Map;

import com.mommefatale.wish.model.WishVO;


public interface WishService {
	public void insertWish(WishVO wishVO);
	public List<WishVO> wishList(String userid);
	public WishVO getWish(Integer wish_no);
	public void updateWish(WishVO wishVO);
	public String getWishItem(Map<String, Object> id);
}
