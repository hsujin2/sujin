package com.mommefatale.admin.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("/adminMain.admin")
	public String adminMain(){
		return "admin/adminMain";
	}
}
