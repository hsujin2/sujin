package com.mommefatale.user.service;

import java.util.Map;

import com.mommefatale.user.model.UserVO;

public interface UserUpdateService {
	public void userUpdate(Map<String, Object> vo);
	public UserVO sessionUpdate(String id);
}
