package com.mommefatale.qna.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.qna.model.QnaVO;
import com.mommefatale.qna.service.QnaContentService;

@Controller
public class QnaContentController {

	private QnaContentService command;

	public QnaContentService getCommand() {
		return command;
	}

	public void setCommand(QnaContentService command) {
		this.command = command;
	}

	@RequestMapping(value = "/qnaContent.do")
	public ModelAndView qnaContent(HttpServletRequest request) throws Exception {
		System.out.println("Q&A게시판 내용보기 컨트롤러");
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		QnaVO vo = command.qnaContent(no);
		command.qnaView(no);
		mav.setViewName("/qna/qnaContent");
		mav.addObject("vo", vo);
		return mav;
	}

}
