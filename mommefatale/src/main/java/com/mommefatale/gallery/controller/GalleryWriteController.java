package com.mommefatale.gallery.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.gallery.service.GalleryWriteService;

@Controller
public class GalleryWriteController {
	
	private GalleryWriteService command;

	public GalleryWriteService getCommand() {
		return command;
	}

	public void setCommand(GalleryWriteService command) {
		this.command = command;
	}
	
	@RequestMapping(value = "/galleryWriteForm.do")
	public ModelAndView galleryWriteForm(HttpServletRequest request) throws Exception{
		System.out.println("°¶·¯¸® ±Û¾²±â Æû ÄÁÆ®·Ñ·¯");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/gallery/galleryWriteForm");
		
		return mav;
	}
	
	@RequestMapping(value = "/galleryWrite.do")
	public ModelAndView galleryWrite(HttpServletRequest request) throws Exception{
		System.out.println("°¶·¯¸®");
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<>();
		Enumeration<?> enums = request.getParameterNames();
		while(enums.hasMoreElements()){
			String paramName = enums.nextElement().toString();
			String paramValue = request.getParameter(paramName);
			System.out.println("ParamName:" + paramName + " ParamValue:" + paramValue);
			map.put(paramName, paramValue);
		}
		command.galleryWrite(map);
		mav.setViewName("redirect/gallery.do");
		
		return mav;
	}

}
