package com.mommefatale.community.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mommefatale.community.service.CommunityDeleteService;

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
	public String communityDelete(HttpServletRequest request)throws Exception{
		System.out.println("자유게시판 글삭제 컨트롤러");
		int no = Integer.parseInt(request.getParameter("no"));
		command.communityDelete(no);
		return "redirect:/communityBoard.do";
	}
}
