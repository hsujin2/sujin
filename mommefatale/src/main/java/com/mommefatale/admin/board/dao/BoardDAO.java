package com.mommefatale.admin.board.dao;

public interface BoardDAO {

	// 새글 수 가져오기
	public int getBoardNewCount(int board_no);
	
	// 전체글 수 가져오기
	public int getBoardAllCount(int board_no);
}
