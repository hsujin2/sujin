package com.mommefatale.gallery.service;

import java.util.List;

import com.mommefatale.gallery.dao.GalleryDAO;
import com.mommefatale.gallery.model.GalleryVO;

public class GalleryPageServiceImpl implements GalleryPageService{
	
	private GalleryDAO dao;

	public GalleryDAO getDao() {
		return dao;
	}
	
	public void setDao(GalleryDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public List<GalleryVO> galleryPage(Object obj) {
		System.out.println("갤러리 리스트 서비스");
		return dao.getGalleryList(obj);
	}

	@Override
	public int galleryPageCount() {
		return dao.getGalleryCount();
	}

	
	
	
	
	
}
