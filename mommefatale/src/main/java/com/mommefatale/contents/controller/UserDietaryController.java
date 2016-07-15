package com.mommefatale.contents.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserDietaryController {
	
	@RequestMapping("/dietary.do")
	public ModelAndView contents4(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.addObject("category",request.getParameter("category"));
		mav.setViewName("contents/dietary");
		return mav;
	}
}
