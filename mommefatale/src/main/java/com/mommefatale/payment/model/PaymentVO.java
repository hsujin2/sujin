package com.mommefatale.payment.model;

import java.util.Date;

public class PaymentVO {
	private String order_id;
	private Integer item_no;
	private Integer total_price;
	private String state;
	private Date date;
	private String memo;
	private String zip;
	private String address1;
	private String address2;
	private String phone;
	private String receiver;
	private Integer coupon_no;
	private Integer delivery_fee;
	private	Integer point;
	private Integer quantity;
	private Integer order_no;
	private String pay_way;
	private String bank;
	
	
	
	public String getPay_way() {
		return pay_way;
	}
	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public Integer getItem_no() {
		return item_no;
	}
	public void setItem_no(Integer item_no) {
		this.item_no = item_no;
	}
	public Integer getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Integer total_price) {
		this.total_price = total_price;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public Integer getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(Integer coupon_no) {
		this.coupon_no = coupon_no;
	}
	public Integer getDelivery_fee() {
		return delivery_fee;
	}
	public void setDelivery_fee(Integer delivery_fee) {
		this.delivery_fee = delivery_fee;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getOrder_no() {
		return order_no;
	}
	public void setOrder_no(Integer order_no) {
		this.order_no = order_no;
	}
	
}
