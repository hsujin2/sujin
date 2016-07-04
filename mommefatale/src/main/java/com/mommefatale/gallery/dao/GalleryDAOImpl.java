package com.mommefatale.gallery.dao;

import java.util.List;
import java.util.Map;

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
		System.out.println("갤러리 리스트 DAO");
		return session.selectList(namespace + ".galleryList", obj);
	}

	@Override
	public int getGalleryCount() {
		int count = session.selectOne(namespace + ".galleryCount");
		System.out.println("갤러리 총 게시물 수 : " + count);
		return count;
	}

	@Override
	public void galleryWrite(Map<String, Object> vo) {
		System.out.println("갤러리 글쓰기 DAO");
		session.insert(namespace + ".galleryWrite", vo);
		return;
	}
	
	@Override
	public GalleryVO getGalleryContent(int no){
		System.out.println("갤러리 글내용 DAO");
		return session.selectOne(namespace+".galleryContent", no);
	}

	@Override
	public void galleryView(int no) {
		System.out.println(no + "번 조회수 1 증가");
		session.update(namespace + ".galleryView", no);
		
	}

	@Override
	public void galleryUpdate(Map<String, Object> vo) {
		System.out.println("갤러리 글수정 DAO");
		session.update(namespace + ".galleryUpdate", vo);
		
	}
	
	@Override
	public void galleryDelete(int no) {
		System.out.println("갤러리 글삭제 DAO");
		session.delete(namespace + ".galleryDelete", no);
	}
	
	

}
