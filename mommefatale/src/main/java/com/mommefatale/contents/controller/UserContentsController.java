package com.mommefatale.contents.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserContentsController {
	@RequestMapping("/recommended_products.do")
	public String contents1(){
		
		return "contents/recommended_products";
	}
	@RequestMapping("/exercise1.do")
	public String contents2(){
		
		return "contents/exercise1";
	}
	@RequestMapping("/exercise2.do")
	public String contents3(){
		
		return "contents/exercise2";
	}
	@RequestMapping("/dietary.do")
	public String contents4(){
		
		return "contents/dietary";
	}
}
