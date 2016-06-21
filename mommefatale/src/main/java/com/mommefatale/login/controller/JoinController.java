package com.mommefatale.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {
	@RequestMapping("/joinagreement.do")
	public String joinAgreement(){
		
		return "login/join_agreement";
		
	}
}
