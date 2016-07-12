package com.mommefatale.item.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mommefatale.item.service.ItemDeleteService;

@Controller
public class ItemDeleteController {
	private ItemDeleteService command;

	public void setCommand(ItemDeleteService command) {
		this.command = command;
	}

	@RequestMapping(value="deleteItem.admin")
	public String deleteItem(HttpServletRequest request){
		Integer item_no = Integer.parseInt(request.getParameter("item_no"));
		command.deleteItem(item_no);
		return "redirect:/itemlist.admin?range=new";
	}
}
