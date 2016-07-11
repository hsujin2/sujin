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
import com.mommefatale.item.model.ItemVO;
import com.mommefatale.item.service.ItemListService;

@Controller
public class MemberIndexController {
	private ItemListService itemService;
	private IndexBoardService boardService;
	
	public void setItemService(ItemListService itemService) {
		this.itemService = itemService;
	}

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
		List<CommunityBoardVO> notice = boardService.indexNoticeList();
		mav.addObject("community", community);
		mav.addObject("notice", notice);
		System.out.println("¸â¹ö ÀÎµ¦½º ÄÁÆ®·Ñ·¯");
		
		List<ItemVO> newitem = itemService.indexnewItemList();
		mav.addObject("newitem",newitem);
		
		List<ItemVO> bestitem = itemService.indexbestItemList();
		mav.addObject("bestitem",bestitem);
		
		return mav;
	}
}
