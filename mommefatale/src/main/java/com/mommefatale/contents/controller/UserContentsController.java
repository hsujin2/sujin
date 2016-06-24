package com.mommefatale.contents.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserContentsController {
	@RequestMapping("/recommended_products.do")
	public String contents(){
		
		return "contents/recommended_products";
	}
}
