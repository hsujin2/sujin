package com.mommefatale.item.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.item.model.ItemVO;
import com.mommefatale.item.model.Paging;
import com.mommefatale.item.service.ItemListService;

@Controller
public class ItemListController {
	
	private ItemListService command;
	private Paging boardPaging;
	public void setCommand(ItemListService command){
		this.command = command;
	}
	public void setBoardPaging(Paging boardPaging){
		this.boardPaging = boardPaging;
	}
	
	@RequestMapping("itemlist.admin")
	public ModelAndView itemAdminList(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		
		String pageNum = request.getParameter("pageNum");
		String category = request.getParameter("category");
		
		if(pageNum ==null || pageNum == "")
		{
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15; // 보여질 게시물 수
		int pageNavi = 3; // 보여질 페이지 수
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int count = 0;
		if(category == null || category == ""){
			count = command.getCount(); // 전체글수
		}else{
			count = command.getCategoryCount(category); // 전체글수
		}
		int number = count - (currentPage -1) * pageSize; //화면의 글번호
		boardPaging.setPaging(pageSize, pageNavi, count, currentPage);
		
		map.put("startRow", boardPaging.getWriting_Start());
		map.put("endRow", boardPaging.getWriting_End());
		
		//상품정렬
		String range = request.getParameter("range");
		map.put("range", range);
		System.out.println(range + "정렬");
		//
		
		List<ItemVO> itemlist = null;
		if(category == null || category == ""){
			itemlist = command.listAll(map);
		}else{
			map.put("category", category);
			itemlist = command.listCategory(map);
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		String path = request.getSession().getServletContext().getRealPath("");
		model.put("path", path);
		model.put("category", category);
		model.put("itemlist", itemlist);
		model.put("count", new Integer(count));
		model.put("number", new Integer(number));
		model.put("pageNum", pageNum);
		model.put("paging", boardPaging);
		model.put("range", range);
		
		mav.setViewName("admin/adminItemList");
		mav.addAllObjects(model);
		return mav;
	}
	@RequestMapping(value="modifyOpen.json")
	public ModelAndView modifyItem(HttpServletRequest request, ItemVO itemVO){
		System.out.println("모디파이 제이슨");
		ModelAndView mav = new ModelAndView();
		Integer item_no = Integer.parseInt(request.getParameter("item_no"));
		itemVO = command.getModifyItem(item_no);
		mav.addObject("item", itemVO);
		mav.setViewName("jsonView");
		return mav;
	}
}
