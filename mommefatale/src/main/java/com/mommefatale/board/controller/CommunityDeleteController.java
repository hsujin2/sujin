package com.mommefatale.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.board.service.CommunityDeleteService;

@Controller
public class CommunityDeleteController {
	private CommunityDeleteService command;

	public CommunityDeleteService getCommand() {
		return command;
	}

	public void setCommand(CommunityDeleteService command) {
		this.command = command;
	}
	
	@RequestMapping(value="/communityDelete.do")
	public ModelAndView knowDelete(HttpServletRequest request)throws Exception{
		System.out.println("자유게시판 글삭제 컨트롤러");
		ModelAndView mav =  new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		command.communityDelete(no);
		mav.setViewName("redirect:/communityBoard.do");
		return mav;
	}
}
