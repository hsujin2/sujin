package com.mommefatale.todaykcal.service;

import java.util.List;
import java.util.Map;

import com.mommefatale.todaykcal.dao.TodayKcalDAO;
import com.mommefatale.todaykcal.model.FoodVO;
import com.mommefatale.todaykcal.model.KcalVO;

public class TodayKcalServiceImpl implements TodayKcalService {


	private TodayKcalDAO dao;
	
	public TodayKcalDAO getDao() {
		return dao;
	}

	public void setDao(TodayKcalDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<FoodVO> todayKcalFoodList(Object obj) {
		System.out.println("food 리스트 서비스");
		return dao.getFoodList(obj);
	}

	@Override
	public void todayKcalMyList(Map<String, Object> vo) {
		System.out.println("오늘의 식단 저장 리스트 서비스");
		dao.saveTodayKcal(vo);
	}

	@Override
	public int todayKcalFoodCount() {
		System.out.println("food 게시물 수");
		return dao.getFoodCount();
	}

	@Override
	public List<KcalVO> todayKcalRecord(String member_id) {
		System.out.println("회원아이디Service : " + member_id);
		System.out.println("이번주 칼로리 리스트 서비스");
		return dao.getKcal(member_id);
	}

	
}
