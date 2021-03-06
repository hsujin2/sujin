package com.mommefatale.contents.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.contents.model.ExerciseVO;
import com.mommefatale.item.model.ItemVO;

public interface ExerciseDAO {
	// 리스트 가져오기
	public List<ExerciseVO> getExerciseList(Object obj);

	// 글 개수 가져오기
	public int getExerciseCount();

	// 글쓰기
	public void exerciseWrite(Map<String, Object> vo);

	// 글내용 가져오기
	public ExerciseVO getExerciseContent(int no);

	// 글 조회수 올리기
	public void exerciseView(int no);

	// 글 수정하기
	public void exerciseUpdate(ExerciseVO exerciseVO);

	// 글 삭제하기
	public void ExerciseDelete(int no);
	
	//카테고리 분류
	public List<ExerciseVO> listCategory(Map<String, Object> map);
	
	//카테고리 카운트
	public int getCategoryCount(String category);
}
