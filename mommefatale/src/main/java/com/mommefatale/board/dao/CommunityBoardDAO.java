package com.mommefatale.board.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.board.model.CommunityBoardVO;

public interface CommunityBoardDAO {

	//커뮤니티 게시판
			// 글쓰기 
			public void CommunityWrite(Map<String, Object> vo);
			//목록 가져오기
			public List<CommunityBoardVO> getCommunityList(Object obj);
			//글 내용 가져오기
			public CommunityBoardVO getCommunityContent(int no);
			//글 수정하기
			public void CommunityUpdate(Map<String, Object> vo);
			//글 삭제하기
			public void CommunityDelete(int no);
			// 글 검색하기
			public CommunityBoardVO CommunitySearch(Map<String, Object> vo);
			//글 개수 가져오기
			public int getCommunityCount();
			//글 조회수 올리기
			public void CommunityView(int no);
}
