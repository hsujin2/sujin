package com.mommefatale.item.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mommefatale.item.model.ItemVO;

public class ItemDAOImpl implements ItemDAO{
	private static final String namespace = "com.mommefatale.item.dao.ItemMapper";
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public void insertItem(ItemVO itemVO) {
		session.insert(namespace + ".insertItem",itemVO);
	}
	@Override
	public int getCategoryCount(String category) {
		return session.selectOne(namespace + ".getCategoryCount",category);
	}
	@Override
	public List<ItemVO> listCategory(Map<String, Object> map) {
		return session.selectList(namespace + ".listCategory",map);
	}
	@Override
	public ItemVO itemView(int item_no) {
		return session.selectOne(namespace + ".itemView",item_no);
	}
	@Override
	public List<ItemVO> bestList(Integer category) {
		return session.selectList(namespace + ".bestList",category);
	}
	@Override
	public void itemViewCount(int item_no) {
		session.update(namespace + ".itemViewCount",item_no);
	}
	@Override
	public List<ItemVO> indexbestItemList() {
		return session.selectList(namespace + ".indexbestItemList");
	}
	@Override
	public List<ItemVO> indexnewItemList() {
		return session.selectList(namespace + ".indexnewItemList");
	}
	@Override
	public Integer getCount() {
		return session.selectOne(namespace + ".getCount");
	}
	@Override
	public List<ItemVO> listAll(Map<String, Object> map) {
		return session.selectList(namespace + ".listAll",map);
	}
	@Override
	public ItemVO getModifyItem(Integer item_no) {
		return session.selectOne(namespace + ".getModifyItem",item_no);
	}

}
