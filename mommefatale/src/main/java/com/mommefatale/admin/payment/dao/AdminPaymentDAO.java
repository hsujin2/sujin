package com.mommefatale.admin.payment.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.admin.payment.model.OrderDateVO;
import com.mommefatale.admin.payment.model.PaymentListVO;
import com.mommefatale.admin.payment.model.PaymentVO;


public interface AdminPaymentDAO {
	
	public List<PaymentVO> paymentList();
	public List<PaymentVO> paymentDateList(OrderDateVO orderdateVO);
	public List<PaymentListVO> paymentDetailList(Integer order_no);
	public void modifyPaymentList(Map<String, Object> map);
	public Integer getQuantity(Map<String, Object> map);
	public void updateTotalprice(Map<String, Object> map);
	public void stateChange(Map<String, Object> map);
}
