package com.mommefatale.payment.service;

import java.util.List;

import com.mommefatale.payment.model.BankVO;

public interface PaymentViewService {
	public List<BankVO> getBank();
	public Integer getUseAblePoint(String userid);
}
