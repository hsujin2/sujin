package com.mommefatale.contents.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.contents.model.ExerciseVO;
import com.mommefatale.contents.service.ExerciseContentService;
import com.mommefatale.contents.service.ExerciseUpdateService;

@Controller
public class ExerciseUpdateController {
	private ExerciseContentService command;

	public ExerciseContentService getCommand() {
		return command;
	}

	public void setCommand(ExerciseContentService command) {
		this.command = command;
	}

	private ExerciseUpdateService command2;
	

	public ExerciseUpdateService getCommand2() {
		return command2;
	}

	public void setCommand2(ExerciseUpdateService command2) {
		this.command2 = command2;
	}

	private ExerciseUpdateService service;

	public ExerciseUpdateService getService() {
		return service;
	}

	public void setService(ExerciseUpdateService service) {
		this.service = service;
	}

	
	@RequestMapping(value="exericseUpdate.do")
	public ModelAndView exerciseUpdate(HttpServletRequest request) throws Exception{
		System.out.println("운동법 글수정페이지 컨트롤러");
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		ExerciseVO vo = command.exerciseContent(no);
		mav.setViewName("/contents/exerciseUpdate");
		mav.addObject("vo", vo);
		return mav;
	}
	
	@RequestMapping(value="/exerciseUpdateProc.do")
	public String exerciseUpdateProc(HttpServletRequest request, ExerciseVO exerciseVO)throws Exception{
		System.out.println("운동법 글수정 컨트롤러");
		exerciseVO.setNo(Integer.parseInt(request.getParameter("no")));
		exerciseVO.setSubject(request.getParameter("subject"));
		exerciseVO.setCategory(request.getParameter("category"));
		exerciseVO.setContent(request.getParameter("content"));
		exerciseVO.setImage(request.getParameter("image"));
		command2.exerciseUpdate(exerciseVO);
		return "redirect/exercise1.do";
	}
	
		
	
}
