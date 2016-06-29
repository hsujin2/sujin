package com.mommefatale.item.service;

import com.mommefatale.item.dao.ItemDAO;
import com.mommefatale.item.model.ItemVO;

public class ItemViewUserServiceImpl implements ItemViewUserService {

	
	private ItemDAO dao;
	
	public void setDao(ItemDAO dao) {
		this.dao = dao;
	}

	@Override
	public ItemVO itemView(int item_no) {
		return dao.itemView(item_no);
	}

}
