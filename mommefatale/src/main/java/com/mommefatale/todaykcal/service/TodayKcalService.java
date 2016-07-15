package com.mommefatale.todaykcal.service;

import java.util.List;
import java.util.Map;

import com.mommefatale.todaykcal.model.FoodVO;
import com.mommefatale.todaykcal.model.KcalVO;

public interface TodayKcalService {
	
	public List<FoodVO> todayKcalFoodList(Object obj); 
	public int todayKcalFoodCount();
	public void todayKcalMyList(Map<String, Object> vo);
	public List<KcalVO> todayKcalRecord(String member_id);
}
