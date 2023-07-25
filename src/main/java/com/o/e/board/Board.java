package com.o.e.board;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class Board {
	BigDecimal b_no;
	String b_category;
	String b_title;
	String b_content;
	Date b_regdate;
	Date b_updatedate;
	private String b_poster;

	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(BigDecimal b_no, String b_category, String b_title, String b_content, Date b_regdate,
			Date b_updatedate, String b_poster) {
		super();
		this.b_no = b_no;
		this.b_category = b_category;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_regdate = b_regdate;
		this.b_updatedate = b_updatedate;
		this.b_poster = b_poster;
	}

	public BigDecimal getB_no() {
		return b_no;
	}

	public void setB_no(BigDecimal b_no) {
		this.b_no = b_no;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public Date getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}

	public Date getB_updatedate() {
		return b_updatedate;
	}

	public void setB_updatedate(Date b_updatedate) {
		this.b_updatedate = b_updatedate;
	}

	public String getB_poster() {
		return b_poster;
	}

	public void setB_poster(String b_poster) {
		this.b_poster = b_poster;
	}
}