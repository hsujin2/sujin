package com.mommefatale.item.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//@Controller
public class ItemListController {
	
//	ItemListService command;
//	public void setCommand(ItemListService service){
//		this.command = command;
//	}
//	
//	@RequestMapping("/itemlist.admin")
//	public ModelAndView itemAdminList(HttpServletRequest request){
//		request.setCharacterEncoding("UTF-8");
//		
//		ModelAndView mav = new ModelAndView();
//		String pageNum = request.getParameter("pageNum");
//		String category = request.getParameter("category");
//		
//		if(pageNum ==null || pageNum == "")
//		{
//			pageNum = "1";
//		}
//		int currentPage = Integer.parseInt(pageNum);
//		int pageSize = 5; // 보여질 게시물 수
//		int pageNavi = 3; // 보여질 페이지 수
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		int count;
//		
//		if(category == null || category == ""){
//			count = command.getCount(); // 전체글수
//		}else{
//			count = command.getCategoryCount(category); // 전체글수
//		}
//		int number = count - (currentPage -1) * pageSize; //화면의 글번호
//		boardPaging.setPaging(pageSize, pageNavi, count, currentPage);
//		
//		map.put("startRow", boardPaging.getWriting_Start());
//		map.put("endRow", boardPaging.getWriting_End());
//		List<ItemVO> itemList = null;
//		if(category == null || category == ""){
//			itemList = command.listAll(map);
//		}else{
//			map.put("category", category);
//			itemList = command.listCategory(map);
//		}
//		
//		Map<String, Object> model = new HashMap<String, Object>();
//		
//		model.put("category", category);
//		model.put("itemList", itemList);
//		model.put("count", new Integer(count));
//		model.put("number", new Integer(number));
//		model.put("pageNum", pageNum);
//		model.put("bp", boardPaging);
//		
//		mav.setViewName("admin/adminmain");
//		mav.addAllObjects(model);
//		return mav;
//	}
}
