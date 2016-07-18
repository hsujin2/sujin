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
		int pageSize = 15; // ������ �Խù� ��
		int pageNavi = 3; // ������ ������ ��
		
		Map<String, Object> map = new HashMap<String, Object>();

		//��ǰ ã��
		String group = request.getParameter("group");
		String text = request.getParameter("text");
		System.out.println("�˻��� : "+group+" "+text);
		if(group!=null){
			if(group.equals("ī�װ�")){
				switch(text){
				case "���׸ӽ�" : category = "1"; break;
				case "����Ʈ�ⱸ" : category = "2"; break;
				case "����Ŭ" : category = "3"; break;
				case "�Ʒ�" : category = "4"; break;
				case "���" : category = "6"; break;
				case "�ȭ" : category = "7"; break;
				case "���������" : category = "8"; break;
				case "������" : category = "10"; break;
				case "������" : category = "11"; break;
				case "��Ÿ��ǰ" : category = "12"; break;
				}
			}
		}else{
			group = "����";
			text = "����";
		}
		map.put("group", group);
		if(group.equals("����")){
			map.put("text", Integer.parseInt(text));
		}else{
			map.put("text", text);
		}
		//
		System.out.println("���� ī�װ�" + category);
		int count = 0;
		if(category == null || category == ""){
			count = command.getCount(map); // ��ü�ۼ�
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
		System.out.println(range + "����");
		
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
