package com.mommefatale.gallery.service;

import java.util.Map;

import com.mommefatale.gallery.dao.GalleryDAO;

public class GalleryUpdateServiceImpl implements GalleryUpdateService{
	
	private GalleryDAO dao;

	public GalleryDAO getDao() {
		return dao;
	}

	public void setDao(GalleryDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public void galleryUpdate(Map<String, Object> vo){
		System.out.println("������ �ۼ��� ����");
		dao.galleryUpdate(vo);
	}
	

}
