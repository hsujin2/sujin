package com.mommefatale.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.board.model.CommunityBoardVO;
import com.mommefatale.board.model.Paging;
import com.mommefatale.board.service.CommunityBoardPageService;

@Controller
public class CommunityBoardPageController {

	private CommunityBoardPageService command;
	private Paging paging;

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	public CommunityBoardPageService getCommand() {
		return command;
	}

	public void setCommand(CommunityBoardPageService command) {
		this.command = command;
	}

	@RequestMapping(value = "/communityBoard.do")
	public ModelAndView CommunityBoardPage(HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		int pageNavi = 3;
		int pageCount = command.CommunityPageCount();
		

		int number = pageCount - (currentPage - 1) * pageSize;

		paging.setPaging(pageSize, pageNavi, pageCount, currentPage);
		map.put("startRow", paging.getWriting_Start());
		map.put("endRow", paging.getWriting_End());

		List<CommunityBoardVO> vo = command.CommunityBoardPage(map);
		int count = vo.size();
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("boardList", vo);
		model.put("pageCount", new Integer(pageCount));
		model.put("number", new Integer(number));
		model.put("pageNum", pageNum);
		model.put("paging", paging);

		mav.setViewName("/board/communityBoard");
		mav.addObject("vo", vo);
		mav.addObject("count", count);

		return mav;
	}
}
