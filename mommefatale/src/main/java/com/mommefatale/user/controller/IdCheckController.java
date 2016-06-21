package com.mommefatale.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mommefatale.user.model.UserVO;
import com.mommefatale.user.service.UserIdCheckService;

@Controller
public class IdCheckController {
	
	private UserIdCheckService command;
	
	public void setCommand(UserIdCheckService command) {
		this.command = command;
	}
	
	@RequestMapping(value="/idCheck.do", method=RequestMethod.GET)
	public String idCheck(HttpServletRequest request)throws Exception{
		request.setCharacterEncoding("utf-8");
		UserVO user = command.idCheck(request.getParameter("userid"));
		int check = -1;
		if(user != null){
			check=1;
		}
		request.setAttribute("check", check);
		request.setAttribute("userid", request.getParameter("userid"));
		
		
		return "login/idCheck";
	}
	
}
