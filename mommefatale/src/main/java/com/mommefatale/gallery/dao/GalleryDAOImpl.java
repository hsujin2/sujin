package com.mommefatale.gallery.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.mommefatale.gallery.model.GalleryVO;

public class GalleryDAOImpl implements GalleryDAO{

	private static final String namespace = "GalleryMapper";
	
	private SqlSessionTemplate session;
	
	public SqlSessionTemplate getSession() {
		return session;
	}
	
	public void setSession(SqlSessionTemplate session) {
		this.session = session;	
	}
	
	@Override
	public List<GalleryVO> getGalleryList(Object obj) {
		System.out.println("°¶·¯¸® ¸®½ºÆ® DAO");
		return session.selectList(namespace + ".galleryList", obj);
	}

	@Override
	public int getGalleryCount() {
		int count = session.selectOne(namespace + ".galleryCount");
		System.out.println("°¶·¯¸® ÃÑ °Ô½Ã¹° ¼ö : " + count);
		return count;
	}

}
