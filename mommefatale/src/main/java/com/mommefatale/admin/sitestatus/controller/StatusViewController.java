package com.mommefatale.admin.sitestatus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.user.model.UserVO;

@Controller
public class StatusViewController {
	@RequestMapping(value="sitestatus.admin")
	public ModelAndView StatusView(HttpServletRequest request){
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("login");
		ModelAndView mav = new ModelAndView();
		if(user==null){
			mav.setViewName("redirect:/login.do");
			return mav;
		}else if(!user.getUserid().equals("admin")){
			mav.setViewName("redirect:/login.do");
			return mav;
		}
		
		mav.setViewName("admin/siteStatus");
		return mav;
		
	}
}
