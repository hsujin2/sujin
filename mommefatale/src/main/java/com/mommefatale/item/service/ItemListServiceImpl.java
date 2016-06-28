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

}
