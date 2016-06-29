package com.mommefatale.index.controller;

import com.mommefatale.index.service.IndexBoardService;

@Controller
public class IndexBoardController {

	private IndexBoardService service;

	public IndexBoardService getService() {
		return service;
	}

	public void setService(IndexBoardService service) {
		this.service = service;
	}
	
	@RequestMapping(value="indexBoard.do")
	public ModelAndView indexBoard(HttpServletRequest request)throws Exception{
		System.out.println("인덱스 자유게시판 컨트롤러");
		ModelAndView mav = new ModelAndView();
		List<CommunityBoardVO> community = service.indexCommunityList();
		mav.addObject("community",community);
		mav.setViewName("index");
		return mav;
}
