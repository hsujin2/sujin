package com.mommefatale.index.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.board.model.CommunityBoardVO;
import com.mommefatale.index.service.IndexBoardService;

@Controller
public class MemberIndexController {

	private IndexBoardService boardService;
	
	public IndexBoardService getBoardService() {
		return boardService;
	}

	public void setBoardService(IndexBoardService boardService) {
		this.boardService = boardService;
	}

	@RequestMapping("/index.do")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap)throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		List<CommunityBoardVO> community = boardService.indexCommunityList();
		mav.addObject("community", community);
		System.out.println("¸â¹ö ÀÎµ¦½º ÄÁÆ®·Ñ·¯");
		
		return mav;
	}
}
