package com.mommefatale.payment.service;

import java.util.Map;

import com.mommefatale.payment.model.PaymentVO;

public interface PaymentCompleteService {
	public void insertOrder(PaymentVO paymentVO);
	public void insertOrderList(PaymentVO paymentVO);
	public void updateItemCount(PaymentVO paymentVO);
	public void insertPoint(Map<String, Object> points);
	public void insertPayway(PaymentVO paymentVO);
}
