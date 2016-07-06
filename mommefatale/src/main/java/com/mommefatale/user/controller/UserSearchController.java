package com.mommefatale.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.user.service.UserSearchService;

@Controller
public class UserSearchController {
	
	private UserSearchService command;

	public void setCommand(UserSearchService command) {
		this.command = command;
	}
	
	@RequestMapping("/searchId.do")
	public String searchId(){
		
		return "login/searchId";
	}
	@RequestMapping("/searchPass.do")
	public String searchPass(){
		
		return "login/searchPass";
	}
	@RequestMapping("/searchIdProc.do")
	public ModelAndView searchIdProc(HttpServletRequest request){
		Map<String, Object> vo = new HashMap<String, Object>();
		vo.put("name", request.getParameter("inputname"));
		vo.put("email", request.getParameter("inputemail"));
		
		String id = command.searchId(vo);
		
		ModelAndView mav = new ModelAndView();
		if(id==null){
			mav.setViewName("login/searchIdProc");
			mav.addObject("check",false);
			return mav;
		}
		mav.setViewName("login/searchIdProc");
		mav.addObject("check",true);
		mav.addObject("id",id);
		
		return mav;
	}
	
}
