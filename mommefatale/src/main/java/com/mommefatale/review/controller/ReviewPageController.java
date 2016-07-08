package com.mommefatale.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.board.model.Paging;
import com.mommefatale.review.model.ReviewVO;
import com.mommefatale.review.service.ReviewPageService;

public class ReviewPageController {
	private ReviewPageService command;
	private Paging paging;

	public ReviewPageService getCommand() {
		return command;
	}

	public void setCommand(ReviewPageService command) {
		this.command = command;
	}

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	@RequestMapping(value = "/review.do")
	public ModelAndView ReviewPage(HttpServletRequest request) throws Exception {
		System.out.println("리뷰 페이지 컨트롤러");
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
		int page_count = command.reviewCountPage();

		int number = page_count - (currentPage - 1) * pageSize;
		paging.setPaging(pageSize, pageNavi, page_count, currentPage);
		map.put("startRow", paging.getWriting_Start());
		map.put("endRow", paging.getWriting_End());

		System.out.println("카운트 : " + page_count);
		List<ReviewVO> vo = command.reviewPage(map);
		int count = vo.size();

		Map<String, Object> model = new HashMap<String, Object>();

		model.put("boardlist", vo);
		model.put("page_count", new Integer(page_count));
		model.put("number", new Integer(number));
		model.put("pageNum", pageNum);
		model.put("paging", paging);
		mav.addAllObjects(model);
		mav.setViewName("review/review");
		mav.addObject("vo", vo);
		mav.addObject("count", count);

		return mav;
	}

}
