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
		System.out.println("������ ����Ʈ DAO");
		return session.selectList(namespace + ".galleryList", obj);
	}

	@Override
	public int getGalleryCount() {
		int count = session.selectOne(namespace + ".galleryCount");
		System.out.println("������ �� �Խù� �� : " + count);
		return count;
	}

	@Override
	public void galleryWrite(Map<String, Object> vo) {
		System.out.println("������ �۾��� DAO");
		session.insert(namespace + ".galleryWrite", vo);
		return;
	}
	
	@Override
	public GalleryVO getGalleryContent(int no){
		System.out.println("������ �۳��� DAO");
		return session.selectOne(namespace+".galleryContent", no);
	}

	@Override
	public void galleryView(int no) {
		System.out.println(no + "�� ��ȸ�� 1 ����");
		session.update(namespace + ".galleryView", no);
		
	}

	@Override
	public void galleryUpdate(Map<String, Object> vo) {
		System.out.println("������ �ۼ��� DAO");
		session.update(namespace + ".galleryUpdate", vo);
		
	}
	
	@Override
	public void galleryDelete(int no) {
		System.out.println("������ �ۻ��� DAO");
		session.delete(namespace + ".galleryDelete", no);
	}
	
	

}
