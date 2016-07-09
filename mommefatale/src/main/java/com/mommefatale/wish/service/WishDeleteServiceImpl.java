package com.mommefatale.wish.service;

import com.mommefatale.wish.dao.WishDAO;

public class WishDeleteServiceImpl implements WishDeleteService{
	private WishDAO dao;
	
	public void setDao(WishDAO dao) {
		this.dao = dao;
	}

	@Override
	public void wishDelete(String wish_no) {
		dao.wishDelete(wish_no);		
	}

}
