package com.o.e.notice;

import java.math.BigDecimal;
import java.sql.Date;

public class Notice {
	BigDecimal n_no;
	String n_title;
	String n_content;
	Date n_regdate;
	Date n_updatedate;

	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(BigDecimal n_no, String n_title, String n_content, Date n_regdate, Date n_updatedate) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_regdate = n_regdate;
		this.n_updatedate = n_updatedate;
	}

	public BigDecimal getN_no() {
		return n_no;
	}

	public void setN_no(BigDecimal n_no) {
		this.n_no = n_no;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Date getN_regdate() {
		return n_regdate;
	}

	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}

	public Date getN_updatedate() {
		return n_updatedate;
	}

	public void setN_updatedate(Date n_updatedate) {
		this.n_updatedate = n_updatedate;
	}

}