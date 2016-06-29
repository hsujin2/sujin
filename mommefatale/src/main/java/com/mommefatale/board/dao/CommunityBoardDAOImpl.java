package com.mommefatale.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import com.mommefatale.board.model.CommunityBoardVO;

public class CommunityBoardDAOImpl implements CommunityBoardDAO {

	private static final String namespace = "BoardMapper";

	private SqlSessionTemplate session;

	public SqlSessionTemplate getSession() {
		return session;
	}

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}

	@Override
	public void communityWrite(Map<String, Object> vo) {
		System.out.println("자유게시판 글쓰기 DAO");
		session.insert(namespace + ".communityWrite", vo);
		return;
	}

	
	@Override
	public List<CommunityBoardVO> getCommunityList(Object obj) {
		System.out.println("자유게시판 리스트 DAO");
		return session.selectList(namespace + ".communityList", obj);
	}

	@Override
	public CommunityBoardVO getCommunityContent(int no) {
		System.out.println("자유게시판 글내용 DAO");
		return session.selectOne(namespace + ".communityContent", no);
	}

	@Override
	public void communityUpdate(Map<String, Object> vo) {
		System.out.println("자유게시판 글수정 DAO");
		session.update(namespace + ".communityUpdate", vo);
	}

	@Override
	public void communityDelete(int no) {
		System.out.println("자유게시판 글삭제 DAO");
		session.delete(namespace + ".communityDelete", no);
	}

	@Override
	public int getCommunityCount() {
		int count = session.selectOne(namespace + ".communityCount");
		System.out.println("자유게시판 총 게시물 수 : " + count);
		return count;
	}

	@Override
	public CommunityBoardVO communitySearch(Map<String, Object> vo) {
		return null;
	}

	@Override
	public void communityView(int no) {
		System.out.println(no + "번 글 조회수 1 증가");
		session.update(namespace + ".communityView", no);
	}

	@Override
	public void communityReply(Map<String, Object> vo) {
		System.out.println("자유게시판 답글쓰기 DAO");
		session.update(namespace+".addStep", vo);
		session.insert(namespace + ".communityReply", vo);
		return;

	}

	@Override
	public List<CommunityBoardVO> indexCommunityList() {
		System.out.println("인덱스 자유게시판 리스트 DAO");
		return session.select(namespace+".indexCommunityList");
	}

}
