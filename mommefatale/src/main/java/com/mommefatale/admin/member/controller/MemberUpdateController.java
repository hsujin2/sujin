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
		vo.setGrade(request.getParameter("member_grade")); // ȸ�� ��� ����
		vo.setPoint(Integer.parseInt(request.getParameter("member_point"))); // ȸ�� ����Ʈ ����
		vo.setState(Integer.parseInt(request.getParameter("member_state"))); // ȸ�� ����/Ż���
		command.memberUpdate(vo);
		System.out.println("���̵�:"+vo.getId()+"ȸ�� ���� ���� ��Ʈ�ѷ�");
		
		return "redirect:/member.admin";
		
	}
}
