package com.mommefatale.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.user.model.CouponVO;
import com.mommefatale.user.model.UserVO;
import com.mommefatale.user.service.UserCouponService;

@Controller
public class UserCouponController {
	private UserCouponService command;
	
	public void setCommand(UserCouponService command) {
		this.command = command;
	}

	@RequestMapping("userCoupon.do")
	public ModelAndView userCoupon(HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("login");
		int coupons_no = vo.getCoupon();
		
		List<CouponVO> coupons = command.getCoupons(coupons_no);
		int count = coupons.size();

		mav.addObject("coupons",coupons);
		mav.addObject("count",count);
		mav.setViewName("user/userCoupon");

		return mav;
	}
	   @RequestMapping("useDiscount.do")
	   @ResponseBody
	   public String useCoupon(HttpServletRequest request) {
	      Integer discount=Integer.parseInt(request.getParameter("discount"));
	      Integer total = Integer.parseInt(request.getParameter("total"));
		  Integer point = Integer.parseInt(request.getParameter("point"));
	      Integer result = total - point  - discount;
	      
	      return Integer.toString(result);
	   }
}
