package com.mommefatale.gallery.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.gallery.model.GalleryVO;



public interface GalleryDAO {
	// ��� ��������
		public List<GalleryVO> getGalleryList(Object obj);

		public int getGalleryCount();
		
	//�۾���
		public void galleryWrite(Map<String, Object> vo);
}
