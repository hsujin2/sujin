package com.mommefatale.payment.service;

import java.util.List;
import java.util.Map;

import com.mommefatale.payment.dao.PaymentDAO;
import com.mommefatale.payment.model.BankVO;

public class PaymentViewServiceImpl implements PaymentViewService{
	private PaymentDAO dao;

	public void setDao(PaymentDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<BankVO> getBank() {
		return dao.getBank();
	}

}
