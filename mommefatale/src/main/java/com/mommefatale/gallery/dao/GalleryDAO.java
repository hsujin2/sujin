package com.mommefatale.gallery.dao;

import java.util.List;

import com.mommefatale.gallery.model.GalleryVO;



public interface GalleryDAO {
	// ��� ��������
		public List<GalleryVO> getGalleryList(Object obj);

		public int getGalleryCount();
}
