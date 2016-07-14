package com.mommefatale.admin.board.service;

import com.mommefatale.admin.board.dao.BoardDAO;

public class BoardServiceImpl implements BoardService {

	private BoardDAO dao;
	
	public BoardDAO getDao() {
		return dao;
	}
	
	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public int getBoardNewCount(int board_no) {
		System.out.println(board_no +"���� �� Service");
		return dao.getBoardNewCount(board_no);
	}

	@Override
	public int getBoardAllCount(int board_no) {
		System.out.println(board_no +"��ü�� �� Service");
		return dao.getBoardAllCount(board_no);
	}

}
