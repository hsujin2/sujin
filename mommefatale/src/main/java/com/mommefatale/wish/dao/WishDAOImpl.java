package com.mommefatale.wish.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mommefatale.wish.model.WishVO;

public class WishDAOImpl implements WishDAO{
	private static final String namespace = "com.mommefatale.wish.dao.WishMapper";
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertWish(WishVO wishVO) {
		session.insert(namespace + ".insertWish",wishVO);
	}

	@Override
	public List<WishVO> wishList(String userid) {
		return session.selectList(namespace + ".wishList",userid);
	}

	@Override
	public WishVO getWish(Integer wish_no) {
		return session.selectOne(namespace + ".getWish",wish_no);
	}

	@Override
	public void updateWish(WishVO wishVO) {
		session.update(namespace + ".updateWish",wishVO);
	}

	@Override
	public String getWishItem(Map<String, Object> id) {
		return session.selectOne(namespace + ".getWishItem",id);
	}

	@Override
	public void wishDelete(String wish_no) {
		session.delete(namespace + ".wishDelete",wish_no);
	}
	

}
