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
			public CommunityBoardVO getCommunityContent(int no);
			//�� �����ϱ�
			public void CommunityUpdate(Map<String, Object> vo);
			//�� �����ϱ�
			public void CommunityDelete(int no);
			// �� �˻��ϱ�
			public CommunityBoardVO CommunitySearch(Map<String, Object> vo);
			//�� ���� ��������
			public int getCommunityCount();
			//�� ��ȸ�� �ø���
			public void CommunityView(int no);
}
