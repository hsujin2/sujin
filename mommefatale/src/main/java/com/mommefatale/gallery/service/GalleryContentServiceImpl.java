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
		System.out.println("������ �۳��� ����");
		return dao.getGalleryContent(no);
	}

	@Override
	public void galleryView(int no) {

		System.out.println("��ȸ�� ���� ����");
		dao.galleryView(no);
		
	}
	
	

}
