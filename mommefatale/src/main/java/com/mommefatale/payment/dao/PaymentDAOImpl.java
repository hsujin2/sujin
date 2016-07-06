package com.mommefatale.payment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mommefatale.payment.model.BankVO;
import com.mommefatale.payment.model.PaymentVO;

public class PaymentDAOImpl implements PaymentDAO{
	private static final String namespace = "com.mommefatale.payment.dao.PaymentMapper";
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public void insertOrder(PaymentVO paymentVO) {
		session.insert(namespace + ".insertOrder",paymentVO);
	}
	@Override
	public void insertOrderList(PaymentVO paymentVO){
		session.insert(namespace + ".insertOrderList",paymentVO);
	}
	@Override
	public void updateItemCount(PaymentVO paymentVO){
		session.update(namespace + ".updateItemCount",paymentVO);
	}
	@Override
	public void insertPoint(Map<String, Object> points) {
		session.update(namespace + ".insertPoint",points);
	}
	@Override
	public List<BankVO> getBank() {
		 return session.selectList(namespace + ".getBank");
	}
	@Override
	public void insertPayway(PaymentVO paymentVO) {
		session.insert(namespace + ".insertPayway",paymentVO);
	}
	@Override
	public String getAccount(String bank) {
		return session.selectOne(namespace + ".getAccount",bank);
	}
	
	

}
