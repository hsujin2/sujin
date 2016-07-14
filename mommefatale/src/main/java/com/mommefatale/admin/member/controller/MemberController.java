package com.mommefatale.admin.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.admin.member.model.MemberVO;
import com.mommefatale.admin.member.service.MemberService;
import com.mommefatale.community.model.Paging;
import com.mommefatale.user.model.UserVO;

@Controller
public class MemberController {

	private MemberService command;
	private Paging paging;

	public MemberService getCommand() {
		return command;
	}
	
	public void setCommand(MemberService command) {
		this.command = command;
	}
	
	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}
	
	
	@RequestMapping(value="/member.admin")
	public ModelAndView adminMember(HttpServletRequest request)throws Exception{
		System.out.println("회원관리 페이지 컨트롤러");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
	      UserVO user = (UserVO)session.getAttribute("login");
	      ModelAndView mav = new ModelAndView();
	      if(user==null){
	         mav.setViewName("redirect:/login.do");
	         return mav;
	      }else if(!user.getUserid().equals("admin")){
	         mav.setViewName("redirect:/login.do");
	         return mav;
	      }
		
		String pageNum = request.getParameter("pageNum");
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		int pageNavi = 3;
		int page_count = command.adminMemberCount();
		
		int number = page_count - (currentPage - 1) * pageSize;

		paging.setPaging(pageSize, pageNavi, page_count, currentPage);
		map.put("startRow", paging.getWriting_Start());
		map.put("endRow", paging.getWriting_End());
		
		System.out.println("회원 수: " + page_count);
		
		map.put("memberCount", new Integer(page_count));
		map.put("name", request.getParameter("name"));
		map.put("id", request.getParameter("id"));
		map.put("gender", request.getParameter("gender"));
		map.put("grade", request.getParameter("grade"));
		map.put("join_date", request.getParameter("join_date"));
		map.put("last_visit_date", request.getParameter("last_visit_date"));
		
		System.out.println("name :" + map.get("name"));
		System.out.println("id :" + map.get("id"));
		System.out.println("gender :" + map.get("gender"));
		System.out.println("grade :" + map.get("grade"));
		System.out.println("join_date :" + map.get("join_date"));
		System.out.println("last_visit_date :" + map.get("last_visit_date"));
		
		System.out.println("회원리스트 컨트롤러");
		List<MemberVO> vo = command.adminMember(map);
		int count = vo.size();
		Map<String, Object> model =	new HashMap<String, Object>();
		model.put("memberList", vo);
		model.put("page_count", new Integer(page_count));
		model.put("number", new Integer(number));
		model.put("pageNum", pageNum);
		model.put("paging", paging);
		
		System.out.println("탈퇴회원리스트 컨트롤러");
		List<MemberVO> vo2 = command.adminMemberBye(map);
		int count2= vo2.size();
		Map<String, Object> model2 =	new HashMap<String, Object>();
		model2.put("memberByeList", vo2);
		
		mav.addAllObjects(model);
		mav.addAllObjects(model2);
		mav.setViewName("admin/adminMember");
		mav.addObject("vo", vo);
		mav.addObject("vo2", vo2);
		mav.addObject("count", count);
		mav.addObject("count2", count2);
		return mav;
	}
	
	@RequestMapping(value="member.json")
	public ModelAndView adminMemberJson(HttpServletRequest request)throws Exception{
		System.out.println("회원관리 Json 페이지 컨트롤러");
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		
		String pageNum = request.getParameter("pageNum");
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		int pageNavi = 3;
		int page_count = command.adminMemberCount();
		
		int number = page_count - (currentPage - 1) * pageSize;

		paging.setPaging(pageSize, pageNavi, page_count, currentPage);
		map.put("startRow", paging.getWriting_Start());
		map.put("endRow", paging.getWriting_End());
		
		System.out.println("검색된 회원 수: " + page_count);
		map.put("memberCount", new Integer(page_count));
		map.put("name", request.getParameter("name"));
		map.put("id", request.getParameter("id"));
		map.put("gender", request.getParameter("gender"));
		map.put("grade", request.getParameter("grade"));
		map.put("join_date", request.getParameter("join_date"));
		map.put("last_visit_date", request.getParameter("last_visit_date"));
		
		System.out.println("name :" + map.get("name"));
		System.out.println("id :" + map.get("id"));
		System.out.println("gender :" + map.get("gender"));
		System.out.println("grade :" + map.get("grade"));
		System.out.println("join_date :" + map.get("join_date"));
		System.out.println("last_visit_date :" + map.get("last_visit_date"));
		List<MemberVO> vo = command.adminMember(map);
		int count = vo.size();
		
		Map<String, Object> model =	new HashMap<String, Object>();
		model.put("memberList", vo);
		model.put("page_count", new Integer(page_count));
		model.put("number", new Integer(number));
		model.put("pageNum", pageNum);
		model.put("paging", paging);
		mav.addAllObjects(model);
		mav.setViewName("jsonView");
		mav.addObject("vo", vo);
		mav.addObject("count", count);
		
		System.out.println("회원리스트 가져오기 컨트롤러");
		return mav;
	}
	
	@RequestMapping(value="updateMember.json")
	public ModelAndView updateMember(HttpServletRequest request, MemberVO vo){
		System.out.println("회원정보 수정 Json 컨트롤러");
		ModelAndView mav = new ModelAndView();
		String member_id = request.getParameter("id");
		vo =  (MemberVO) command.memberInfo(member_id);
		mav.addObject("memberInfo", vo);
		mav.setViewName("jsonView");
		return mav;
	}
}
