package com.mommefatale.user.service;

import java.util.List;

import com.mommefatale.user.model.CouponVO;

public interface UserCouponService {
	public List<CouponVO> getCoupons(int coupons_no);
	public Integer getAmount(String coupon_no);
}
