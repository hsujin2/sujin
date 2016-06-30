package com.mommefatale.index.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.board.model.CommunityBoardVO;
import com.mommefatale.index.service.IndexBoardService;

@Controller
public class IndexBoardController {

	private IndexBoardService service;

	public IndexBoardService getService() {
		return service;
	}

	public void setService(IndexBoardService service) {
		this.service = service;
	}
	
	@RequestMapping(value="indexBoard.do")
	public ModelAndView indexBoard(HttpServletRequest request)throws Exception{
		System.out.println("�ε��� �����Խ��� ��Ʈ�ѷ�");
		ModelAndView mav = new ModelAndView();
		List<CommunityBoardVO> community = service.indexCommunityList();
		mav.addObject("community",community);
		mav.setViewName("index");
		return mav;
	}
}
