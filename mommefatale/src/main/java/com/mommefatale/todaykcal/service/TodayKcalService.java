package com.mommefatale.todaykcal.service;

import java.util.List;
import java.util.Map;

import com.mommefatale.todaykcal.model.FoodVO;

public interface TodayKcalService {
	
	public List<FoodVO> TodayKcalFoodList(Object obj); 
	public int TodayKcalFoodCount();
	public void TodayKcalMyList(Map<String, Object> vo);
}
