package com.mommefatale.wish.service;

import java.util.List;
import java.util.Map;

import com.mommefatale.wish.dao.WishDAO;
import com.mommefatale.wish.model.WishVO;

public class WishServiceImpl implements WishService{
	private WishDAO dao;

	public void setDao(WishDAO dao) {
		this.dao = dao;
	}

	@Override
	public void insertWish(WishVO wishVO) {
		dao.insertWish(wishVO);
	}

	@Override
	public List<WishVO> wishList(String userid) {
		return dao.wishList(userid);
	}

	@Override
	public WishVO getWish(Integer wish_no) {
		return dao.getWish(wish_no);
	}

	@Override
	public void updateWish(WishVO wishVO) {
		dao.updateWish(wishVO);
	}

	@Override
	public String getWishItem(Map<String, Object> id) {
		return dao.getWishItem(id);
	}
	
	

}
