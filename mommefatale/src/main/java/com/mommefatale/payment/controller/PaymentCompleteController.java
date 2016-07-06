package com.mommefatale.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.item.model.ItemVO;
import com.mommefatale.payment.model.PaymentVO;
import com.mommefatale.payment.service.PaymentCompleteService;

@Controller
public class PaymentCompleteController {
	
	private PaymentCompleteService command;

	public void setCommand(PaymentCompleteService command) {
		this.command = command;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="paymentcomplete.do",method=RequestMethod.POST)
	public String paymentInsert(HttpServletRequest request, PaymentVO paymentVO){
		HttpSession session = request.getSession();
		List<ItemVO> list = (List<ItemVO>)session.getAttribute("item");
		List<Integer> countlist = (List<Integer>)session.getAttribute("count");
		List<String> sizelist = (List<String>)session.getAttribute("size");
		
		String userid = request.getParameter("userid");
		paymentVO.setOrder_id(userid);
		paymentVO.setReceiver(request.getParameter("receivername"));
		paymentVO.setPhone(request.getParameter("receivertel1")+request.getParameter("receivertel2")+request.getParameter("receivertel3"));
		paymentVO.setZip(request.getParameter("receiverzip1")+request.getParameter("receiverzip2"));
		paymentVO.setAddress1(request.getParameter("receiveraddr1"));
		paymentVO.setAddress2(request.getParameter("receiveraddr2"));
		paymentVO.setMemo(request.getParameter("memo"));
		paymentVO.setState("배송준비중");
		paymentVO.setTotal_price(Integer.parseInt(request.getParameter("totalpay")));
		paymentVO.setCoupon_no(Integer.parseInt(request.getParameter("coupon")));
		Integer fee = (Integer) session.getAttribute("fee");
		paymentVO.setDelivery_fee(fee);
		Integer usepoint = Integer.parseInt(request.getParameter("usepoint"));
		paymentVO.setPoint(usepoint);
		paymentVO.setPay_way(request.getParameter("pay_way"));
		paymentVO.setBank(request.getParameter("bank"));
		
		command.insertOrder(paymentVO);
		
		for(int i=0; i<list.size(); i++){
			paymentVO.setItem_no(list.get(i).getNo());
			paymentVO.setQuantity(countlist.get(i));
			
			
			command.insertOrderList(paymentVO);
			command.updateItemCount(paymentVO);
		}

		// 사용한 포인트 차감, 포인트 적립
		Integer saving = 0;
		List<Integer> savings = (List<Integer>)session.getAttribute("saving");
		for(int i=0; i<savings.size();i++){
			saving += savings.get(i);
		}
		Map<String, Object> points = new HashMap<String, Object>();
		points.put("saving", saving);
		points.put("usepoint", usepoint);
		points.put("userid", userid);
		
		command.insertPoint(points);
		
		//결제수단
		command.insertPayway(paymentVO);
		
		//세션 리무브
		session.removeAttribute("item");
		session.removeAttribute("count");
		session.removeAttribute("size");
		session.removeAttribute("fee");
		session.removeAttribute("saving");
		session.removeAttribute("coupon");
		
		System.out.println("결제성공");
		
		return "payment/paymentcomplete";
		
	}
}
