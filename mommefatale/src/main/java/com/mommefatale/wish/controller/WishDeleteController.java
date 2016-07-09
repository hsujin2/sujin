package com.mommefatale.wish.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mommefatale.wish.service.WishDeleteService;

@Controller
public class WishDeleteController {
	private WishDeleteService command;

	public void setCommand(WishDeleteService command) {
		this.command = command;
	}

	@RequestMapping(value="wishdelete.do")
	public String wishDelete(HttpServletRequest request){
		String arr = request.getParameter("arr");
		String[] tempStr = null;
		tempStr = arr.split(",");
		for(int i = 0; i < tempStr.length; ++i){
			command.wishDelete(tempStr[i]);
		}
		return "redirect:/wishlist.do";
	}
}
