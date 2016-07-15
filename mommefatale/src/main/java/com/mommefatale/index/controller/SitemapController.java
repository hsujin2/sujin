package com.mommefatale.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SitemapController {
	@RequestMapping(value="sitemap.do")
	public String sitemap(){
		return "sitemap/sitemap";
	}
}
