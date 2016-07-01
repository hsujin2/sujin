package com.mommefatale.gallery.service;

import java.util.Map;

import com.mommefatale.gallery.dao.GalleryDAO;

public class GalleryWriteServiceImpl implements GalleryWriteService {

	private GalleryDAO dao;
	
	public GalleryDAO getDao() {
		return dao;
	}
	
	public void setDao(GalleryDAO dao) {
		this.dao = dao;
	}

	@Override
	public void galleryWrite(Map<String, Object> vo) {
		System.out.println("갤러리 글쓰기 서비스");
		dao.galleryWrite(vo);
		

	}

}
