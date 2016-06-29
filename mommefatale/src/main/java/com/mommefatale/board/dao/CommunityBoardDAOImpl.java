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
		System.out.println("�����Խ��� �۾��� DAO");
		session.insert(namespace + ".communityWrite", vo);
		return;
	}

	
	@Override
	public List<CommunityBoardVO> getCommunityList(Object obj) {
		System.out.println("�����Խ��� ����Ʈ DAO");
		return session.selectList(namespace + ".communityList", obj);
	}

	@Override
	public CommunityBoardVO getCommunityContent(int no) {
		System.out.println("�����Խ��� �۳��� DAO");
		return session.selectOne(namespace + ".communityContent", no);
	}

	@Override
	public void communityUpdate(Map<String, Object> vo) {
		System.out.println("�����Խ��� �ۼ��� DAO");
		session.update(namespace + ".communityUpdate", vo);
	}

	@Override
	public void communityDelete(int no) {
		System.out.println("�����Խ��� �ۻ��� DAO");
		session.delete(namespace + ".communityDelete", no);
	}

	@Override
	public int getCommunityCount() {
		int count = session.selectOne(namespace + ".communityCount");
		System.out.println("�����Խ��� �� �Խù� �� : " + count);
		return count;
	}

	@Override
	public CommunityBoardVO communitySearch(Map<String, Object> vo) {
		return null;
	}

	@Override
	public void communityView(int no) {
		System.out.println(no + "�� �� ��ȸ�� 1 ����");
		session.update(namespace + ".communityView", no);
	}

	@Override
	public void communityReply(Map<String, Object> vo) {
		System.out.println("�����Խ��� ��۾��� DAO");
		session.update(namespace+".addStep", vo);
		session.insert(namespace + ".communityReply", vo);
		return;

	}

	@Override
	public List<CommunityBoardVO> indexCommunityList() {
		System.out.println("�ε��� �����Խ��� ����Ʈ DAO");
		return session.select(namespace+".indexCommunityList");
	}

}
