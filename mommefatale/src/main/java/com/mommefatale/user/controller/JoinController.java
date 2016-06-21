package com.mommefatale.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinController {
	@RequestMapping("/joinagreement.do")
	public String joinAgreement(){
		
		return "login/join_agreement";
		
	}
	
	@RequestMapping("/join.do")
	public String joinMember(){
		
		return "login/join";
	}
	
	
}
