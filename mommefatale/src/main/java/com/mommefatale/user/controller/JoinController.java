package com.mommefatale.user.controller;

import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

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
		
		//비만부위 저장
		if(request.getParameter("fat_part1")==null){
			vo.put("fat_part1", "");
		}
		if(request.getParameter("fat_part2")==null){
			vo.put("fat_part2", "");
		}
		if(request.getParameter("fat_part3")==null){
			vo.put("fat_part3", "");
		}
		if(request.getParameter("fat_part4")==null){
			vo.put("fat_part4", "");
		}
		if(request.getParameter("fat_part5")==null){
			vo.put("fat_part5", "");
		}
		if(request.getParameter("fat_part6")==null){
			vo.put("fat_part6", "");
		}
		
		//성별 및 나이로 하루권장 칼로리 계산
		int kcal=0;
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("birth1"));
		Calendar cal = java.util.Calendar.getInstance();
		int year = cal.get ( Calendar.YEAR );
		age = age - year;
		
		if(gender.equals("남")){
			if(age<40){
				kcal=2400;
			}else{
				kcal=2200;
			}
		}else if(gender.equals("여")){
			if(age<40){
				kcal=2000;
			}else{
				kcal=1800;
			}
		}
		
		//활동량으로 인한 권장칼로리 증가
		
		if(request.getParameter("activity_code1")==null){
			vo.put("activity_code1", "");
			kcal+=100;
		}
		if(request.getParameter("activity_code2")==null){
			vo.put("activity_code2", "");
			kcal+=200;
		}
		if(request.getParameter("activity_code3")==null){
			vo.put("activity_code3", "");
			kcal+=300;
		}
		if(request.getParameter("activity_code4")==null){
			vo.put("activity_code4", "");
			kcal+=250;
		}
		if(request.getParameter("activity_code5")==null){
			vo.put("activity_code5", "");
			kcal+=350;
		}
		
		vo.put("kcal", kcal);
		
		String birthday = request.getParameter("birth1")+request.getParameter("birth2")+request.getParameter("birth3");
		vo.put("birthday", birthday);
		
		String tel = request.getParameter("num1")+request.getParameter("num2")+request.getParameter("num3");
		vo.put("tel", tel);
		
		String zip = request.getParameter("zip1")+request.getParameter("zip2");
		vo.put("zip", zip);
		
		String useremail = request.getParameter("useremail1")+"@"+request.getParameter("useremail2");
		vo.put("useremail", useremail);
		
		command.insertUser(vo);
		return "login/join_complete";
	}

}
