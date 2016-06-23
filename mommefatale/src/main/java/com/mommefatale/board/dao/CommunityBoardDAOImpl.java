package com.mommefatale.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mommefatale.board.model.CommunityBoardVO;

public class CommunityBoardDAOImpl implements CommunityBoardDAO {

private SqlSessionTemplate session;
	
	public SqlSessionTemplate getSession() {
		return session;
	}

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}
	
	
	@Override
	public void CommunityWrite(Map<String, Object> vo) {

		session.insert("com.mommefatale.board.BoardMapper.writeCommunity",vo);
		return;
	}

	@Override
	public void CommunityModify(Map<String, Object> vo) {
		// TODO Auto-generated method stub

	}

	
	@Override
	public void CommunityDelete(int num) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getCommunityCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CommunityBoardVO> getCommunityList(Object obj) {
		
		return session.selectList("com.mommefatale.board.BoardMapper.CommunityList", obj);
	}

}
