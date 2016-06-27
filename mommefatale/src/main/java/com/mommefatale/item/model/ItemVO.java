package com.mommefatale.item.model;

import java.util.Date;

public class ItemVO {
	private int no;
	private String name;
	private String brand;
	private String origin;
	private String main_img;
	private String content_img;
	private int category;
	private int price_origin;
	private int price_sales;
	private int price_discount;
	private int sales_quantity;
	private int stock;
	private int view;
	private Date regdate;
	private Date update_date;
	private String option_size;
	private String color;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getContent_img() {
		return content_img;
	}
	public void setContent_img(String content_img) {
		this.content_img = content_img;
	}
	
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getPrice_origin() {
		return price_origin;
	}
	public void setPrice_origin(int price_origin) {
		this.price_origin = price_origin;
	}
	public int getPrice_sales() {
		return price_sales;
	}
	public void setPrice_sales(int price_sales) {
		this.price_sales = price_sales;
	}
	public int getPrice_discount() {
		return price_discount;
	}
	public void setPrice_discount(int price_discount) {
		this.price_discount = price_discount;
	}
	public int getSales_quantity() {
		return sales_quantity;
	}
	public void setSales_quantity(int sales_quantity) {
		this.sales_quantity = sales_quantity;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public String getOption_size() {
		return option_size;
	}
	public void setOption_size(String option_size) {
		this.option_size = option_size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}
