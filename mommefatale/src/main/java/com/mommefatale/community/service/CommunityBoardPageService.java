package com.mommefatale.community.service;

import java.util.List;

import com.mommefatale.community.model.CommunityBoardVO;

public interface CommunityBoardPageService {
	public List<CommunityBoardVO> communityBoardPage(Object obj);
	public int communityPageCount();
}
