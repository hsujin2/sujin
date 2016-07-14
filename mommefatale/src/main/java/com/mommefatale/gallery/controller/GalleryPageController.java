package com.mommefatale.gallery.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.community.model.Paging;
import com.mommefatale.gallery.model.GalleryVO;
import com.mommefatale.gallery.service.GalleryPageService;

@Controller
public class GalleryPageController {

	private GalleryPageService command;
	private Paging paging;

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	public GalleryPageService getCommand() {
		return command;
	}

	public void setCommand(GalleryPageService command) {
		this.command = command;
	}

	@RequestMapping(value = "/gallery.do")
	public ModelAndView GalleryPage(HttpServletRequest request) throws Exception {
		System.out.println("갤러리 리스트 컨트롤러");
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");

		Map<String, Object> map = new HashMap<String, Object>();
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 9;
		int pageNavi = 3;
		int page_count = command.GalleryPageCount();

		int number = page_count - (currentPage - 1) * pageSize;

		paging.setPaging(pageSize, pageNavi, page_count, currentPage);
		map.put("startRow", paging.getWriting_Start());
		map.put("endRow", paging.getWriting_End());

		System.out.println("카운트 : " + page_count);

		List<GalleryVO> vo = command.GalleryPage(map);
		int count = vo.size();

		Map<String, Object> model = new HashMap<String, Object>();

		model.put("galleryList", vo);
		model.put("page_count", new Integer(page_count));
		model.put("number", new Integer(number));
		model.put("pageNum", pageNum);
		model.put("paging", paging);
		mav.addAllObjects(model);
		mav.setViewName("/gallery/galleryPage");
		mav.addObject("vo", vo);
		mav.addObject("count", count);
		return mav;

	}
}
