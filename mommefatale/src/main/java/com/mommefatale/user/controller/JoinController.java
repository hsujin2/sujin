package com.mommefatale.user.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.user.service.UserEmailCheckService;

@Controller
public class JoinController {
	private UserInsertService command;
	
	public void setCommand(UserInsertService command) {
		this.command = command;
	}
	
	@RequestMapping("/joinagreement.do")
	public String joinAgreement() {

		return "login/join_agreement";

	}

	@RequestMapping("/join.do")
	public String joinMember() {

		return "login/join";
	}

	@RequestMapping("joincomplete.do")
	public String joinComplete(HttpServletRequest request)throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> vo= new HashMap<>();
		Enumeration enums= request.getParameterNames();
		while(enums.hasMoreElements()){
			String paramName= enums.nextElement().toString();
			String paramValue= request.getParameter(paramName);
			System.out.println("paramId : "+paramName+", value : "+paramValue);
			vo.put(paramName, paramValue);
		}
		request.getParameter("");
		command.insertUser(vo);
		return "login/join_complete";
	}

}
