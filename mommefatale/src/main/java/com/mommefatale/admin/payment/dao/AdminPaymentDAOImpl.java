package com.mommefatale.admin.payment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mommefatale.admin.payment.model.OrderDateVO;
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
	
	
	

}
