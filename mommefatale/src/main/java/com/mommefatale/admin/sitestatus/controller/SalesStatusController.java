package com.mommefatale.admin.sitestatus.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.admin.sitestatus.model.SalesVO;
import com.mommefatale.admin.sitestatus.service.SalesStatusService;

@Controller
public class SalesStatusController {
	private SalesStatusService command;

	public void setCommand(SalesStatusService command) {
		this.command = command;
	}
	@SuppressWarnings("null")
	@RequestMapping(value="salesStatus.json")
	public ModelAndView salesStatus(){
		ModelAndView mav = new ModelAndView();
		List<Integer> thisweek = command.thisWeekSalse();
		List<Integer> lastweek = command.lastWeekSalse();
		List<SalesVO> sales = new ArrayList<SalesVO>();
		for(int i=0; i<7;i++){
			SalesVO salesVO = new SalesVO();
			salesVO.setThis_week_total(thisweek.get(i));
			salesVO.setLast_week_total(lastweek.get(i));
			sales.add(salesVO);
		}
		mav.addObject("sales", sales);
		mav.setViewName("jsonView");
		return mav;
	}
}
