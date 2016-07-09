package com.mommefatale.wish.model;

public class WishVO {
	private Integer wish_no;
	private String user_id;
	private Integer item_no;
	private String item_name;
	private Integer item_category;
	private Integer item_discount;
	private	String item_size;
	private Integer wish_count;
	private	String main_img;
	private String wish_regdate;
	private Integer saving;
	private Integer fee;
	
	
	public Integer getSaving() {
		return saving;
	}
	public void setSaving(Integer saving) {
		this.saving = saving;
	}
	public Integer getFee() {
		return fee;
	}
	public void setFee(Integer fee) {
		this.fee = fee;
	}
	public String getWish_regdate() {
		return wish_regdate;
	}
	public void setWish_regdate(String wish_regdate) {
		this.wish_regdate = wish_regdate;
	}
	public Integer getWish_no() {
		return wish_no;
	}
	public void setWish_no(Integer wish_no) {
		this.wish_no = wish_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Integer getItem_no() {
		return item_no;
	}
	public void setItem_no(Integer item_no) {
		this.item_no = item_no;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public Integer getItem_category() {
		return item_category;
	}
	public void setItem_category(Integer item_category) {
		this.item_category = item_category;
	}
	public Integer getItem_discount() {
		return item_discount;
	}
	public void setItem_discount(Integer item_discount) {
		this.item_discount = item_discount;
	}
	public String getItem_size() {
		return item_size;
	}
	public void setItem_size(String item_size) {
		this.item_size = item_size;
	}
	public Integer getWish_count() {
		return wish_count;
	}
	public void setWish_count(Integer wish_count) {
		this.wish_count = wish_count;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	
}
