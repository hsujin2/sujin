package com.mommefatale.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mommefatale.user.model.CouponVO;
import com.mommefatale.user.model.UserVO;

public class UserDAOImpl implements UserDAO {
	
	private static final String namespace = "com.mommefatale.user.dao.UserMapper";
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
		
	}

	@Override
	public UserVO idCheck(String userid) {
		return session.selectOne(namespace + ".selectId", userid);
	}

	@Override
	public UserVO emailCheck(String useremail) {
		return session.selectOne(namespace + ".selectEmail", useremail);
	}

	@Override
	public void insertUser(Map<String, Object> vo) {
		session.insert(namespace + ".insertUser", vo);
	}

	@Override
	public UserVO loginCheck(String id) {
		
		return session.selectOne(namespace + ".selectId",id);
	}

	@Override
	public void userUpdate(Map<String, Object> vo) {
		
		session.update(namespace + ".userUpdate",vo);
	}

	@Override
	public UserVO sessionUpdate(String id) {

		return session.selectOne(namespace + ".selectId",id);
	}

	@Override
	public void deleteUser(String userid) {
		session.delete(namespace + ".userdelete",userid);
	}

	@Override
	public void createCoupons() {
		session.insert(namespace + ".createCoupons");
	}

	@Override
	public List<CouponVO> getCoupons(int coupons_no) {
		return session.selectList(namespace + ".selectCoupons",coupons_no);
	}

	@Override
	public String searchId(Map<String, Object> vo) {
		return session.selectOne(namespace + ".searchId",vo);
	}
	
	
	
	

}
