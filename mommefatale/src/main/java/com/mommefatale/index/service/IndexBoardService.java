package com.mommefatale.index.service;

import java.util.List;

import com.mommefatale.community.model.CommunityBoardVO;

public interface IndexBoardService {
	public List<CommunityBoardVO> indexCommunityList();
	public List<CommunityBoardVO> indexNoticeList();
}
