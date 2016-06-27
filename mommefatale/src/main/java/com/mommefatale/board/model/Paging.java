package com.mommefatale.board.model;

public class Paging {
	private Integer w_size;
	private Integer p_size;
	private Integer writing_Count;
	private Integer cur_Page;
	private boolean prev;
	private boolean nexts;
	private Integer start_page;
	private Integer end_page;
	
	public Paging() {
		super();
	}

	public void setPaging(Integer w_size, Integer p_size, Integer writing_Count, Integer cur_Page) {
		this.w_size = w_size;
		this.p_size = p_size;
		this.writing_Count = writing_Count;
		this.cur_Page = cur_Page;
		prev = isPre();
		nexts = isNext();
		start_page = getPage_Start();
		end_page = getPage_End();
	}

	public Integer getPage_Count() {
		return (writing_Count / w_size) + (writing_Count % w_size > 0 ? 1 : 0);
	}

	public Integer getPage_Start() {
		return ((cur_Page - 1) / p_size) * p_size + 1;
	}

	public Integer getPage_End() {
		return Math.min(getPage_Start() + p_size - 1, getPage_Count());
	}

	public boolean isPre() {
		return getPage_Start() != 1;
	}

	public boolean isNext() {
		return getPage_End() < getPage_Count();
	}

	
	public Integer getWriting_Start() {

		return getWriting_End() - w_size + 1;
	}

	public Integer getWriting_End() {
		return cur_Page * w_size;
	}

	public Integer getW_size() {
		return w_size;
	}

	public void setW_size(Integer w_size) {
		this.w_size = w_size;
	}

	public Integer getP_size() {
		return p_size;
	}

	public void setP_size(Integer p_size) {
		this.p_size = p_size;
	}

	public Integer getWriting_Count() {
		return writing_Count;
	}

	public void setWriting_Count(Integer writing_Count) {
		this.writing_Count = writing_Count;
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
