package com.mommefatale.payment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.cart.model.CartVO;
import com.mommefatale.cart.service.CartService;
import com.mommefatale.item.model.ItemVO;
import com.mommefatale.item.service.ItemViewUserService;
import com.mommefatale.payment.model.BankVO;
import com.mommefatale.payment.service.PaymentViewService;
import com.mommefatale.user.model.CouponVO;
import com.mommefatale.user.model.UserVO;
import com.mommefatale.user.service.UserCouponService;

@Controller
public class PaymentViewController {
	private ItemViewUserService itemservice;
	private CartService cartservice;
	private UserCouponService couponservice;
	private PaymentViewService command;

	public void setCommand(PaymentViewService command) {
		this.command = command;
	}

	public void setCartservice(CartService cartservice) {
		this.cartservice = cartservice;
	}

	public void setItemservice(ItemViewUserService itemservice) {
		this.itemservice = itemservice;
	}

	public void setCouponservice(UserCouponService couponservice) {
		this.couponservice = couponservice;
	}

	@RequestMapping(value="payment.do", method=RequestMethod.POST)
	public ModelAndView viewPayment(HttpServletRequest request, ItemVO itemVO, BankVO bankVO)throws Exception{
		request.setCharacterEncoding("utf-8");
		String arr = request.getParameter("arr");
		String[] tempStr = null;
		List<ItemVO> itemlist = new ArrayList<ItemVO>();
		List<Integer> countlist = new ArrayList<Integer>();
		List<String> sizelist = new ArrayList<String>();
		List<Integer> savinglist = new ArrayList<Integer>();
		List<CouponVO> couponlist = new ArrayList<CouponVO>();
		Integer total = new Integer(0);
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("login");
		UserVO vo = null;
		if(obj instanceof UserVO){
			vo = (UserVO)obj;
		}
		
		int fee=0;
		if(arr != null){
			System.out.println("arrIn");
			tempStr = arr.split(",");
			for(int i = 0; i < tempStr.length; ++i)
			{
				CartVO cart = cartservice.getCart(Integer.parseInt(tempStr[i]));
				itemlist.add(itemservice.itemView(cart.getItem_no()));
				countlist.add(cart.getCart_count());
				sizelist.add(cart.getItem_size());
				savinglist.add(cart.getSaving());
				total += itemlist.get(i).getPrice_discount() * countlist.get(i);
			}
			mav.getModel().put("category", "cart");
			mav.getModel().put("total", total);
			session.setAttribute("cartArr", tempStr);
	
			fee = Integer.parseInt(request.getParameter("fee"));
			
		}else{
			itemVO = itemservice.itemView(Integer.parseInt(request.getParameter("no")));
			itemlist.add(itemVO);
			countlist.add(Integer.parseInt(request.getParameter("count")));
			sizelist.add(request.getParameter("size"));
			total = itemVO.getPrice_discount() * Integer.parseInt(request.getParameter("count"));
			mav.getModel().put("category", itemVO.getCategory());
			
			fee = Integer.parseInt(request.getParameter("fee"));
			savinglist.add(Integer.parseInt(request.getParameter("saving")));
		}
		
		couponlist = couponservice.getCoupons(vo.getCoupon());
		
		//은행 계좌번호 리스트
		List<BankVO> banklist = command.getBank();
		
		//사용가능 포인트
		Integer useablepoint = command.getUseAblePoint(vo.getUserid());
		vo.setPoint(useablepoint);
		//
		
		mav.getModel().put("bank", banklist);
		mav.getModel().put("total", total);
		mav.getModel().put("user", vo);
		session.setAttribute("item", itemlist);
		session.setAttribute("count", countlist);
		session.setAttribute("size", sizelist);
		session.setAttribute("fee", fee);
		session.setAttribute("saving", savinglist);
		session.setAttribute("coupon", couponlist);
		mav.setViewName("payment/payment");
		return mav;
		
	}
}
