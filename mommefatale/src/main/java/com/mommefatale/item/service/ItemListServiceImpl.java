package com.mommefatale.item.service;

import java.util.List;
import java.util.Map;

import com.mommefatale.item.dao.ItemDAO;
import com.mommefatale.item.model.ItemVO;

public class ItemListServiceImpl implements ItemListService{

	private ItemDAO dao;
	
	public void setDao(ItemDAO dao) {
		this.dao = dao;
	}

	@Override
	public int getCategoryCount(String category) {
		return dao.getCategoryCount(category);
	}

	@Override
	public List<ItemVO> listCategory(Map<String, Object> map) {
		return dao.listCategory(map);
	}

	@Override
	public List<ItemVO> bestList(Integer category) {
		return dao.bestList(category);
	}

	@Override
	public List<ItemVO> indexbestItemList() {
		return dao.indexbestItemList();
	}

	@Override
	public List<ItemVO> indexnewItemList() {
		return dao.indexnewItemList();
	}

	@Override
	public Integer getCount(Map<String, Object> map) {
		return dao.getCount(map);
	}

	@Override
	public List<ItemVO> listAll(Map<String, Object> map) {
		return dao.listAll(map);
	}

	@Override
	public ItemVO getModifyItem(Integer item_no) {
		return dao.getModifyItem(item_no);
	}


}
