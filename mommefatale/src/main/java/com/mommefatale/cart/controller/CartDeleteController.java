package com.mommefatale.cart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mommefatale.cart.service.CartDeleteService;

@Controller
public class CartDeleteController {
	private CartDeleteService command;

	public void setCommand(CartDeleteService command) {
		this.command = command;
	}

	@RequestMapping(value="cartdelete.do")
	public String cartDelete(HttpServletRequest request){
		String arr = request.getParameter("arr");
		String[] tempStr = null;
		tempStr = arr.split(",");
		for(int i = 0; i < tempStr.length; ++i){
			command.cartDelete(tempStr[i]);
		}
		return "redirect:/cartlist.do";
	}
}
