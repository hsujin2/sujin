package com.mommefatale.gallery.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String galleryWriteForm(HttpServletRequest request) throws Exception{
		System.out.println("갤러리 글쓰기 폼 컨트롤러");
		
		return "/gallery/galleryWriteForm";
	}
	
	@RequestMapping(value = "/galleryWrite.do")
	public String galleryWrite(HttpServletRequest request) throws Exception{
		System.out.println("갤러리");
		Map<String, Object> map = new HashMap<String, Object>();
		
		// content에서 이미지 경로 가져오기
		String content = request.getParameter("content");
		String imgPath = "/mommefatale/resources/images/uploadimg/images/";
		int content_i = content.indexOf(imgPath);
		String gallery_image = content.substring(content_i+imgPath.length(),(content.substring(content_i).indexOf("\"")+content_i));
				
		Enumeration<?> enums = request.getParameterNames();
		while(enums.hasMoreElements()){
			String paramName = enums.nextElement().toString();
			String paramValue = request.getParameter(paramName);
			System.out.println("ParamName:" + paramName + " ParamValue:" + paramValue);
			map.put(paramName, paramValue);
		}
		
		map.put("image", gallery_image);
		command.galleryWrite(map);
		
		return "redirect:/gallery.do";
	}

}
