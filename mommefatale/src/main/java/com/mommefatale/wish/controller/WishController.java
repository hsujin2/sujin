package com.mommefatale.wish.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.wish.model.WishVO;
import com.mommefatale.wish.service.WishService;
import com.mommefatale.item.model.ItemVO;
import com.mommefatale.item.service.ItemViewUserService;
import com.mommefatale.user.model.UserVO;

@Controller
public class WishController {
	private WishService command;
	private ItemViewUserService itemService;

	public void setCommand(WishService command) {
		this.command = command;
	}

	public ItemViewUserService getItemService() {
		return itemService;
	}

	public void setItemService(ItemViewUserService itemService) {
		this.itemService = itemService;
	}

	@RequestMapping("wishInsert.do")
	public String wishInsert(HttpServletRequest request, WishVO wishVO){
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
		String chk = command.getWishItem(id);
		if(chk!=null){
			wishVO.setUser_id(user.getUserid());
			wishVO.setItem_no(item.getNo());
			wishVO.setItem_name(item.getName());
			wishVO.setItem_category(item.getCategory());
			wishVO.setItem_discount(item.getPrice_discount());
			wishVO.setItem_size(item.getOption_size());
			wishVO.setWish_count(Integer.parseInt(request.getParameter("count")));
			wishVO.setMain_img(item.getMain_img());
			wishVO.setSaving(Integer.parseInt(request.getParameter("saving")));
			wishVO.setFee(Integer.parseInt(request.getParameter("fee")));
			command.updateWish(wishVO);
			System.out.println("wish update");
			
		}else{
			wishVO.setUser_id(user.getUserid());
			wishVO.setItem_no(item.getNo());
			wishVO.setItem_name(item.getName());
			wishVO.setItem_category(item.getCategory());
			wishVO.setItem_discount(item.getPrice_discount());
			wishVO.setItem_size(item.getOption_size());
			wishVO.setWish_count(Integer.parseInt(request.getParameter("count")));
			wishVO.setMain_img(item.getMain_img());
			wishVO.setSaving(Integer.parseInt(request.getParameter("saving")));
			wishVO.setFee(Integer.parseInt(request.getParameter("fee")));
			command.insertWish(wishVO);
			System.out.println("wish insert");
		}
		return "redirect:/itemview.do?no="+request.getParameter("no");
		}
	@RequestMapping(value="wishlist.do")
	public ModelAndView wishView(HttpServletRequest request){
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
		List<WishVO> wishlist = command.wishList(user.getUserid());
		int fee=0;
		int fee2=0;
		int total=0;
		for(int i=0; i<wishlist.size(); i++){
			total += wishlist.get(i).getItem_discount();
			if(wishlist.get(i).getFee() == 2500){
				fee = 2500;
			}else if(wishlist.get(i).getFee() == 50000){
				fee2 = 50000;
			}
		}
		if(fee2==0){
			model.put("fee", fee);
		}else{
			model.put("fee", fee2);
		}
		model.put("total", total);
		model.put("wishlist", wishlist);
		mav.addAllObjects(model);
		mav.setViewName("user/wishList");
		
		return mav;
	}
	
}
