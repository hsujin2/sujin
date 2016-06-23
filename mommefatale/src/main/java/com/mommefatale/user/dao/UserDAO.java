package com.mommefatale.user.dao;

import java.util.Map;

import com.mommefatale.user.model.UserVO;

public interface UserDAO {
	public UserVO idCheck(String userid);
	public UserVO emailCheck(String useremail);
	public void insertUser(Map<String, Object> vo);
	public UserVO loginCheck(String id);
}
