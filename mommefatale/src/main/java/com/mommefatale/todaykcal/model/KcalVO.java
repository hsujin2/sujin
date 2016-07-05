package com.mommefatale.todaykcal.model;

import java.util.Date;

public class KcalVO {

	private int kcal_no;
	private String member_id;
	private Date kcal_regdate;
	private int kcal_today;

	public int getKcal_no() {
		return kcal_no;
	}

	public void setKcal_no(int kcal_no) {
		this.kcal_no = kcal_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getKcal_regdate() {
		return kcal_regdate;
	}

	public void setKcal_regdate(Date kcal_regdate) {
		this.kcal_regdate = kcal_regdate;
	}

	public int getKcal_today() {
		return kcal_today;
	}

	public void setKcal_today(int kcal_today) {
		this.kcal_today = kcal_today;
	}

}
