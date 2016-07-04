package com.mommefatale.gallery.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.gallery.service.GalleryDeleteService;

@Controller
public class GalleryDeleteController {
	private GalleryDeleteService command;

	public GalleryDeleteService getCommand() {
		return command;
	}

	public void setCommand(GalleryDeleteService command) {
		this.command = command;
	}
	
	@RequestMapping(value="/galleryDelete.do")
	public ModelAndView galleryDelete(HttpServletRequest request)throws Exception{
		System.out.println("������ �ۻ��� ��Ʈ�ѷ�");
		ModelAndView mav =  new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		command.galleryDelete(no);
		mav.setViewName("redirect:/gallery.do");
		return mav;
	}
}
