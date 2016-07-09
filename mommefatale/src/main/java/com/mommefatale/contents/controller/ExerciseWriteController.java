package com.mommefatale.contents.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.contents.service.ExerciseWriteService;

@Controller
public class ExerciseWriteController {

	private ExerciseWriteService command;

	public ExerciseWriteService getCommand() {
		return command;
	}

	public void setCommand(ExerciseWriteService command) {
		this.command = command;
	}

	@RequestMapping(value = "exerciseWriteForm.do")
	public ModelAndView exerciseWriteForm(HttpServletRequest request) throws Exception {
		System.out.println("운동법 글쓰기 폼 컨트롤러");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/contents/exerciseWriteForm");
		return mav;
	}

	@RequestMapping(value = "/ExerciseWrite.do")
	public ModelAndView exerciseWrite(HttpServletRequest request) throws Exception {
		System.out.println("운동법");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		Enumeration<?> enums = request.getParameterNames();
		while (enums.hasMoreElements()) {
			String paramName = enums.nextElement().toString();
			String paramValue = request.getParameter(paramName);
			System.out.println("paramName:" + paramName + " paramValue : " + paramValue);
			map.put(paramName, paramValue);
		}
		map.put("image", "");
		command.exerciseWrite(map);
		mav.setViewName("redirect:/exercise1.do");

		return mav;
	}

}
