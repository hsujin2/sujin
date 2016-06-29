package com.mommefatale.item.controller;

import java.io.File;
import java.io.IOException;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.item.model.ItemVO;
import com.mommefatale.item.service.ItemInsertService;

@Controller
public class ItemInsertController {
	
	private ItemInsertService command;
	
	public void setCommand(ItemInsertService command) {
		this.command = command;
	}
	
	@RequestMapping(value="insertItem.admin", method=RequestMethod.POST)
	public ModelAndView insertItem(MultipartHttpServletRequest request, ItemVO itemVO){
		MultipartFile mainimg = request.getFile("main-img");
		MultipartFile contentimg = request.getFile("content-img");
		String filename1 = "file1_" + System.currentTimeMillis()+ "_" + mainimg.getOriginalFilename();
		String filename2 = "file2_" + System.currentTimeMillis()+ "_" + contentimg.getOriginalFilename();
		File file = new File(request.getSession().getServletContext().getRealPath("")+"\\resources\\images\\uploadimg\\"+filename1);
		File file2 = new File(request.getSession().getServletContext().getRealPath("")+"\\resources\\images\\uploadimg\\"+filename2);
		if(!file.exists()){
			file.mkdirs();
		}
		if(!file2.exists())
		{
			file2.mkdirs();
		}
		try {
			mainimg.transferTo(file);
			contentimg.transferTo(file2);
			System.out.println(file.getAbsolutePath());
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(contentimg.getOriginalFilename());
		
		itemVO.setCategory(Integer.parseInt(request.getParameter("category")));
		itemVO.setName(request.getParameter("name"));
		itemVO.setBrand(request.getParameter("brand"));
		itemVO.setOrigin(request.getParameter("origin"));
		itemVO.setPrice_origin(Integer.parseInt(request.getParameter("price")));
		itemVO.setPrice_sales(Integer.parseInt(request.getParameter("sales")));
		itemVO.setPrice_discount(Integer.parseInt(request.getParameter("discount")));
		if(request.getParameter("option_size")==null || request.getParameter("option_size")==""){
			itemVO.setOption_size("");
		}else{
			itemVO.setOption_size(request.getParameter("option_size"));
		}
		itemVO.setStock(Integer.parseInt(request.getParameter("stock")));
		if(request.getParameter("color")==null || request.getParameter("color")==""){
			itemVO.setColor("");
		}else{
			itemVO.setColor(request.getParameter("color"));
		}
		itemVO.setMain_img(filename1);
		itemVO.setContent_img(filename2);
		command.insertItem(itemVO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/adminMain.admin");
		return mav;
	}
}
