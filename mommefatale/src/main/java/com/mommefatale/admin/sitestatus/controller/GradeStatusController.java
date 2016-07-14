package com.mommefatale.admin.sitestatus.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.admin.sitestatus.model.GradeVO;
import com.mommefatale.admin.sitestatus.service.GradeStatusService;

@Controller
public class GradeStatusController {
	private GradeStatusService command;

	public void setCommand(GradeStatusService command) {
		this.command = command;
	}
	
	@RequestMapping(value="gradeStatus.json")
	public ModelAndView gradeStatus(){
		ModelAndView mav = new ModelAndView();
		List<GradeVO> gradelist = command.gradeStatus();
		mav.addObject("gradelist",gradelist);
		mav.setViewName("jsonView");
		return mav;
	}
}
