package com.mommefatale.todaykcal.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.todaykcal.model.FoodVO;
import com.mommefatale.todaykcal.model.KcalVO;

public interface TodayKcalDAO {
	
	// food 리스트 가져오기
	public List<FoodVO> getFoodList(Object obj);
	
	// food 갯수 가져오기
	public int getFoodCount();
	
	// 오늘의 칼로리 저장
	public void saveTodayKcal(Map<String, Object> vo);
	
	// 이번주 칼로리 가져오기
	public List<KcalVO> getKcal(String member_id);
}
