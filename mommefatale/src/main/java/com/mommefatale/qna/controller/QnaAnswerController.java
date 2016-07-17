package com.mommefatale.qna.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.qna.model.QnaVO;
import com.mommefatale.qna.service.QnaAnswerService;
import com.mommefatale.qna.service.QnaContentService;

@Controller
public class QnaAnswerController {
	
	private QnaContentService command;
	private QnaAnswerService service;
	
	public QnaContentService getCommand() {
		return command;
	}
	public void setCommand(QnaContentService command) {
		this.command = command;
	}
	public QnaAnswerService getService() {
		return service;
	}
	public void setService(QnaAnswerService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/qnaAnswerForm.admin")
	public ModelAndView qnaAnswerForm(HttpServletRequest request)throws Exception{
		System.out.println("Q&A게시판 답변 폼 컨트롤러");
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		QnaVO vo = command.qnaContent(no);
		vo.setSubject(vo.getSubject());
		vo.setContent("\n\t[원문]"+"\n\n "+vo.getContent()+
				"\n ---------------------------------------------------------------------------------------------\n\n");
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("vo", vo);
		mav.addAllObjects(model);
		mav.setViewName("/qna/qnaAnswerForm");
		System.out.println("답변세팅완료");
		
		return mav;
	}
	
	@RequestMapping(value="/qnaAnswer.admin")
	public ModelAndView qnaAnswer(HttpServletRequest request)throws Exception{
		System.out.println("Q&A게시판 답변쓰기 컨트롤러");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();

		Enumeration<?> enums = request.getParameterNames();
		while(enums.hasMoreElements()){
			String paramName = enums.nextElement().toString();
			String paramValue = request.getParameter(paramName);
			System.out.println("ParamName:"+paramName+" ParmaValue:"+paramValue);
			map.put(paramName, paramValue);
		}
		service.qnaAnswer(map);
		mav.setViewName("redirect:/qnaBoard.do");
		
		return mav;
	}
	

}
