package com.mommefatale.gallery.service;

import com.mommefatale.gallery.dao.GalleryDAO;
import com.mommefatale.gallery.model.GalleryVO;

public class GalleryContentServiceImpl implements GalleryContentService {

	private GalleryDAO dao;
	
	public GalleryDAO getDao(){
		return dao;
	}
	
	public void setDao(GalleryDAO dao){
		this.dao = dao;
	}

	@Override
	public GalleryVO galleryContent(int no) {
		System.out.println("갤러리 글내용 서비스");
		return dao.getGalleryContent(no);
	}

	@Override
	public void galleryView(int no) {

		System.out.println("조회수 증가 서비스");
		dao.galleryView(no);
		
	}
	
	

}
