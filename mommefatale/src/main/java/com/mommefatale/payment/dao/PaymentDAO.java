package com.mommefatale.payment.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.payment.model.BankVO;
import com.mommefatale.payment.model.OrderDateVO;
import com.mommefatale.payment.model.PaymentListVO;
import com.mommefatale.payment.model.PaymentVO;

public interface PaymentDAO {
	public void insertOrder(PaymentVO paymentVO);
	public void insertOrderList(PaymentVO paymentVO);
	public void updateItemCount(PaymentVO paymentVO);
	public void insertPoint(Map<String, Object> points);
	public List<BankVO> getBank();
	public void insertPayway(PaymentVO paymentVO);
	public String getAccount(String bank);
	public List<PaymentListVO> paymentList(String userid);
	public List<PaymentListVO> paymentDateList(OrderDateVO orderdateVO);
}
