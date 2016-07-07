package com.mommefatale.payment.service;

import java.util.List;

import com.mommefatale.payment.model.OrderDateVO;
import com.mommefatale.payment.model.PaymentListVO;

public interface PaymentOrderViewService {
	public List<PaymentListVO> paymentList(String userid);
	public List<PaymentListVO> paymentDateList(OrderDateVO orderdateVO);
}
