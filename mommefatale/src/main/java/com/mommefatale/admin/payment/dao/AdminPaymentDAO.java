package com.mommefatale.admin.payment.dao;

import java.util.List;

import com.mommefatale.admin.payment.model.OrderDateVO;
import com.mommefatale.admin.payment.model.PaymentListVO;
import com.mommefatale.admin.payment.model.PaymentVO;


public interface AdminPaymentDAO {
	
	public List<PaymentVO> paymentList();
	public List<PaymentVO> paymentDateList(OrderDateVO orderdateVO);
	public List<PaymentListVO> paymentDetailList(Integer order_no);
	
}
