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
		System.out.println("food ����Ʈ ����");
		return dao.getFoodList(obj);
	}

	@Override
	public void todayKcalMyList(Map<String, Object> vo) {
		System.out.println("������ �Ĵ� ���� ����Ʈ ����");
		dao.saveTodayKcal(vo);
	}

	@Override
	public int todayKcalFoodCount() {
		System.out.println("food �Խù� ��");
		return dao.getFoodCount();
	}

	@Override
	public List<KcalVO> todayKcalRecord(String member_id) {
		System.out.println("ȸ�����̵�Service : " + member_id);
		System.out.println("�̹��� Į�θ� ����Ʈ ����");
		return dao.getKcal(member_id);
	}

	
}
