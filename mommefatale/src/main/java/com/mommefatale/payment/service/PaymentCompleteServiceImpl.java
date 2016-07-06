package com.mommefatale.payment.service;

import java.util.Map;

import com.mommefatale.payment.dao.PaymentDAO;
import com.mommefatale.payment.model.PaymentVO;

public class PaymentCompleteServiceImpl implements PaymentCompleteService{
	
	private PaymentDAO dao;

	public void setDao(PaymentDAO dao) {
		this.dao = dao;
	}

	@Override
	public void insertOrder(PaymentVO paymentVO) {
		dao.insertOrder(paymentVO);
	}

	@Override
	public void insertOrderList(PaymentVO paymentVO) {
		dao.insertOrderList(paymentVO);
	}

	@Override
	public void updateItemCount(PaymentVO paymentVO) {
		dao.updateItemCount(paymentVO);
	}

	@Override
	public void insertPoint(Map<String, Object> points) {
		dao.insertPoint(points);
	}

	@Override
	public void insertPayway(PaymentVO paymentVO) {
		dao.insertPayway(paymentVO);
	}
	@Override
	public String getAccount(String bank) {
		return dao.getAccount(bank);
	}

}
