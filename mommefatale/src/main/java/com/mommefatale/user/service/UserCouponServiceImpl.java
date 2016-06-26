package com.mommefatale.user.service;

import java.util.List;

import com.mommefatale.user.controller.UserCouponController;
import com.mommefatale.user.dao.UserDAO;
import com.mommefatale.user.model.CouponVO;

public class UserCouponServiceImpl implements UserCouponService {
	
	private UserDAO dao;
	public void setDao(UserDAO dao){
		this.dao = dao;
	}
	@Override
	public List<CouponVO> getCoupons(int coupons_no) {
		return dao.getCoupons(coupons_no);
	}

}
