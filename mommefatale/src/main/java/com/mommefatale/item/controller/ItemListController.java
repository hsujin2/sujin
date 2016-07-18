package com.mommefatale.item.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.item.model.ItemVO;
import com.mommefatale.item.model.Paging;
import com.mommefatale.item.service.ItemListService;
import com.mommefatale.user.model.UserVO;

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

		//상품 찾기
		String group = request.getParameter("group");
		String text = request.getParameter("text");
		System.out.println("검색어 : "+group+" "+text);
		if(group!=null){
			if(group.equals("카테고리")){
				switch(text){
				case "런닝머신" : category = "1"; break;
				case "웨이트기구" : category = "2"; break;
				case "사이클" : category = "3"; break;
				case "아령" : category = "4"; break;
				case "운동복" : category = "6"; break;
				case "운동화" : category = "7"; break;
				case "스포츠브라" : category = "8"; break;
				case "보충제" : category = "10"; break;
				case "영양제" : category = "11"; break;
				case "기타식품" : category = "12"; break;
				}
			}
		}else{
			group = "없음";
			text = "없음";
		}
		map.put("group", group);
		if(group.equals("가격")){
			map.put("text", Integer.parseInt(text));
		}else{
			map.put("text", text);
		}
		//
		System.out.println("현재 카테고리" + category);
		int count = 0;
		if(category == null || category == ""){
			count = command.getCount(map); // 전체글수
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
		ModelAndView mav = new ModelAndView();
		Integer item_no = Integer.parseInt(request.getParameter("item_no"));
		itemVO = command.getModifyItem(item_no);
		mav.addObject("item", itemVO);
		mav.setViewName("jsonView");
		return mav;
	}
}
