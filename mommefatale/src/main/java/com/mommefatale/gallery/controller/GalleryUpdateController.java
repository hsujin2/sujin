package com.mommefatale.gallery.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.gallery.model.GalleryVO;
import com.mommefatale.gallery.service.GalleryContentService;
import com.mommefatale.gallery.service.GalleryUpdateService;

@Controller
public class GalleryUpdateController {
	private GalleryContentService command;
	public GalleryContentService getCommand() {
		return command;
	}
	public void setCommand(GalleryContentService command) {
		this.command = command;
	}
	public GalleryUpdateService getService() {
		return service;
	}
	public void setService(GalleryUpdateService service) {
		this.service = service;
	}
	private GalleryUpdateService service;
	
	@RequestMapping(value="/galleryUpdate.do")
	public ModelAndView galleryUpdate(HttpServletRequest request)throws Exception{
		System.out.println("갤러리 글수정페이지 컨트롤러");
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		GalleryVO vo = command.galleryContent(no);
		mav.setViewName("/gallery/galleryUpdate");
		mav.addObject("vo",vo);
		return mav;
	}
	
	@RequestMapping(value="/galleryUpdateProc.do")
	public String galleryUpdateProc(HttpServletRequest request)throws Exception{
		System.out.println("갤러리 글수정 컨트롤러");
		Map<String, Object> map = new HashMap<String, Object>();
		int no = Integer.parseInt(request.getParameter("no"));
		Enumeration<?> enums = request.getParameterNames();
		
		String content = request.getParameter("content");
		String imgPath = "/mommefatale/resources/images/uploadimg/images/";
		int content_i = content.indexOf(imgPath);
		String gallery_image = content.substring(content_i+imgPath.length(),(content.substring(content_i).indexOf("\"")+content_i));
		
		while(enums.hasMoreElements()){
			String paramName = enums.nextElement().toString();
			String paramValue= request.getParameter(paramName);
			System.out.println("no:"+no+", paramName:"+paramName+", paramValue:"+paramValue);
			map.put(paramName, paramValue);
		}
		
		map.put("image", gallery_image);
		map.put("no", no);
		service.galleryUpdate(map);
		return "redirect:/gallery.do";
	}
	
}
