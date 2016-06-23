package com.mommefatale.user.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MyPageController {
	@RequestMapping("mypage.do")
	public String myPage(){
		return "user/mypage";
	}
	
}
