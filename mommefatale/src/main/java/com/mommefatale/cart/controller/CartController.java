package com.mommefatale.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		Map<String, Object> id = new HashMap<String, Object>();
		id.put("userid", user.getUserid());
		id.put("item", item.getNo());
		if(command.getCartItem(id)!=null){
			cartVO.setUser_id(user.getUserid());
			cartVO.setItem_no(item.getNo());
			cartVO.setItem_name(item.getName());
			cartVO.setItem_category(item.getCategory());
			cartVO.setItem_discount(item.getPrice_discount());
			cartVO.setItem_size(item.getOption_size());
			cartVO.setCart_count(Integer.parseInt(request.getParameter("count")));
			cartVO.setMain_img(item.getMain_img());
			cartVO.setSaving(Integer.parseInt(request.getParameter("saving")));
			cartVO.setFee(Integer.parseInt(request.getParameter("fee")));
			command.updateCart(cartVO);
			System.out.println("cart update");
			
		}else{
			cartVO.setUser_id(user.getUserid());
			cartVO.setItem_no(item.getNo());
			cartVO.setItem_name(item.getName());
			cartVO.setItem_category(item.getCategory());
			cartVO.setItem_discount(item.getPrice_discount());
			cartVO.setItem_size(item.getOption_size());
			cartVO.setCart_count(Integer.parseInt(request.getParameter("count")));
			cartVO.setMain_img(item.getMain_img());
			cartVO.setSaving(Integer.parseInt(request.getParameter("saving")));
			cartVO.setFee(Integer.parseInt(request.getParameter("fee")));
			command.insertCart(cartVO);
			System.out.println("cart insert");
		}
		return "redirect:/itemview.do?no="+request.getParameter("no");
		}
	@RequestMapping(value="cartlist.do")
	public ModelAndView cartView(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Object obj = request.getSession().getAttribute("login");
		UserVO user = null;
		if(obj instanceof UserVO){
			user = (UserVO) obj;
		}else{
			mav.setViewName("redirect:/login.do");
			return mav;
		}
		Map<String, Object> model = new HashMap<String, Object>();
		List<CartVO> cartlist = command.cartList(user.getUserid());
		int fee=0;
		int fee2=0;
		int total=0;
		for(int i=0; i<cartlist.size(); i++){
			total += cartlist.get(i).getItem_discount();
			if(cartlist.get(i).getFee() == 2500){
				fee = 2500;
			}else if(cartlist.get(i).getFee() == 50000){
				fee2 = 50000;
			}
		}
		if(fee2==0){
			model.put("fee", fee);
		}else{
			model.put("fee", fee2);
		}
		model.put("total", total);
		model.put("cartlist", cartlist);
		mav.addAllObjects(model);
		mav.setViewName("user/cartList");
		
		return mav;
	}
	
}
