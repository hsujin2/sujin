package com.mommefatale.board.service;

import java.util.List;

import com.mommefatale.board.model.CommunityBoardVO;

public interface CommunityBoardPageService {
	public List<CommunityBoardVO> CommunityBoardPage(Object obj);
	public int CommunityPageCount();
}
