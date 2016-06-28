package com.mommefatale.qna.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.qna.model.QnaVO;

public interface QnaDAO {

	// �۾���
	public void qnaWrite(Map<String, Object> vo);

	// ��� ��������
	public List<QnaVO> getQnaList(Object obj);

	// �� ���� ��������
	public QnaVO getQnaContent(int no);

	// �� �����ϱ�
	public void qnaUpdate(Map<String, Object> vo);

	// �� �����ϱ�
	public void qnaDelete(int no);

	// �� �˻��ϱ�
	public QnaVO qnaSearch(Map<String, Object> vo);

	// �� ���� ��������
	public int getQnaCount();

	// �� ��ȸ�� �ø���
	public void qnaView(int no);

	// ��۾���
	public void qnaReply(Map<String, Object> vo);
}
