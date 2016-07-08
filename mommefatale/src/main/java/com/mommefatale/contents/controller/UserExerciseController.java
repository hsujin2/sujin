package com.mommefatale.contents.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserExerciseController {
	
/*	@RequestMapping("/exercise1.do")
	public String contents2(){
		
		return "contents/exercise1";
	}*/
	@RequestMapping("/exercise2.do")
	public String contents3(){
		
		return "contents/exercise2";
	}
	
}
