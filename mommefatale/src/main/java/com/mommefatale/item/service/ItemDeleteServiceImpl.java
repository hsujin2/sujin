package com.mommefatale.item.service;

import com.mommefatale.item.dao.ItemDAO;

public class ItemDeleteServiceImpl implements ItemDeleteService {
	private ItemDAO dao;

	public void setDao(ItemDAO dao) {
		this.dao = dao;
	}

	@Override
	public void deleteItem(Integer item_no) {
		dao.deleteItem(item_no);
	}

}
