package com.mommefatale.item.model;

public class Paging
{
	private Integer pageSize;
	private Integer pageNavi;
	private Integer item_Count;
	private Integer cur_Page;
	private boolean prev;
	private boolean nexts;
	private Integer start_page;
	private Integer end_page;
	
	public Paging() { super(); }
	public void setPaging(Integer pageSize, Integer pageNavi, Integer item_Count, Integer cur_Page)
	{
		this.cur_Page = cur_Page;
		this.item_Count = item_Count;
		this.pageSize = pageSize;
		this.pageNavi = pageNavi;
		prev = isPre();
		nexts = isNext();
		start_page = getPage_Start();
		end_page = getPage_End();
	}
	
	public Integer getPage_Count()
	{
		return (item_Count / pageSize) + (item_Count % pageSize > 0 ? 1 : 0);
	}
	
	public Integer getPage_Start()
	{
		return ((cur_Page - 1) / pageNavi) * pageNavi + 1;
	}
	
	public Integer getPage_End()
	{
		return Math.min(getPage_Start() + pageNavi - 1, getPage_Count());
	}
	
	public boolean isPre()
	{
		return getPage_Start() != 1;
	}
	
	public boolean isNext()
	{
		return getPage_End() < getPage_Count();
	}
	
	public Integer getWriting_Start()
	{
		return getWriting_End() - pageSize + 1;
	}

	public Integer getWriting_End() {
		return cur_Page * pageSize;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(Integer pageNavi) {
		this.pageNavi = pageNavi;
	}

	public Integer getItem_Count() {
		return item_Count;
	}

	public void setItem_Count(Integer item_Count) {
		this.item_Count = item_Count;
	}

	public Integer getCur_Page() {
		return cur_Page;
	}

	public void setCur_Page(Integer cur_Page) {
		this.cur_Page = cur_Page;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNexts() {
		return nexts;
	}

	public void setNexts(boolean nexts) {
		this.nexts = nexts;
	}

	public Integer getStart_page() {
		return start_page;
	}

	public void setStart_page(Integer start_page) {
		this.start_page = start_page;
	}

	public Integer getEnd_page() {
		return end_page;
	}

	public void setEnd_page(Integer end_page) {
		this.end_page = end_page;
	}
}

