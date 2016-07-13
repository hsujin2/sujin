package com.mommefatale.item.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ItemAdminController {
	@RequestMapping("itemAdd.admin")
	public String productAdminAddView(HttpServletRequest request)
	{
		return "item/itemAdd";
	}
}
