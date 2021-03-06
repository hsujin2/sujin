package com.mommefatale.item.usercontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.item.model.ItemVO;
import com.mommefatale.item.model.Paging;
import com.mommefatale.item.service.ItemListService;

@Controller
public class ItemListUserController {
	
	private ItemListService command;
	private Paging boardPaging;
	
	public void setCommand(ItemListService command) {
		this.command = command;
	}
	
	public void setBoardPaging(Paging boardPaging){
		this.boardPaging = boardPaging;
	}

	@RequestMapping(value="itemList.do", method=RequestMethod.GET)
	public ModelAndView itemListUserView(HttpServletRequest request)throws Exception{
		//request 에서 order 
		request.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		
		String pageNum = request.getParameter("pageNum");
		String category = request.getParameter("category");
		if(pageNum == null || pageNum == ""){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize=12; // 한페이지의 게시물수
		int pageNavi=3; // 페이지 수
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int count = 0;
		if(category == null || category == ""){
			//count = command.getCount(); //전체 글수
		}else{
			count = command.getCategoryCount(category); // 전체 글수
		}
		int number = count - (currentPage - 1) * pageSize; // 화면에 보여줄 글 번호
		boardPaging.setPaging(pageSize, pageNavi, count, currentPage);
		
		map.put("startRow", boardPaging.getWriting_Start());
		map.put("endRow", boardPaging.getWriting_End());
		
		//상품정렬
		String range = request.getParameter("range");
		map.put("range", range);
		//
		System.out.println("렌지"+range);
		List<ItemVO> itemlist = null;
		
		if(category == null || category == ""){
//			itemlist = command.listAll(map);
		}else{
			map.put("category", category);
			itemlist = command.listCategory(map);
		}
		Map<String, Object> model = new HashMap<String, Object>();
		
		String path = request.getSession().getServletContext().getRealPath("");
		model.put("path", path);
		model.put("category", category);
		model.put("itemlist",itemlist);
		model.put("count", new Integer(count));
		model.put("number", new Integer(number));
		model.put("pageNum", pageNum);
		model.put("paging", boardPaging);
		model.put("range", range);
		
		mav.setViewName("item/itemList");
		mav.addAllObjects(model);
		
		return mav;
	}
	
	@RequestMapping(value="bestitemlist.json")
	public ModelAndView bestItemList(HttpServletRequest request){
		Integer category = Integer.parseInt(request.getParameter("category"));
		ModelAndView mav = new ModelAndView();
		List<ItemVO> bestitemlist = command.bestList(category);
		mav.addObject("itemlist",bestitemlist);
		mav.setViewName("jsonView");
		return mav;
	}
}
