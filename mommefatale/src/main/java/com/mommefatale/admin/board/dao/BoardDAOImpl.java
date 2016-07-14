package com.mommefatale.admin.board.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class BoardDAOImpl implements BoardDAO {

	private static final String namespace = "BoardMapper";

	private SqlSessionTemplate session;

	public SqlSessionTemplate getSession() {
		return session;
	}

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}

	@Override
	public int getBoardNewCount(int board_no) {
		int newCount = session.selectOne(namespace + ".newCount", board_no);
		System.out.println(board_no + "새글 수 DAO");
		return newCount;
	}

	@Override
	public int getBoardAllCount(int board_no) {
		int allCount = session.selectOne(namespace + ".allCount", board_no);
		System.out.println(board_no + "전체글 수 DAO");
		return allCount;
	}

}
