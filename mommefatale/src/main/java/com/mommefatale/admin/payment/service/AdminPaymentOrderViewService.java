package com.mommefatale.admin.payment.service;

import java.util.List;

import com.mommefatale.admin.payment.model.OrderDateVO;
import com.mommefatale.admin.payment.model.PaymentVO;


public interface AdminPaymentOrderViewService {
	public List<PaymentVO> paymentList();
	public List<PaymentVO> paymentDateList(OrderDateVO orderdateVO);
}
