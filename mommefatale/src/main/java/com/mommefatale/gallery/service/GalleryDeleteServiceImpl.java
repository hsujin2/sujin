package com.mommefatale.gallery.service;

import com.mommefatale.gallery.dao.GalleryDAO;

public class GalleryDeleteServiceImpl implements GalleryDeleteService {
	private GalleryDAO dao;

	public GalleryDAO getDao() {
		return dao;
	}

	public void setDao(GalleryDAO dao) {
		this.dao = dao;
	}
	@Override
	public void galleryDelete(int no) {
		System.out.println("������ �ۻ��� ����");
		dao.galleryDelete(no);
	}
}
