package com.mommefatale.admin.sitestatus.dao;

import java.util.List;

import com.mommefatale.admin.sitestatus.model.BestVO;
import com.mommefatale.admin.sitestatus.model.GradeVO;
import com.mommefatale.admin.sitestatus.model.VisitVO;


public interface StatusDAO {
	public List<GradeVO> gradeStatus();
	public List<VisitVO> visitStatus();
	public List<BestVO> bestStatus();
}
