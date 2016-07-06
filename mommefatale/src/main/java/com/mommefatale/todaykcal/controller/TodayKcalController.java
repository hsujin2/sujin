package com.mommefatale.todaykcal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.board.model.Paging;
import com.mommefatale.todaykcal.model.FoodVO;
import com.mommefatale.todaykcal.service.TodayKcalService;

@Controller
public class TodayKcalController {

	private TodayKcalService command;
	private Paging paging;
	public TodayKcalService getCommand() {
		return command;
	}
	public void setCommand(TodayKcalService command) {
		this.command = command;
	}
	public Paging getPaging() {
		return paging;
	}
	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	
	@RequestMapping(value="todayKcal.do")
	public ModelAndView TodayKcal(HttpServletRequest request) throws Exception{
		System.out.println("오늘의 칼로리 페이지 컨트롤러");
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");
		Map<String, Object> map = new HashMap<String, Object>();
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 20;
		int pageNavi = 3;
		int page_count = command.TodayKcalFoodCount();
		int number = page_count - (currentPage - 1) * pageSize;

		paging.setPaging(pageSize, pageNavi, page_count, currentPage);
		map.put("startRow", paging.getWriting_Start());
		map.put("endRow", paging.getWriting_End());
		
		System.out.println("카운트: " + page_count);

		List<FoodVO> vo = command.TodayKcalFoodList(map);
		int count = vo.size();
		
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("foodList", vo);
		model.put("page_count", new Integer(page_count));
		model.put("number", new Integer(number));
		model.put("pageNum", pageNum);
		model.put("paging", paging);
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
		String pageNum = request.getParameter("pageNum");
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 20;
		int pageNavi = 3;
		int page_count = command.TodayKcalFoodCount();
		int number = page_count - (currentPage - 1) * pageSize;

		paging.setPaging(pageSize, pageNavi, page_count, currentPage);
		map.put("startRow", paging.getWriting_Start());
		map.put("endRow", paging.getWriting_End());
		
		System.out.println("카운트: " + page_count);
		map.put("food_name", request.getParameter("food_name"));
		System.out.println(map.get("food_name"));
		List<FoodVO> vo = command.TodayKcalFoodList(map);
		int count = vo.size();
		
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("foodList", vo);
		model.put("page_count", new Integer(page_count));
		model.put("number", new Integer(number));
		model.put("pageNum", pageNum);
		model.put("paging", paging);
		mav.addAllObjects(model);
		mav.setViewName("jsonView");
		mav.addObject("vo", vo);
		mav.addObject("count", count);
		return mav;
	}
	
}
