package com.mommefatale.todaykcal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.todaykcal.model.FoodVO;
import com.mommefatale.todaykcal.service.TodayKcalService;

@Controller
public class TodayKcalController {

	private TodayKcalService command;
	public TodayKcalService getCommand() {
		return command;
	}
	public void setCommand(TodayKcalService command) {
		this.command = command;
	}

	
	@RequestMapping(value="todayKcal.do")
	public ModelAndView TodayKcal(HttpServletRequest request) throws Exception{
		System.out.println("오늘의 칼로리 페이지 컨트롤러");
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("food_name", request.getParameter("food_name"));
		map.put("food_category", request.getParameter("food_category"));
		
		List<FoodVO> vo = command.TodayKcalFoodList(map);
		int count = vo.size();
		
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("foodList", vo);
		mav.addAllObjects(model);
		mav.setViewName("todaykcal/todayKcal");
		mav.addObject("vo", vo);
		mav.addObject("count", count);
		return mav;
	}
	
	@RequestMapping(value="todayKcal.json")
	public ModelAndView TodayKcalJson(HttpServletRequest request) throws Exception{
		System.out.println("오늘의 칼로리 Json 페이지 컨트롤러");
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("food_name", request.getParameter("food_name"));
		map.put("food_category", request.getParameter("food_category"));
		System.out.println("food_name : "+map.get("food_name"));
		System.out.println("food_category : "+map.get("food_category"));
		List<FoodVO> vo = command.TodayKcalFoodList(map);
		int count = vo.size();
		
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("foodList", vo);
		mav.addAllObjects(model);
		mav.setViewName("jsonView");
		mav.addObject("vo", vo);
		mav.addObject("count", count);
		return mav;
	}
	
}
