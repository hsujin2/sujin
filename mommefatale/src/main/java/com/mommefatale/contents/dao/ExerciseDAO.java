package com.mommefatale.contents.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.contents.model.ExerciseVO;

public interface ExerciseDAO {
	// ����Ʈ ��������
	public List<ExerciseVO> getExerciseList(Object obj);

	// �� ���� ��������
	public int getExerciseCount();

	// �۾���
	public void exerciseWrite(Map<String, Object> vo);

	// �۳��� ��������
	public ExerciseVO getExerciseContent(int no);

	// �� ��ȸ�� �ø���
	public void exerciseView(int no);

	// �� �����ϱ�
	public void exerciseUpdate(Map<String, Object> vo);

	// �� �����ϱ�
	public void ExerciseDelete(int no);
}
