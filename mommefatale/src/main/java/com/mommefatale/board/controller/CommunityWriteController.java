package com.mommefatale.board.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.board.service.CommunityWriteService;

@Controller
public class CommunityWriteController {

	private CommunityWriteService command;

	public CommunityWriteService getCommand() {
		return command;
	}

	public void setCommand(CommunityWriteService command) {
		this.command = command;
	}

	@RequestMapping(value = "/communityWriteForm.do")
	public ModelAndView communityWriteForm(HttpServletRequest request) throws Exception {
		System.out.println("자유게시판 글쓰기 폼 컨트롤러");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/communityWriteForm");

		return mav;
	}

	@RequestMapping(value = "/communityWrite.do")
	public ModelAndView communityWrite(HttpServletRequest request) throws Exception {
		System.out.println("자유게시판 글쓰기 컨트롤러");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		Enumeration<?> enums = request.getParameterNames();
		while (enums.hasMoreElements()) {
			String paramName = enums.nextElement().toString();
			String paramValue = request.getParameter(paramName);
			System.out.println("ParamName:" + paramName + " ParamValue:" + paramValue);
			map.put(paramName, paramValue);
		}
		command.communityWrite(map);
		mav.setViewName("redirect:/communityBoard.do");

		return mav;
	}
}
