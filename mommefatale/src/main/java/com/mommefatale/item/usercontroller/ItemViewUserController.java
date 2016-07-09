package com.mommefatale.item.usercontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.item.model.ItemVO;
import com.mommefatale.item.service.ItemViewUserService;
import com.mommefatale.user.model.UserVO;

@Controller
public class ItemViewUserController {
	private ItemViewUserService command;

	public void setCommand(ItemViewUserService command) {
		this.command = command;
	}

	@RequestMapping(value="itemview.do", method=RequestMethod.GET)
	public ModelAndView itemView(HttpServletRequest request, ItemVO itemVO){
		ArrayList<String> quick_view;
		if(request.getSession().getAttribute("quick_view")==null){
			quick_view = new ArrayList<String>();
		}else{
			quick_view = (ArrayList<String>) request.getSession().getAttribute("quick_view");
		}
		quick_view.add(request.getParameter("no"));
		
		if(quick_view.size()>=3){
			quick_view.remove(0);
		}
		
		request.getSession().setAttribute("quick_view", quick_view);
		
		ModelAndView mav = new ModelAndView();
		int item_no = Integer.parseInt(request.getParameter("no"));
		itemVO = command.itemView(item_no);
		UserVO user = (UserVO)request.getSession().getAttribute("login");
		Map<String, Object> model = new HashMap<String, Object>();
		if(user != null){
			model.put("user", user);
		}else{
			model.put("user", "null");
		}
		
		//조회수증가
		command.itemViewCount(item_no);
		
		model.put("item", itemVO);
		
		mav.addAllObjects(model);
		mav.setViewName("item/item");
		return mav;
	}
}
