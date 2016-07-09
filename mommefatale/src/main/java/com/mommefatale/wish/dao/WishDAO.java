package com.mommefatale.wish.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.wish.model.WishVO;

public interface WishDAO {
	public void insertWish(WishVO wishVO);
	public List<WishVO> wishList(String userid);
	public WishVO getWish(Integer wish_no);
	public void updateWish(WishVO wishVO);
	public String getWishItem(Map<String, Object> id);
	public void wishDelete(String wish_no);
}
