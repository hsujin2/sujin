package com.mommefatale.todaykcal.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mommefatale.todaykcal.model.FoodVO;
import com.mommefatale.todaykcal.model.KcalVO;

public class TodayKcalDAOImpl implements TodayKcalDAO {

	private static final String namespace = "TodayKcalMapper";
	
	private SqlSessionTemplate session;

	public SqlSessionTemplate getSession() {
		return session;
	}

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}

	@Override
	public List<FoodVO> getFoodList(Object obj) {
		System.out.println("food list �������� DAO");
		return session.selectList(namespace + ".getFoodList", obj);
	}

	@Override
	public int getFoodCount() {
		System.out.println("food ���� �������� DAO");
		int count =  session.selectOne(namespace + ".getFoodCount");
		System.out.println("�ش��ϴ� food �� �Խù� �� : " + count);
		return count;
	}
	
	@Override
	public void saveTodayKcal(Map<String, Object> vo) {
		System.out.println("������ Į�θ� ���� DAO");
		session.insert(namespace + ".saveTodayKcal", vo);
		return;
	}

	@Override
	public List<KcalVO> getKcal(String member_id) {
		System.out.println("ȸ�����̵�DAO : " + member_id);
		System.out.println("�̹��� Į�θ� �������� DAO");
		return session.selectList(namespace + ".getKcal", member_id);
	}

}
