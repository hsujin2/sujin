package com.mommefatale.gallery.dao;

import java.util.List;

import com.mommefatale.gallery.model.GalleryVO;



public interface GalleryDAO {
	// 목록 가져오기
		public List<GalleryVO> getGalleryList(Object obj);

		public int getGalleryCount();
}
