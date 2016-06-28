package com.mommefatale.qna.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.qna.model.QnaVO;

public interface QnaDAO {

	// 글쓰기
	public void qnaWrite(Map<String, Object> vo);

	// 목록 가져오기
	public List<QnaVO> getQnaList(Object obj);

	// 글 내용 가져오기
	public QnaVO getQnaContent(int no);

	// 글 수정하기
	public void qnaUpdate(Map<String, Object> vo);

	// 글 삭제하기
	public void qnaDelete(int no);

	// 글 검색하기
	public QnaVO qnaSearch(Map<String, Object> vo);

	// 글 개수 가져오기
	public int getQnaCount();

	// 글 조회수 올리기
	public void qnaView(int no);

	// 답글쓰기
	public void qnaReply(Map<String, Object> vo);
}
