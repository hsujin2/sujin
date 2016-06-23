package com.mommefatale.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserUpdateController {

	@RequestMapping("/userUpdate.do")
	public String userUpdate(){
		return "userUpdateProc";
	}
}
