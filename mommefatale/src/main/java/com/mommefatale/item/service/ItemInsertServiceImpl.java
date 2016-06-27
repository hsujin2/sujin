package com.mommefatale.item.service;

import com.mommefatale.item.dao.ItemDAO;
import com.mommefatale.item.model.ItemVO;

public class ItemInsertServiceImpl implements ItemInsertService{

	private ItemDAO dao;

	public void setDao(ItemDAO dao) {
		this.dao = dao;
	}

	@Override
	public void insertItem(ItemVO itemVO) {
		dao.insertItem(itemVO);
	}

}
