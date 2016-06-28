package com.mommefatale.qna.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mommefatale.qna.model.QnaVO;

public class QnaDAOImpl implements QnaDAO {

	private static final String namespace = "QnaMapper";

	private SqlSessionTemplate session;

	public SqlSessionTemplate getSession() {
		return session;
	}

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}

	@Override
	public void qnaWrite(Map<String, Object> vo) {
		System.out.println("QnA게시판 글쓰기 DAO");
		session.insert(namespace + ".qnaWrite", vo);
		return;
	}

	@Override
	public List<QnaVO> getQnaList(Object obj) {
		System.out.println("QnA게시판 리스트 DAO");
		return session.selectList(namespace + ".qnaList", obj);
	}

	@Override
	public QnaVO getQnaContent(int no) {
		System.out.println("QnA게시판 글내용 DAO");
		return session.selectOne(namespace + ".qnaContent", no);
	}

	@Override
	public void qnaUpdate(Map<String, Object> vo) {
		System.out.println("QnA게시판 글수정 DAO");
		session.update(namespace + ".qnaUpdate", vo);
	}

	@Override
	public void qnaDelete(int no) {
		System.out.println("QnA게시판 글삭제 DAO");
		session.delete(namespace + ".qnaDelete", no);
	}

	@Override
	public QnaVO qnaSearch(Map<String, Object> vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getQnaCount() {
		int count = session.selectOne(namespace + ".qnaCount");
		System.out.println("QnA게시판 총 게시물 수 : " + count);
		return count;
	}

	@Override
	public void qnaView(int no) {
		System.out.println(no + "번 글 조회수 1 증가");
		session.update(namespace + ".qnaView", no);
	}

	@Override
	public void qnaReply(Map<String, Object> vo) {
		System.out.println("QnA게시판 답글쓰기 DAO");
		session.update(namespace + ".addStep", vo);
		session.insert(namespace + ".qnaReply", vo);
		return;
	}

}
