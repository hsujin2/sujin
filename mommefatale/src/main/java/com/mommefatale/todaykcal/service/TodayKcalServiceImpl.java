package com.mommefatale.todaykcal.service;

import java.util.List;
import java.util.Map;

import com.mommefatale.todaykcal.dao.TodayKcalDAO;
import com.mommefatale.todaykcal.model.FoodVO;

public class TodayKcalServiceImpl implements TodayKcalService {


	private TodayKcalDAO dao;
	
	public TodayKcalDAO getDao() {
		return dao;
	}

	public void setDao(TodayKcalDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<FoodVO> TodayKcalFoodList(Object obj) {
		System.out.println("food ����Ʈ ����");
		return dao.getFoodList(obj);
	}

	@Override
	public void TodayKcalMyList(Map<String, Object> vo) {
		System.out.println("������ �Ĵ� ���� ����Ʈ ����");
		dao.saveTodayKcal(vo);
	}

	@Override
	public int TodayKcalFoodCount() {
		System.out.println("food �Խù� ��");
		return dao.getFoodCount();
	}

	
}
