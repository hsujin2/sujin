package com.mommefatale.item.dao;

import java.util.List;
import java.util.Map;

import com.mommefatale.item.model.ItemVO;

public interface ItemDAO {
	public void insertItem(ItemVO itemVO);
	public int getCategoryCount(String category);
	public List<ItemVO> listCategory(Map<String, Object> map);
	public ItemVO itemView(int item_no);
	public List<ItemVO> bestList(Integer category);
	public void itemViewCount(int item_no);
	public List<ItemVO> indexbestItemList();
	public List<ItemVO> indexnewItemList();
}
