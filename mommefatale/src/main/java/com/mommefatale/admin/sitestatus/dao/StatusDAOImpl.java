package com.mommefatale.admin.sitestatus.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mommefatale.admin.sitestatus.model.GradeVO;


public class StatusDAOImpl implements StatusDAO{
	private static final String namespace = "com.mommefatale.admin.sitestatus.dao.StatusMapper";
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<GradeVO> gradeStatus() {
		return session.selectList(namespace+".gradeStatus");
	}

}