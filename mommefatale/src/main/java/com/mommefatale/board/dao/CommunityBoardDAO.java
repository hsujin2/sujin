package com.mommefatale.board.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.board.model.CommunityBoardVO;

public interface CommunityBoardDAO {

	// Ŀ�´�Ƽ �����Խ���
	// �۾���
	public void communityWrite(Map<String, Object> vo);

	// ����Ʈ ��������
	public List<CommunityBoardVO> getCommunityList(Object obj);

	// �� ���� ��������
	public CommunityBoardVO getCommunityContent(int no);

	// �� �����ϱ�
	public void communityUpdate(Map<String, Object> vo);

	// �� �����ϱ�
	public void communityDelete(int no);

	// �� �˻��ϱ�
	public CommunityBoardVO communitySearch(Map<String, Object> vo);

	// �� ���� ��������
	public int getCommunityCount();

	// �� ��ȸ�� �ø���
	public void communityView(int no);

	// ��۾���
	public void communityReply(Map<String, Object> vo);

	// �ε����� ����Ʈ ��������
	public List<CommunityBoardVO> indexCommunityList();
}
