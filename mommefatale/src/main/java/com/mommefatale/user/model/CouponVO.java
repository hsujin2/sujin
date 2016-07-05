package com.mommefatale.user.model;

import java.util.Date;

public class CouponVO {
	private Integer coupon_no;
	private String name;
	private int amount;
	private Date issuedate;
	private Date exdate;
	
	public Integer getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(Integer coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getIssuedate() {
		return issuedate;
	}
	public void setIssuedate(Date issuedate) {
		this.issuedate = issuedate;
	}
	public Date getExdate() {
		return exdate;
	}
	public void setExdate(Date exdate) {
		this.exdate = exdate;
	}

	
	
}
