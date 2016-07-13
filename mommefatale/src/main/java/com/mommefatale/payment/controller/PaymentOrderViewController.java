package com.mommefatale.payment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.payment.model.OrderDateVO;
import com.mommefatale.payment.model.PaymentListVO;
import com.mommefatale.payment.service.PaymentOrderViewService;
import com.mommefatale.user.model.UserVO;

@Controller
public class PaymentOrderViewController {
	private PaymentOrderViewService command;

	public void setCommand(PaymentOrderViewService command) {
		this.command = command;
	}

	@RequestMapping("paymentlist.do")
	public ModelAndView paymentlist(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Object obj = request.getSession().getAttribute("login");
		UserVO user = null;
		if(obj instanceof UserVO){
			user = (UserVO)obj;
		}else{
			mav.setViewName("redirect:/login.do");
		}
		List<PaymentListVO> paymentlist = command.paymentList(user.getUserid());
		mav.getModel().put("paymentlist", paymentlist);
		mav.setViewName("payment/paymentList");
		return mav;
	}
	
	@RequestMapping(value="paymentdatelist.json")
	public ModelAndView paymentDatelist(HttpServletRequest request, OrderDateVO orderdateVO){
		ModelAndView mav = new ModelAndView();
		Object obj = request.getSession().getAttribute("login");
		UserVO user = null;
		if(obj instanceof UserVO){
			user = (UserVO)obj;
		}else{
			mav.setViewName("redirect:/login.do");
		}
		orderdateVO.setUserid(user.getUserid());
		orderdateVO.setFromdate(request.getParameter("fromDate"));
		orderdateVO.setTodate(request.getParameter("toDate"));
		
		List<PaymentListVO> paymentdatelist = command.paymentDateList(orderdateVO);
		mav.addObject("paymentdatelist", paymentdatelist);
		mav.setViewName("jsonView");
		return mav;
	}
}
