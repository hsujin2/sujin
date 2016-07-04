package com.mommefatale.gallery.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.gallery.model.GalleryVO;



public interface GalleryDAO {
	// 목록 가져오기
		public List<GalleryVO> getGalleryList(Object obj);

	// 글 개수 가져오기
		public int getGalleryCount();
		
	// 글쓰기
		public void galleryWrite(Map<String, Object> vo);
		
	// 글내용 가져오기
		public GalleryVO getGalleryContent(int no);
		
	// 글 조회수 올리기
		public void galleryView(int no);
		
	// 글 수정하기
		public void galleryUpdate(Map<String, Object> vo);
		
	// 글 삭제하기
		public void galleryDelete(int no);	
}
