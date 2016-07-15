package com.mommefatale.admin.pdf.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mommefatale.admin.pdf.dao.AdminDocumentFactory;

@Controller
public class PdfController {
	private AdminDocumentFactory documentFactory;
	public void setDocumentFactory(AdminDocumentFactory documentFactory) {
		this.documentFactory = documentFactory;
	}
	@RequestMapping(value="createPDFpage.admin")
	public String PDFView(){
		return "admin/createPDF";
	}
	@RequestMapping(value="createPDF.admin", method=RequestMethod.POST)
	public ModelAndView createPDF(MultipartHttpServletRequest request, ModelMap modelMap){
		ModelAndView mav= new ModelAndView();
		
		String pdfName= request.getParameter("pdfName");
		if(pdfName==null){
			pdfName="";
		}
		String content= request.getParameter("content");
		Iterator iter= request.getFileNames();
		List<File> createFiles= new Vector<>();
		while(iter.hasNext()){
			Object obj= iter.next();
			System.out.println(obj);
			if(obj instanceof String){
				String getFileName= (String)obj;
				MultipartFile file= request.getFile(getFileName);
				if(file.isEmpty()){
					System.out.println("Not Found File");
					break;
				}
				String fileName= file.getOriginalFilename();
				File createFile= new File(request.getSession().getServletContext().getRealPath("")+"\\resources\\sendfile\\"+fileName);
				if(!createFile.exists()){
					createFile.mkdirs();
				}
				try {
					file.transferTo(createFile);
				} catch (Exception e) {
					System.out.println("File Exception : "+e.getMessage());
				}
				createFiles.add(createFile);
			}
		}
		documentFactory.setPdfName(pdfName);
		documentFactory.setContent(content);
		documentFactory.setCreateFiles(createFiles);
		documentFactory.createPDF();
		
		mav.setViewName("admin/adminMain");
		return mav;
	}
}
