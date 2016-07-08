package com.mommefatale.review.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mommefatale.qna.dao.QnaDAO;
import com.mommefatale.qna.model.QnaVO;
import com.mommefatale.review.model.ReviewVO;

public class ReviewDAOImpl implements ReviewDAO {
	private static final String nameSapae = "reviewMapper";

	private SqlSessionTemplate session;

	public SqlSessionTemplate getSession() {
		return session;
	}

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}

	@Override
	public void reviewWrite(Map<String, Object> vo) {
		System.out.println("리뷰 글쓰기 DAO");
		session.insert(nameSapae + ".reviewWrite", vo);
		return;

	}

	@Override
	public List<ReviewVO> getReviewList(Object obj) {
		System.out.println("리뷰 글목록 DAO");
		return session.selectList(nameSapae + ".reviewList", obj);
	}

	@Override
	public ReviewVO getReviewContent(int no) {
		System.out.println("리뷰 글내용 DAO");
		return session.selectOne(nameSapae + ".reviewContent", no);
	}

	@Override
	public void reviewUpdate(Map<String, Object> vo) {
		System.out.println("리뷰 글수정 DAO");
		session.update(nameSapae + ".reviewUpdate", vo);

	}

	@Override
	public void reviewDelete(int no) {
		System.out.println("리뷰 글삭제 DAO");
		session.delete(nameSapae + ".reviewDelete", no);

	}

	@Override
	public int getReviewCount() {
		int count = session.selectOne(nameSapae + ".reviewCount");
		System.out.println("리뷰 게시물 수  : " + count);
		return count;
	}

	@Override
	public void reviewView(int no) {
		System.out.println(no + "번 조회수 조회수");
		session.update(nameSapae + ".reviewView", no);
	}

}
