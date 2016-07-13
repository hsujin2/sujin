package com.mommefatale.admin.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mommefatale.admin.member.model.MemberVO;
import com.mommefatale.admin.member.service.MemberUpdateService;

@Controller
public class MemberUpdateController {

	private MemberUpdateService command;

	public MemberUpdateService getCommand() {
		return command;
	}

	public void setCommand(MemberUpdateService command) {
		this.command = command;
	}
	
	@RequestMapping(value="memberUpdate.admin")
	public String updateMember(HttpServletRequest request, MemberVO vo)throws Exception{
		
		vo.setId(request.getParameter("member_id"));
		vo.setGrade(request.getParameter("member_grade")); // 회원 등급 변경
		vo.setPoint(Integer.parseInt(request.getParameter("member_point"))); // 회원 포인트 변경
		vo.setState(Integer.parseInt(request.getParameter("member_state"))); // 회원 정지/탈퇴용
		command.memberUpdate(vo);
		System.out.println("아이디:"+vo.getId()+"회원 정보 수정 컨트롤러");
		
		return "redirect:/member.admin";
		
	}
}
