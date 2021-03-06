package com.mommefatale.admin.payment.service;

import java.util.List;
import java.util.Map;

import com.mommefatale.admin.payment.dao.AdminPaymentDAO;
import com.mommefatale.admin.payment.model.OrderDateVO;
import com.mommefatale.admin.payment.model.PaymentListVO;
import com.mommefatale.admin.payment.model.PaymentVO;


public class AdminPaymentOrderViewServiceImpl implements AdminPaymentOrderViewService{
	private AdminPaymentDAO dao;

	public void setDao(AdminPaymentDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<PaymentVO> paymentList() {
		return dao.paymentList();
	}

	@Override
	public List<PaymentVO> paymentDateList(OrderDateVO orderdateVO) {
		return dao.paymentDateList(orderdateVO);
	}

	@Override
	public List<PaymentListVO> paymentDetailList(Integer order_no) {
		return dao.paymentDetailList(order_no);
	}

	@Override
	public void modifyPaymentList(Map<String, Object> map) {
		dao.modifyPaymentList(map);
	}

	@Override
	public Integer getQuantity(Map<String, Object> map) {
		return dao.getQuantity(map);
	}

	@Override
	public void updateTotalprice(Map<String, Object> map) {
		dao.updateTotalprice(map);
	}

	@Override
	public void stateChange(Map<String, Object> map) {
		dao.stateChange(map);
	}


}
