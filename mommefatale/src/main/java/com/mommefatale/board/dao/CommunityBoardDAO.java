package com.mommefatale.board.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.board.model.CommunityBoardVO;

public interface CommunityBoardDAO {

	//Ŀ�´�Ƽ �Խ���
			// �۾��� 
			public void CommunityWrite(Map<String, Object> vo);
			//��� ��������
			public List<CommunityBoardVO> getCommunityList(Object obj);
			//�� ���� ��������
	//		public CommunityVO getCommunityContent(int num);
			//�� �����ϱ�
			public void CommunityModify(Map<String, Object> vo);
			//�� �����ϱ�
			public void CommunityDelete(int num);
			// �� �˻��ϱ�
	//		public CommunityVO CommunitySearch(Map<String, Object> vo);
			//�� ���� ��������
			public int getCommunityCount();
}
