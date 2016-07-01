package com.mommefatale.qna.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.qna.service.QnaWriteService;

@Controller
public class QnaWriteController {

	private QnaWriteService command;

	public QnaWriteService getCommand() {
		return command;
	}

	public void setCommand(QnaWriteService command) {
		this.command = command;
	}

	@RequestMapping(value = "/qnaWriteForm.do")
	public ModelAndView qnaWriteForm(HttpServletRequest request) throws Exception {
		System.out.println("Q&A게시판 글쓰기 폼 컨트롤러");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/qna/qnaWriteForm");

		return mav;
	}

	@RequestMapping(value = "/qnaWrite.do")
	public ModelAndView qnaWrite(HttpServletRequest request) throws Exception {
		System.out.println("Q&A게시판 글쓰기 컨트롤러");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<>();
		Enumeration<?> enums = request.getParameterNames();
		while (enums.hasMoreElements()) {
			String paramName = enums.nextElement().toString();
			String paramValue = request.getParameter(paramName);
			System.out.println("ParamName:" + paramName + " ParamValue:" + paramValue);
			map.put(paramName, paramValue);
		}
		command.qnaWrite(map);
		mav.setViewName("redirect:/qnaBoard.do");

		return mav;
	}
}
