package com.mommefatale.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserCouponController {
	@RequestMapping("/userCoupon.do")
	public String userCoupon(){
		
		return "userCoupon";
	}
}
