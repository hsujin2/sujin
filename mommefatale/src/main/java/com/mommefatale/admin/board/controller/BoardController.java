package com.mommefatale.admin.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.admin.board.service.BoardService;
import com.mommefatale.user.model.UserVO;

@Controller
public class BoardController {

	private BoardService command;

	public BoardService getCommand() {
		return command;
	}

	public void setCommand(BoardService command) {
		this.command = command;
	}
	
	@RequestMapping(value="/board.admin")
	public ModelAndView adminBoard(HttpServletRequest request)throws Exception{
		System.out.println("게시판관리 리스트 컨트롤러");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
	      UserVO user = (UserVO)session.getAttribute("login");
	      ModelAndView mav = new ModelAndView();
	      if(user==null){
	         mav.setViewName("redirect:/login.do");
	         return mav;
	      }else if(!user.getUserid().equals("admin")){
	         mav.setViewName("redirect:/login.do");
	         return mav;
	      }
		
		// 새글 수 가져오기
		int noticeNewCount = command.getBoardNewCount(1); //공지사항
		int communityNewCount = command.getBoardNewCount(2); //자유게시판
		int galleryNewCount = command.getBoardNewCount(3); //갤러리
		int qnaNewCount = command.getBoardNewCount(4); //Q&A
		
		// 전체글 수 가져오기
		int noticeAllCount = command.getBoardAllCount(1);
		int communityAllCount = command.getBoardAllCount(2);
		int galleryAllCount = command.getBoardAllCount(3);
		int qnaAllCount = command.getBoardAllCount(4);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("noticeNewCount", noticeNewCount);
		map.put("communityNewCount", communityNewCount);
		map.put("galleryNewCount", galleryNewCount);
		map.put("qnaNewCount", qnaNewCount);
		map.put("noticeAllCount", noticeAllCount);
		map.put("communityAllCount", communityAllCount);
		map.put("galleryAllCount", galleryAllCount);
		map.put("qnaAllCount", qnaAllCount);
		
		mav.addObject("boardCount", map);
		mav.setViewName("/admin/adminBoardList");
		
		return mav;
	}
	
}
