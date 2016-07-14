package com.mommefatale.admin.sitestatus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.admin.sitestatus.model.VisitVO;
import com.mommefatale.admin.sitestatus.service.VisitStatusService;


@Controller
public class VisitStatusController {
	private VisitStatusService command;

	public void setCommand(VisitStatusService command) {
		this.command = command;
	}
	@RequestMapping(value="visitStatus.json")
	public ModelAndView visitStatus(){
		ModelAndView mav = new ModelAndView();
		List<VisitVO> visitlist = command.visitStatus();
		mav.addObject("visitlist",visitlist);
		mav.setViewName("jsonView");
		return mav;
	}
}
