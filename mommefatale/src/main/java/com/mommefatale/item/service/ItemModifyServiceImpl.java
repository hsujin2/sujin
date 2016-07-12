package com.mommefatale.item.service;

import com.mommefatale.item.dao.ItemDAO;
import com.mommefatale.item.model.ItemVO;

public class ItemModifyServiceImpl implements ItemModifyService{
	private ItemDAO dao;

	public void setDao(ItemDAO dao) {
		this.dao = dao;
	}

	@Override
	public void modifyItem(ItemVO itemVO) {
		dao.modifyItem(itemVO);
	}

}
