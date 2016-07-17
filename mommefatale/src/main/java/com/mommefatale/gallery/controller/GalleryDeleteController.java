package com.mommefatale.gallery.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String galleryDelete(HttpServletRequest request)throws Exception{
		System.out.println("갤러리 글삭제 컨트롤러");
		int no = Integer.parseInt(request.getParameter("no"));
		command.galleryDelete(no);
		return "redirect:/gallery.do";
	}
}
