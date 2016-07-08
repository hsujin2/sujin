package com.mommefatale.contents.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mommefatale.contents.model.ExerciseVO;

public class ExerciseDAOImpl implements ExerciseDAO {

	private static final String namespace = "ExerciseMapper";
	
	private SqlSessionTemplate session;
	
	public SqlSessionTemplate getSession() {
		return session;
	}

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}

	@Override
	public List<ExerciseVO> getExerciseList(Object obj) {
		System.out.println("운동법 리스트 DAO");
		return session.selectList(namespace + ".exerciseList", obj);
	}

	@Override
	public int getExerciseCount() {
		int count = session.selectOne(namespace + ".exerciseCount");
		System.out.println("운동법 총 게시물 수 : " + count);
		return 0;
	}
	

	@Override
	public void exerciseWrite(Map<String, Object> vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public ExerciseVO getExerciseContent(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void exerciseView(int no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void exerciseUpdate(Map<String, Object> vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void ExerciseDelete(int no) {
		// TODO Auto-generated method stub

	}

}
