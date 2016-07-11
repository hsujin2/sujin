package com.mommefatale.admin.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.admin.member.model.MemberVO;
import com.mommefatale.admin.member.service.MemberService;

@Controller
public class MemberController {

	private MemberService command;

	public MemberService getCommand() {
		return command;
	}

	public void setCommand(MemberService command) {
		this.command = command;
	}
	
	@RequestMapping(value="/member.admin")
	public ModelAndView adminMember(HttpServletRequest request)throws Exception{
		System.out.println("회원관리 페이지 컨트롤러");
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int memberCount = command.adminMemberCount();
		
		map.put("memberCount", new Integer(memberCount));
		List<MemberVO> vo = command.adminMember(map);
		Map<String, Object> model =	new HashMap<String, Object>();
		
		
		return mav;
	}
	
	@RequestMapping(value="/member.json")
	public ModelAndView adminMemberJson(HttpServletRequest request)throws Exception{
		System.out.println("회원관리 Json 페이지 컨트롤러");
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
		
		int memberCount = command.adminMemberCount();
		map.put("memberCount", new Integer(memberCount));
		List<MemberVO> vo = command.adminMember(map);
		int count = vo.size();
		
		Map<String, Object> model =	new HashMap<String, Object>();
		
		model.put("memberList", vo);
		mav.addAllObjects(model);
		mav.setViewName("jsonView");
		mav.addObject("vo", vo);
		mav.addObject("count", count);
		
		System.out.println("회원리스트 가져오기 컨트롤러");
		return mav;
	}
	
}
