package com.mommefatale.community.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.community.model.CommunityBoardVO;
import com.mommefatale.community.service.CommunityContentService;

@Controller
public class CommunityContentController {

	private CommunityContentService command;

	public CommunityContentService getCommand() {
		return command;
	}

	public void setCommand(CommunityContentService command) {
		this.command = command;
	}

	@RequestMapping(value = "/communityContent.do")
	public ModelAndView communityContent(HttpServletRequest request) throws Exception {
		System.out.println("자유게시판 내용보기 컨트롤러");
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		CommunityBoardVO vo = command.communityContent(no);
		command.communityView(no);
		mav.setViewName("/community/communityContent");
		mav.addObject("vo", vo);
		return mav;
	}
	
}
