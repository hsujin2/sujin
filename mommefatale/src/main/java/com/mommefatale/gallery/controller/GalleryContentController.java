package com.mommefatale.gallery.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.gallery.model.GalleryVO;
import com.mommefatale.gallery.service.GalleryContentService;

@Controller
public class GalleryContentController {
	
		private GalleryContentService command;

		public GalleryContentService getCommand() {
			return command;
		}

		public void setCommand(GalleryContentService command) {
			this.command = command;
		}
		
		@RequestMapping(value="/galleryContent.do")
		public ModelAndView galleryContent(HttpServletRequest request) throws Exception{
			System.out.println("갤러리 내용보기 컨트롤러");
			ModelAndView mav = new ModelAndView();
			int no = Integer.parseInt(request.getParameter("no"));
			GalleryVO vo = command.galleryContent(no);
			command.galleryView(no);
			mav.setViewName("/gallery/galleryContent");
			mav.addObject("vo", vo);
			return mav;
		}
		
	
	
}
