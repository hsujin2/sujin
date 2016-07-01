package com.mommefatale.cart.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.cart.model.CartVO;
import com.mommefatale.cart.service.CartService;
import com.mommefatale.item.model.ItemVO;
import com.mommefatale.item.service.ItemViewUserService;
import com.mommefatale.user.model.UserVO;

@Controller
public class CartController {
	private CartService command;
	private ItemViewUserService itemService;

	public void setCommand(CartService command) {
		this.command = command;
	}

	public ItemViewUserService getItemService() {
		return itemService;
	}

	public void setItemService(ItemViewUserService itemService) {
		this.itemService = itemService;
	}

	@RequestMapping("cartInsert.do")
	public String cartInsert(HttpServletRequest request, CartVO cartVO){
		Object obj = request.getSession().getAttribute("login");
		UserVO user = null;
		if(obj instanceof UserVO){
			user= (UserVO) obj; 
		}
		else
		{
			return "redirect:/login.do";
		}
		ItemVO item = itemService.itemView(Integer.parseInt(request.getParameter("no")));
		cartVO.setUser_id(user.getUserid());
		cartVO.setItem_no(item.getNo());
		cartVO.setItem_name(item.getName());
		cartVO.setItem_category(item.getCategory());
		cartVO.setItem_discount(item.getPrice_discount());
		cartVO.setItem_size(item.getOption_size());
		cartVO.setCart_count(Integer.parseInt(request.getParameter("count")));
		cartVO.setMain_img(item.getMain_img());
		
		command.insertCart(cartVO);
		System.out.println("cart insert");
		return "redirect:/itemview.do?no="+request.getParameter("no");
	}
	
}
