package com.mommefatale.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mommefatale.user.model.UserVO;
import com.mommefatale.user.service.VisitService;


@Controller
public class LogoutController {
	private VisitService command;

	public void setCommand(VisitService command) {
		this.command = command;
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request,UserVO userVO){
		HttpSession session = request.getSession();
		userVO = (UserVO)session.getAttribute("login");
		String userid = userVO.getUserid();
		command.visitDate(userid);
		session.invalidate();
		return "redirect:/index.do";
	}
}
