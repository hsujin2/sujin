package com.mommefatale.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.board.model.CommunityBoardVO;
import com.mommefatale.board.service.CommunityContentService;

@Controller
public class CommunityContentController {

	private CommunityContentService command;

	public CommunityContentService getCommand() {
		return command;
	}

	public void setCommand(CommunityContentService command) {
		this.command = command;
	}
	
	@RequestMapping(value="/communityContent.do")
	public ModelAndView knowHowContent(HttpServletRequest request)throws Exception{
		System.out.println("³ëÇÏ¿ì content Controller");
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("pageNum:"+no);
		CommunityBoardVO vo = command.communityContent(no);
		
		mav.setViewName("/board/communityContent");
		mav.addObject("vo", vo);
		return mav;
	}
}
