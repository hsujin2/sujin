package com.mommefatale.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LogoutController {

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/index.do";
	}
}
