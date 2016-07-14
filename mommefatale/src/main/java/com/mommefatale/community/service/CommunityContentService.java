package com.mommefatale.community.service;

import com.mommefatale.community.model.CommunityBoardVO;

public interface CommunityContentService {

	public CommunityBoardVO communityContent(int no);

	public void communityView(int no);
}
