package com.mommefatale.user.service;

import java.util.Map;

import com.mommefatale.user.model.UserVO;

public interface UserInsertService {
	public void insertUser(Map<String, Object> vo);
	public void createCoupons();
}
