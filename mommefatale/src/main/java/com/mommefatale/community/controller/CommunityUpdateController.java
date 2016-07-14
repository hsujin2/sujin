package com.mommefatale.community.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.community.model.CommunityBoardVO;
import com.mommefatale.community.service.CommunityContentService;
import com.mommefatale.community.service.CommunityUpdateService;

@Controller
public class CommunityUpdateController {
	private CommunityContentService command;
	private CommunityUpdateService service;

	public CommunityContentService getCommand() {
		return command;
	}

	public void setCommand(CommunityContentService command) {
		this.command = command;
	}

	public CommunityUpdateService getService() {
		return service;
	}

	public void setService(CommunityUpdateService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/communityUpdate.do")
	public ModelAndView communityUpdate(HttpServletRequest request)throws Exception{
		System.out.println("자유게시판 글수정페이지 컨트롤러");
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		CommunityBoardVO vo = command.communityContent(no);
		mav.setViewName("/community/communityUpdate");
		mav.addObject("vo",vo);
		return mav;
	}
	
	@RequestMapping(value="/communityUpdateProc.do")
	public ModelAndView communityUpdateProc(HttpServletRequest request)throws Exception{
		System.out.println("자유게시판 글수정 컨트롤러");
		ModelAndView mav= new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		int no = Integer.parseInt(request.getParameter("no"));
		Enumeration<?> enums = request.getParameterNames();
		while(enums.hasMoreElements()){
			String paramName = enums.nextElement().toString();
			String paramValue= request.getParameter(paramName);
			System.out.println("no:"+no+", paramName:"+paramName+", paramValue:"+paramValue);
			map.put(paramName, paramValue);
		}
		map.put("no", no);
		service.communityUpdate(map);
		mav.setViewName("redirect:/communityBoard.do");
		return mav;
	}
		
}
