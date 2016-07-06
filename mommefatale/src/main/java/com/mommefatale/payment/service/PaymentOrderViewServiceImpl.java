package com.mommefatale.payment.service;

import java.util.List;

import com.mommefatale.payment.dao.PaymentDAO;
import com.mommefatale.payment.model.PaymentListVO;

public class PaymentOrderViewServiceImpl implements PaymentOrderViewService{
	private PaymentDAO dao;

	public void setDao(PaymentDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<PaymentListVO> paymentList(String userid) {
		return dao.paymentList(userid);
	}

}
