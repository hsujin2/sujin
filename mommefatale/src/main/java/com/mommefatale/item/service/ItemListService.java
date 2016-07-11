package com.mommefatale.item.service;

import java.util.List;
import java.util.Map;

import com.mommefatale.item.model.ItemVO;

public interface ItemListService {
	public int getCategoryCount(String category);
	public List<ItemVO> listCategory(Map<String, Object> map);
	public List<ItemVO> bestList(Integer category);
	public List<ItemVO> indexbestItemList();
	public List<ItemVO> indexnewItemList();
	public Integer getCount();
	public List<ItemVO> listAll(Map<String, Object> map);
}
