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
import com.mommefatale.community.service.CommunityReplyService;

@Controller
public class CommunityReplyController {

	private CommunityContentService command;
	private CommunityReplyService service;
	
	public CommunityContentService getCommand() {
		return command;
	}

	public void setCommand(CommunityContentService command) {
		this.command = command;
	}

	public CommunityReplyService getService() {
		return service;
	}

	public void setService(CommunityReplyService service) {
		this.service = service;
	}

	@RequestMapping(value="/communityReplyForm.do")
	public ModelAndView communityReplyForm(HttpServletRequest request)throws Exception{
		System.out.println("자유게시판 답글쓰기 폼 컨트롤러");
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		CommunityBoardVO vo = command.communityContent(no);
		vo.setSubject(vo.getSubject());
		vo.setContent("\n\t[원문]"+"\n\n "+vo.getContent()+
				"\n ---------------------------------------------------------------------------------------------\n\n");
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("vo", vo);
		mav.addAllObjects(model);
		mav.setViewName("/community/communityReplyForm");
		System.out.println("답변세팅완료");
		
		return mav;
	}
	
	@RequestMapping(value="/communityReply.do")
	public String communityReply(HttpServletRequest request)throws Exception{
		System.out.println("자유게시판 답글쓰기 컨트롤러");
		Map<String, Object> map = new HashMap<String, Object>();

		Enumeration<?> enums = request.getParameterNames();
		while(enums.hasMoreElements()){
			String paramName = enums.nextElement().toString();
			String paramValue = request.getParameter(paramName);
			System.out.println("ParamName:"+paramName+" ParmaValue:"+paramValue);
			map.put(paramName, paramValue);
		}
		service.communityReply(map);
		
		return "redirect:/communityBoard.do";
	}
}
