package com.mommefatale.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.user.model.UserVO;
import com.mommefatale.user.service.UserLoginService;

@Controller
public class LoginController {
	
	private UserLoginService command;
	public void setCommand(UserLoginService command){
		this.command = command;
	}
	@RequestMapping("/login.do")
	public String login() {

		return "login/login";
	}

	@RequestMapping("loginProc.do")
	public ModelAndView loginProc(HttpServletRequest request, ModelMap modelMap) {
		
		String id= request.getParameter("userid");
		String password= request.getParameter("userpass");
		
		System.out.println(id);
		System.out.println(password);
		
		UserVO user = command.loginCheck(id);
		
		ModelAndView mav= new ModelAndView();
		int check= -1;
		
		if(user==null){
			modelMap.put("loginCheck", check);
			mav.setViewName("/login/loginProc");
			return mav;
		}
		
		if(id.equals(user.getUserid()) && password.equals(user.getPassword())){
			check= 1;
		}else if( !password.equals(user.getPassword()) ){
			check= 0;
		}
		modelMap.put("loginCheck", check);
		
		System.out.println("Parameter ID : "+id+", DB ID : "+user.getUserid());
		System.out.println("Parameter PASSWORD : "+password+", DB PASSWORD : "+user.getPassword());
		
		if(check==1){
			HttpSession session= request.getSession();
			if(user.getUserid().equals("admin")){
				session.setAttribute("admin", true);
			}else{
				session.setAttribute("admin", false);
			}
			session.setAttribute("login", user);
			System.out.println("LOGIN complete");
			mav.setViewName("redirect:/index.do");
			return mav;
		}
		mav.setViewName("/login/loginProc");
		return mav;
		
	}
}
