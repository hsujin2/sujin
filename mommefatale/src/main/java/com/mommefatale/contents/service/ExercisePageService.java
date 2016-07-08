package com.mommefatale.contents.service;

import java.util.List;

import com.mommefatale.contents.model.ExerciseVO;

public interface ExercisePageService {
	public List<ExerciseVO> ExercisePage(Object obj);
	public int ExercisePageCount();
}
