package com.mommefatale.admin.sitestatus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.admin.sitestatus.model.BestVO;
import com.mommefatale.admin.sitestatus.model.GradeVO;
import com.mommefatale.admin.sitestatus.service.BestStatusService;
import com.mommefatale.admin.sitestatus.service.GradeStatusService;

@Controller
public class BestStatusController {
	private BestStatusService command;

	public void setCommand(BestStatusService command) {
		this.command = command;
	}
	@RequestMapping(value="bestfive.json")
	public ModelAndView bestState(){
		ModelAndView mav = new ModelAndView();
		List<BestVO> bestfive = command.bestStatus();
		mav.addObject("bestfive",bestfive);
		mav.setViewName("jsonView");
		return mav;
	}
}
