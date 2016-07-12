package com.mommefatale.contents.service;

import java.util.List;
import java.util.Map;

import com.mommefatale.contents.model.ExerciseVO;


public interface ExercisePageService {
	public List<ExerciseVO> ExercisePage(Object obj);
	public List<ExerciseVO> listCategory(Map<String, Object> map);
	public int ExercisePageCount();
	public int getCategoryCount(String category);
}
