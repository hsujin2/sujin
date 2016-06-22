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
import com.mommefatale.user.service.UserInsertService;

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
		String[] fat = request.getParameterValues("fat");
		for(int i=0;i<fat.length;i++){
			vo.put("fat_part"+(i+1), fat[i]);
		}
		
		String[] activity = request.getParameterValues("activity");
		for(int i=0;i<activity.length;i++){
			vo.put("activity_code"+(i+1), activity[i]);
		}
		
		command.insertUser(vo);
		return "login/join_complete";
	}

}
