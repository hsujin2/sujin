package com.mommefatale.qna.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.qna.model.QnaVO;
import com.mommefatale.qna.service.QnaContentService;
import com.mommefatale.qna.service.QnaUpdateService;

@Controller
public class QnaUpdateController {

	private QnaContentService command;
	private QnaUpdateService service;
	
	public QnaContentService getCommand() {
		return command;
	}
	public void setCommand(QnaContentService command) {
		this.command = command;
	}
	public QnaUpdateService getService() {
		return service;
	}
	public void setService(QnaUpdateService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/qnaUpdate.do")
	public ModelAndView qnaUpdate(HttpServletRequest request)throws Exception{
		System.out.println("Q&A게시판 글수정페이지 컨트롤러");
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		QnaVO vo = command.qnaContent(no);
		mav.setViewName("/qna/qnaUpdate");
		mav.addObject("vo",vo);
		return mav;
	}
	
	@RequestMapping(value="/qnaUpdateProc.do")
	public ModelAndView qnaUpdateProc(HttpServletRequest request)throws Exception{
		System.out.println("Q&A게시판 글수정 컨트롤러");
		ModelAndView mav= new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		int no = Integer.parseInt(request.getParameter("no"));
		Enumeration<?> enums = request.getParameterNames();
		while(enums.hasMoreElements()){
			String paramName = enums.nextElement().toString();
			String paramValue= request.getParameter(paramName);
			System.out.println("no:"+no+", paramName:"+paramName+", paramValue:"+paramValue);
			map.put(paramName, paramValue);
		}
		map.put("no", no);
		service.qnaUpdate(map);
		mav.setViewName("redirect:/qnaBoard.do");
		return mav;
	}
		

}
