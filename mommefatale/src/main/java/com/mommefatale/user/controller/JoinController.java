package com.mommefatale.user.controller;

import java.util.Calendar;
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
		
		//�񸸺��� ����
		String[] fat = request.getParameterValues("fat");
		for(int i=0;i<fat.length;i++){
			vo.put("fat_part"+(i+1), fat[i]);
		}
		
		//���� �� ���̷� �Ϸ���� Į�θ� ���
		int kcal=0;
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("birth1"));
		Calendar cal = java.util.Calendar.getInstance();
		int year = cal.get ( Calendar.YEAR );
		age = age - year;
		
		if(gender.equals("��")){
			if(age<40){
				kcal=2400;
			}else{
				kcal=2200;
			}
		}else if(gender.equals("��")){
			if(age<40){
				kcal=2000;
			}else{
				kcal=1800;
			}
		}
		
		//Ȱ�������� ���� ����Į�θ� ����
		String[] activity = request.getParameterValues("activity");
		for(int i=0;i<activity.length;i++){
			vo.put("activity_code"+(i+1), activity[i]);

			switch(activity[i]){
			case "��å" : kcal+=100; break;
			case "���߱����̿�" : kcal+=200;break;
			case "��Ģ���" : kcal+=300;break;
			case "����̿�" : kcal+=250;break;
			case "��üȰ�����" : kcal+=350;break;
			}
		}
		vo.put("kcal", kcal);
		
		String birthday = request.getParameter("birth1")+request.getParameter("birth2")+request.getParameter("birth3");
		vo.put("birthday", birthday);
		
		String tel = request.getParameter("num1")+request.getParameter("num2")+request.getParameter("num3");
		vo.put("tel", tel);
		
		String zip = request.getParameter("zip1")+request.getParameter("zip2");
		vo.put("zip", zip);
		
		command.insertUser(vo);
		return "login/join_complete";
	}

}
