package com.mommefatale.contents.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.contents.model.ExerciseVO;
import com.mommefatale.contents.service.ExerciseContentService;

@Controller
public class ExerciseContentController {

	private ExerciseContentService command;

	public ExerciseContentService getCommand() {
		return command;
	}

	public void setCommand(ExerciseContentService command) {
		this.command = command;
	}

	@RequestMapping(value = "/exerciseContent.do")
	public ModelAndView exerciseContent(HttpServletRequest request) throws Exception {
		System.out.println("운동법 내용보기 컨트롤러");
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		ExerciseVO vo = command.exerciseContent(no);
		command.exerciseView(no);
		mav.setViewName("/contents/exercise2");
		mav.addObject("vo", vo);
		return mav;
	}

}
