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
		System.out.println("food list 가져오기 DAO");
		return session.selectList(namespace + ".getFoodList", obj);
	}

	@Override
	public int getFoodCount() {
		System.out.println("food 갯수 가져오기 DAO");
		int count =  session.selectOne(namespace + ".getFoodCount");
		System.out.println("해당하는 food 총 게시물 수 : " + count);
		return count;
	}
	
	@Override
	public void saveTodayKcal(Map<String, Object> vo) {
		System.out.println("오늘의 칼로리 저장 DAO");
		session.insert(namespace + ".saveTodayKcal", vo);
		return;
	}

	@Override
	public List<KcalVO> getKcal(String member_id) {
		System.out.println("회원아이디DAO : " + member_id);
		System.out.println("이번주 칼로리 가져오기 DAO");
		return session.selectList(namespace + ".getKcal", member_id);
	}

}
