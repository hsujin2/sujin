package com.mommefatale.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.board.service.CommunityWriteService;

@Controller
public class communityWriteController {

	private CommunityWriteService command;

	public CommunityWriteService getCommand() {
		return command;
	}

	public void setCommand(CommunityWriteService command) {
		this.command = command;
	}
	
	@RequestMapping(value="/communityWriteForm.do")
	public ModelAndView communityWritePage(HttpServletRequest request)throws Exception{
		System.out.println("자유게시판 글쓰기 폼 컨트롤러");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("communityWriteForm");
		
		return mav;
		
	}
}
