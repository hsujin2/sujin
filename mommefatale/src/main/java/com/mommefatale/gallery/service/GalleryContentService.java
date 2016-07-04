package com.mommefatale.gallery.service;

import com.mommefatale.gallery.model.GalleryVO;

public interface GalleryContentService {
	
	public GalleryVO galleryContent(int no);
	
	public void galleryView(int no);
}
