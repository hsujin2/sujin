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


	private ExerciseUpdateService service;

	public ExerciseUpdateService getService() {
		return service;
	}

	public void setService(ExerciseUpdateService service) {
		this.service = service;
	}

	
	@RequestMapping(value="exericseUpdate.do")
	public ModelAndView exerciseUpdate(HttpServletRequest request) throws Exception{
		System.out.println("��� �ۼ��������� ��Ʈ�ѷ�");
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		ExerciseVO vo = command.exerciseContent(no);
		mav.setViewName("/contents/exerciseUpdate");
		mav.addObject("vo", vo);
		return mav;
	}
	
		
	
}
