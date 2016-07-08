package com.mommefatale.contents.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserDietaryController {
	
	@RequestMapping("/dietary.do")
	public String contents4(){
		
		return "contents/dietary";
	}
}
