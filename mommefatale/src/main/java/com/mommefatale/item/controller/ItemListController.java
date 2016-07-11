package com.mommefatale.item.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		int pageSize = 15; // ������ �Խù� ��
		int pageNavi = 3; // ������ ������ ��
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int count = 0;
		if(category == null || category == ""){
			count = command.getCount(); // ��ü�ۼ�
		}else{
			count = command.getCategoryCount(category); // ��ü�ۼ�
		}
		int number = count - (currentPage -1) * pageSize; //ȭ���� �۹�ȣ
		boardPaging.setPaging(pageSize, pageNavi, count, currentPage);
		
		map.put("startRow", boardPaging.getWriting_Start());
		map.put("endRow", boardPaging.getWriting_End());
		
		//��ǰ����
		String range = request.getParameter("range");
		map.put("range", range);
		//
		
		List<ItemVO> itemList = null;
		if(category == null || category == ""){
			itemList = command.listAll(map);
		}else{
			map.put("category", category);
			itemList = command.listCategory(map);
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		String path = request.getSession().getServletContext().getRealPath("");
		model.put("path", path);
		model.put("category", category);
		model.put("itemList", itemList);
		model.put("count", new Integer(count));
		model.put("number", new Integer(number));
		model.put("pageNum", pageNum);
		model.put("paging", boardPaging);
		
		mav.setViewName("admin/adminItemList");
		mav.addAllObjects(model);
		return mav;
	}
}
