package com.mommefatale.payment.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.item.model.ItemVO;
import com.mommefatale.item.service.ItemViewUserService;
import com.mommefatale.user.model.UserVO;

@Controller
public class PaymentViewController {
	private ItemViewUserService command;
	
	public void setCommand(ItemViewUserService command) {
		this.command = command;
	}

	@RequestMapping(value="payment.do", method=RequestMethod.POST)
	public ModelAndView viewPayment(HttpServletRequest request, ItemVO itemVO)throws Exception{
		request.setCharacterEncoding("utf-8");
		String arr = request.getParameter("arr");
		String[] tempStr = null;
		List<ItemVO> itemlist = new ArrayList<ItemVO>();
		List<Integer> countlist = new ArrayList<Integer>();
		List<String> sizelist = new ArrayList<String>();
		Integer total = new Integer(0);
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		UserVO vo = null;
		if(obj instanceof UserVO){
			vo = (UserVO)obj;
		}
		if(arr != null){
			
		}else{
			itemVO = command.itemView(Integer.parseInt(request.getParameter("no")));
			itemlist.add(itemVO);
			countlist.add(Integer.parseInt(request.getParameter("quantity")));
			sizelist.add(request.getParameter("size"));
			total = itemVO.getPrice_discount() * Integer.parseInt(request.getParameter("quantity"));
			mav.getModel().put("category", itemVO.getCategory());
		}
		
		int fee = Integer.parseInt(request.getParameter("fee"));
		int saving = Integer.parseInt(request.getParameter("saving"));
		
		mav.getModel().put("total", total);
		mav.getModel().put("user", vo);
		session.setAttribute("item", itemlist);
		session.setAttribute("count", countlist);
		session.setAttribute("size", sizelist);
		session.setAttribute("fee", fee);
		session.setAttribute("saving", saving);
		
		mav.setViewName("payment/payment");
		return mav;
		
	}
}
