package com.mommefatale.todaykcal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	
	@RequestMapping(value="todayKcal.do", method=RequestMethod.GET)
	public String TodayKcal(HttpServletRequest request) throws Exception{
		System.out.println("오늘의 칼로리 페이지 컨트롤러");
		request.setCharacterEncoding("UTF-8");

		// 오늘의 칼로리 저장
		if(request.getParameter("todayMyKcal") != null){
		System.out.println("오늘의 칼로리 저장 컨트롤러");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kcal_today", request.getParameter("todayMyKcal"));
		map.put("member_id", request.getParameter("member_id"));
		System.out.println(request.getParameter("todayMyKcal"));
		System.out.println(request.getParameter("member_id"));
		command.TodayKcalMyList(map);
		}
		
		return "todaykcal/todayKcal";
	}
	
	@RequestMapping(value="todayKcal.json")
	public ModelAndView TodayKcalJson(HttpServletRequest request) throws Exception{
		System.out.println("오늘의 칼로리 Json 페이지 컨트롤러");
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("food_no", request.getParameter("food_no"));
		map.put("food_name", request.getParameter("food_name"));
		map.put("food_category", request.getParameter("food_category"));
		
		System.out.println("food_no : "+map.get("food_no"));
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
		
		System.out.println("푸드리스트 가져오기 컨트롤러");
		return mav;
	}
	
}
