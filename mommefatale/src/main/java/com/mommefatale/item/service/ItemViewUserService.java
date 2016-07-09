package com.mommefatale.item.service;

import com.mommefatale.item.model.ItemVO;

public interface ItemViewUserService {
	public ItemVO itemView(int item_no);
	public void itemViewCount(int item_no);
}
