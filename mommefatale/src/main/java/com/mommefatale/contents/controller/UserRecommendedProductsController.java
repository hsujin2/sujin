package com.mommefatale.contents.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserRecommendedProductsController {
	@RequestMapping("/recommended_products.do")
	public ModelAndView contents1(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.addObject("category",request.getParameter("category"));
		mav.setViewName("contents/recommended_products");
		return mav;
	}
	
}
