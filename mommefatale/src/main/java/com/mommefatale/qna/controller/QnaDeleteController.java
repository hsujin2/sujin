package com.mommefatale.qna.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mommefatale.qna.service.QnaDeleteService;

@Controller
public class QnaDeleteController {
	
	private QnaDeleteService command;
	
	public QnaDeleteService getCommand() {
		return command;
	}

	public void setCommand(QnaDeleteService command) {
		this.command = command;
	}

	@RequestMapping(value="/qnaDelete.do")
	public String qnaDelete(HttpServletRequest request)throws Exception{
		System.out.println("Q&A게시판 글삭제 컨트롤러");
		int no = Integer.parseInt(request.getParameter("no"));
		command.qnaDelete(no);
		return "redirect:/qnaBoard.do";
	}
}
