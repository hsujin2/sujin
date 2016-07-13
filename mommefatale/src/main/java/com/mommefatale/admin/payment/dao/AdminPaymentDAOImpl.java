package com.mommefatale.admin.payment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mommefatale.admin.payment.model.OrderDateVO;
import com.mommefatale.admin.payment.model.PaymentListVO;
import com.mommefatale.admin.payment.model.PaymentVO;


public class AdminPaymentDAOImpl implements AdminPaymentDAO{
	private static final String namespace = "com.mommefatale.admin.payment.dao.AdminPaymentMapper";
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<PaymentVO> paymentList() {
		return session.selectList(namespace + ".paymentlist");
	}
	@Override
	public List<PaymentVO> paymentDateList(OrderDateVO orderdateVO) {
		return session.selectList(namespace + ".paymentDateList",orderdateVO);
	}

	@Override
	public List<PaymentListVO> paymentDetailList(Integer order_no) {
		return session.selectList(namespace + ".pamentDetailList",order_no);
	}

	@Override
	public void modifyPaymentList(Map<String, Object> map) {
		session.update(namespace+".modifyPaymentList",map);
	}

	@Override
	public Integer getQuantity(Map<String, Object> map) {
		return session.selectOne(namespace + ".getQuantity",map);
	}

	@Override
	public void updateTotalprice(Map<String, Object> map) {
		session.update(namespace + ".updateTotalprice",map);
	}
	
	
	

}
