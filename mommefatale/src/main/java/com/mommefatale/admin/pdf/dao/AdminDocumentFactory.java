package com.mommefatale.admin.pdf.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.StringReader;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.html.simpleparser.HTMLWorker;
import com.itextpdf.text.html.simpleparser.StyleSheet;
import com.itextpdf.text.pdf.PdfWriter;
import com.mommefatale.admin.pdf.service.GetCalendarServiceImple;

import oracle.net.aso.f;

public class AdminDocumentFactory {
	/*
	public static final BaseColor COLOR_RED;
	public static final BaseColor COLOR_GREEN;
	public static final BaseColor COLOR_BLUE;
	public static final Font FONT_TIMES_14;
	public static final Font FONT_COURIER_9;
	static{
		COLOR_RED= new BaseColor(255,0,0);
		COLOR_GREEN= new BaseColor(0, 255,255);
		COLOR_BLUE= new BaseColor(0,0,255);
		
		FONT_TIMES_14= FontFactory.getFont(FontFactory.TIMES, 14F, Font.NORMAL, COLOR_RED);
		FONT_COURIER_9= FontFactory.getFont(FontFactory.COURIER, 9F, Font.BOLDITALIC, COLOR_BLUE);
	}
	*/
	private String pdfName;
	private String content;
	private List<File> createFiles;
	public String getPdfName() {
		return pdfName;
	}
	public void setPdfName(String pdfName) {
		this.pdfName = pdfName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<File> getCreateFiles() {
		return createFiles;
	}
	public void setCreateFiles(List<File> createFiles) {
		this.createFiles = createFiles;
	}
	@SuppressWarnings({ "deprecation", "static-access" })
	public void createPDF(){
		Document doc= new Document(PageSize.A4, 30F, 30F, 30F, 30F);
		HTMLWorker htmlWorker= new HTMLWorker(doc);
		Calendar cal= Calendar.getInstance();
		int year= cal.get(Calendar.YEAR);
		int month= cal.get(Calendar.MONTH)+1;
		int date= cal.get(Calendar.DATE);
		int day= cal.get(Calendar.DAY_OF_WEEK);
		GetCalendarServiceImple week= new GetCalendarServiceImple();
		
		String createDate= String.format("%d.%02d.%02d", year,month,date)+week.getWeek(year, month, date);
		if(pdfName.equals("")){
			pdfName= String.format("%d.%02d.%02d", year,month,date);
		}
		String savePDFpath= "C:\\Temp\\"+pdfName+".pdf";
		try{
			/*
			doc.add(new Paragraph("けいし"));
			doc.add(new Paragraph("けいし"));
			doc.add(image);
			System.out.println("Image Size - "+"Width : "+image.getWidth()+", Height : "+image.getHeight());
			
			doc.close();
			*/
			StringBuffer stringBuffer= new StringBuffer();
			stringBuffer.append("<html><head></head><body>");
			stringBuffer.append("<h1>");
			stringBuffer.append("</h1><br>");
			stringBuffer.append("<h2>");
			stringBuffer.append(content);
			stringBuffer.append("</h2>");
			stringBuffer.append("</body></html>");
			StringReader stringReader =new StringReader(stringBuffer.toString());
			FontFactory.register("C:\\Windows\\Fonts\\gulim.ttc");
			StyleSheet styleSheet= new StyleSheet();
			styleSheet.loadTagStyle("body", "face", "閏顕端");
			styleSheet.loadTagStyle("body", "encoding", "Identity-H");
			PdfWriter.getInstance(doc, new FileOutputStream(savePDFpath));
			
			doc.open();
			List<Element> list= htmlWorker.parseToList(stringReader, styleSheet);
			for(int i=0;  i<list.size(); i++){
				doc.add((Element)list.get(i));
			}
			for(int i=0; i<createFiles.size(); i++){
				Image image= Image.getInstance(createFiles.get(i).getAbsolutePath());
				image.scaleToFit(doc.getPageSize().getWidth()/1.2F,doc.getPageSize().getHeight()/1.2F);
				image.setAlignment(Image.ALIGN_CENTER);
				doc.add(image);
			}
			doc.close();
			System.out.println("Create PDF file : "+savePDFpath);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
