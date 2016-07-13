package com.mommefatale.admin.payment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.admin.payment.model.OrderDateVO;
import com.mommefatale.admin.payment.model.PaymentVO;
import com.mommefatale.admin.payment.service.AdminPaymentOrderViewService;
import com.mommefatale.user.model.UserVO;

@Controller
public class AdminPaymentOrderViewController {
	private AdminPaymentOrderViewService command;

	public void setCommand(AdminPaymentOrderViewService command) {
		this.command = command;
	}

	@RequestMapping("adminpaymentlist.admin")
	public ModelAndView paymentlist(HttpServletRequest request){
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("login");
		ModelAndView mav = new ModelAndView();
		if(user==null){
			mav.setViewName("redirect:/login.do");
			return mav;
		}else if(!user.getUserid().equals("admin")){
			mav.setViewName("redirect:/login.do");
			return mav;
		}
		
		List<PaymentVO> paymentlist = command.paymentList();
		mav.getModel().put("paymentlist", paymentlist);
		mav.setViewName("admin/adminPaymentList");
		return mav;
	}
	
	@RequestMapping(value="adminpaymentdatelist.json")
	public ModelAndView paymentDatelist(HttpServletRequest request, OrderDateVO orderdateVO){
		ModelAndView mav = new ModelAndView();
		orderdateVO.setUserid(request.getParameter("search_id"));
		orderdateVO.setOrder_no(Integer.parseInt(request.getParameter("search_no")));
		orderdateVO.setFromdate(request.getParameter("fromDate"));
		orderdateVO.setTodate(request.getParameter("toDate"));
		
		List<PaymentVO> paymentdatelist = command.paymentDateList(orderdateVO);
		mav.addObject("paymentdatelist", paymentdatelist);
		mav.setViewName("jsonView");
		return mav;
	}
//	@RequestMapping(value="adminpaymentdetaillist.json")
//	public ModelAndView paymentDetailList(){
//		ModelAndView mav = new ModelAndView();
//		
//	}
}
