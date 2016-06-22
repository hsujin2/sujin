package com.mommefatale.board.model;

public class Paging {
	private Integer w_size;
	private Integer p_size;
	private Integer writing_Count;
	private Integer cur_Page;

	public Paging() {
		super();
	}

	public void setPaging(Integer w_size, Integer p_size, Integer writing_Count, Integer cur_Page) {
		this.w_size = w_size;
		this.p_size = p_size;
		this.writing_Count = writing_Count;
		this.cur_Page = cur_Page;
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

	public Integer getWriting_count() {
		return writing_Count;
	}

	public void setWriting_count(Integer writing_Count) {
		this.writing_Count = writing_Count;
	}

	public Integer getCur_page() {
		return cur_Page;
	}

	public void setCur_page(Integer cur_Page) {
		this.cur_Page = cur_Page;
	}

}
