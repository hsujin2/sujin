package com.mommefatale.community.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mommefatale.community.service.CommunityWriteService;

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
	public String communityWriteForm(HttpServletRequest request) throws Exception {
		System.out.println("자유게시판 글쓰기 폼 컨트롤러");

		return "/community/communityWriteForm";
	}

	@RequestMapping(value = "/communityWrite.do")
	public String communityWrite(HttpServletRequest request) throws Exception {
		System.out.println("자유게시판 글쓰기 컨트롤러");
		Map<String, Object> map = new HashMap<String, Object>();
		Enumeration<?> enums = request.getParameterNames();
		while (enums.hasMoreElements()) {
			String paramName = enums.nextElement().toString();
			String paramValue = request.getParameter(paramName);
			System.out.println("ParamName:" + paramName + " ParamValue:" + paramValue);
			map.put(paramName, paramValue);
		}
		command.communityWrite(map);

		return "redirect:/communityBoard.do";
	}
}
