package com.mommefatale.gallery.service;

import java.util.List;
import com.mommefatale.gallery.model.GalleryVO;

public interface GalleryPageService {
	public List<GalleryVO> GalleryPage(Object obj);
	public int GalleryPageCount();

}
