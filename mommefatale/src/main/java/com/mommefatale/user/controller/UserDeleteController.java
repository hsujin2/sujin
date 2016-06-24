package com.mommefatale.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mommefatale.user.model.UserVO;
import com.mommefatale.user.service.UserDeleteService;

@Controller
public class UserDeleteController {
	private UserDeleteService command;

	public void setCommand(UserDeleteService command) {
		this.command = command;
	}

	@RequestMapping("/userDelete.do")
	public String userDelete() {
		return "/user/userDelete";
	}

	@RequestMapping("/userDeleteProc.do")
	public String userDeleteProc(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("login");
		System.out.println(vo.getUserid());
		String userid = vo.getUserid();
		command.deleteUser(userid);
		session.invalidate();
		System.out.println("Å»Åð¿Ï·á");
		return "index";

	}
}
