package com.mommefatale.contents.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserRecommendedProductsController {
	@RequestMapping("/recommended_products.do")
	public String contents1(){
		
		return "contents/recommended_products";
	}
	
}
