package com.mommefatale.user.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.user.model.CouponVO;
import com.mommefatale.user.model.UserVO;

public interface UserDAO {
	public UserVO idCheck(String userid);
	public UserVO emailCheck(String useremail);
	public void insertUser(Map<String, Object> vo);
	public UserVO loginCheck(String id);
	public void userUpdate(Map<String, Object> vo);
	public UserVO sessionUpdate(String id);
	public void deleteUser(String userid);
	public void createCoupons();
	public List<CouponVO> getCoupons(int coupons_no);
	public String searchId(Map<String, Object> vo);
	public Integer getAmount(String coupon_no);
}
