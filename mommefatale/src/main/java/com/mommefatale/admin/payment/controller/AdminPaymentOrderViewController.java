package com.mommefatale.admin.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.admin.payment.model.OrderDateVO;
import com.mommefatale.admin.payment.model.PaymentListVO;
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
	
	@RequestMapping(value="adminpaymentdetaillist.json")
	public ModelAndView paymentDetailList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Integer order_no = Integer.parseInt(request.getParameter("order_no"));
		System.out.println("주문 조회 번호 : "+order_no);
		
		List<PaymentListVO> paymentdetaillist = command.paymentDetailList(order_no);
		mav.addObject("paymentdetaillist",paymentdetaillist);
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="adminmodifypaylist.json")
	public ModelAndView paymentListModify(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		Integer order_no = Integer.parseInt(request.getParameter("order_no"));
		Integer item_no = Integer.parseInt(request.getParameter("item_no"));
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));
		Integer discount = Integer.parseInt(request.getParameter("discount"));
		map.put("order_no", order_no);
		map.put("item_no", item_no);
		map.put("quantity", quantity);
		
		//수정전 주문내역
		Integer origin_quantity = command.getQuantity(map);
		
		//총액 증감 계산
		Integer change_totalprice = (quantity * discount) - (origin_quantity * discount);
		map.put("price", change_totalprice);
		
		//주문내역 수량 수정
		command.modifyPaymentList(map);
		
		//주문 총액 수정
		command.updateTotalprice(map);

		System.out.println("주문내역 수정 완료");
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="statechange.admin")
	public String stateChange(HttpServletRequest request){
		Integer order_no = Integer.parseInt(request.getParameter("order_no"));
		String state = request.getParameter("state");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("order_no", order_no);
		map.put("state", state);
		
		command.stateChange(map);
		return "redirect:/adminpaymentlist.admin";
	}
}
