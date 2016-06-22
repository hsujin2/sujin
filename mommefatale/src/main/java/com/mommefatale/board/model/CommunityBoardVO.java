package com.mommefatale.board.model;

import java.util.Date;

public class CommunityBoardVO {

	private int community_no;
	private String community_writer;
	private String community_subject;
	private String community_content;
	private Date community_regdate;
	private Date community_update_date;
	private int community_ref;
	private int community_step;
	private int community_depth;
	private String community_section;
	private int community_view;
	
	public int getCommunity_no() {
		return community_no;
	}
	public void setCommunity_no(int community_no) {
		this.community_no = community_no;
	}
	public String getCommunity_writer() {
		return community_writer;
	}
	public void setCommunity_writer(String community_writer) {
		this.community_writer = community_writer;
	}
	public String getCommunity_subject() {
		return community_subject;
	}
	public void setCommunity_subject(String community_subject) {
		this.community_subject = community_subject;
	}
	public String getCommunity_content() {
		return community_content;
	}
	public void setCommunity_content(String community_content) {
		this.community_content = community_content;
	}
	public Date getCommunity_regdate() {
		return community_regdate;
	}
	public void setCommunity_regdate(Date community_regdate) {
		this.community_regdate = community_regdate;
	}
	public Date getCommunity_update_date() {
		return community_update_date;
	}
	public void setCommunity_update_date(Date community_update_date) {
		this.community_update_date = community_update_date;
	}
	public int getCommunity_ref() {
		return community_ref;
	}
	public void setCommunity_ref(int community_ref) {
		this.community_ref = community_ref;
	}
	public int getCommunity_step() {
		return community_step;
	}
	public void setCommunity_step(int community_step) {
		this.community_step = community_step;
	}
	public int getCommunity_depth() {
		return community_depth;
	}
	public void setCommunity_depth(int community_depth) {
		this.community_depth = community_depth;
	}
	public String getCommunity_section() {
		return community_section;
	}
	public void setCommunity_section(String community_section) {
		this.community_section = community_section;
	}
	public int getCommunity_view() {
		return community_view;
	}
	public void setCommunity_view(int community_view) {
		this.community_view = community_view;
	}
	

}
