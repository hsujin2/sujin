package com.mommefatale.admin.sitestatus.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.admin.sitestatus.service.GenderStatusService;

@Controller
public class GenderStatusController {
	private GenderStatusService command;

	public void setCommand(GenderStatusService command) {
		this.command = command;
	}

	@RequestMapping(value="genderStatus.json")
	public ModelAndView genderStatus(){
		ModelAndView mav = new ModelAndView();
		Integer man = command.manCount();
		Integer woman = command.womanCount();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("man", man);
		map.put("woman", woman);
		mav.addObject("map",map);
		mav.setViewName("jsonView");
		return mav;
	}
}
