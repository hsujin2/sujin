package com.mommefatale.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberIndexController {

	@RequestMapping("/index.do")
	public String index(){
		System.out.println("�����߽��ϴ�.");
		System.out.println("���������׽�Ʈ.");
		
		return "index";
	}
}
