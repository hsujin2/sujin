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
		System.out.println("자유게시판 글쓰기 DAO");
		session.insert("com.mommefatale.board.dao.BoardMapper.communityWrite", vo);
		return;
	}

	@Override
	public List<CommunityBoardVO> getCommunityList(Object obj) {
		System.out.println("자유게시판 리스트 DAO");
		return session.selectList("com.mommefatale.board.dao.BoardMapper.communityList", obj);
	}

	@Override
	public CommunityBoardVO getCommunityContent(int no) {
		System.out.println("자유게시판 글내용 DAO");
		return session.selectOne("com.mommefatale.board.dao.BoardMapper.communityContent", no);
	}

	@Override
	public void CommunityUpdate(Map<String, Object> vo) {
		System.out.println("자유게시판 글수정 DAO");
		session.update("com.mommefatale.board.dao.BoardMapper.communityUpdate", vo);
	}

	@Override
	public void CommunityDelete(int no) {
		System.out.println("자유게시판 글삭제 DAO");
		session.delete("com.mommefatale.board.dao.BoardMapper.communityDelete", no);
	}

	@Override
	public int getCommunityCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CommunityBoardVO CommunitySearch(Map<String, Object> vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
