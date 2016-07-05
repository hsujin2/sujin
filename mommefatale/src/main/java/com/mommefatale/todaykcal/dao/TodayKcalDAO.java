package com.mommefatale.todaykcal.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.todaykcal.model.FoodVO;

public interface TodayKcalDAO {
	
	// food ����Ʈ ��������
	public List<FoodVO> getFoodList(Object obj);
	
	// food ���� ��������
	public int getFoodCount();
	
	// ������ Į�θ� ����
	public void saveTodayKcal(Map<String, Object> vo);
}
