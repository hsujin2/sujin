package com.mommefatale.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mommefatale.user.model.UserVO;
import com.mommefatale.user.service.UserEmailCheckService;
import com.mommefatale.user.service.UserIdCheckService;

@Controller
public class EmailCheckController {
	
private UserEmailCheckService command;
	
	public void setCommand(UserEmailCheckService command) {
		this.command = command;
	}
	
	@RequestMapping(value="/emailCheck.do", method=RequestMethod.GET)
	public String emailCheck(HttpServletRequest request)throws Exception{
		request.setCharacterEncoding("utf-8");
		UserVO useremail = command.emailCheck(request.getParameter("useremail"));
		int check = -1;
		if(useremail != null){
			check=1;
		}
		request.setAttribute("check", check);
		request.setAttribute("useremail", request.getParameter("useremail"));
		return "login/emailCheck";
		
	}
}
