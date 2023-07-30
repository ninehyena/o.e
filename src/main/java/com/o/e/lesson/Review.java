package com.o.e.lesson;

import java.util.Date;

public class Review {
	private int r_num;
	private int l_num;
	private String a_id;
	private int r_star;
	private int r_level;
	private int r_recommend;
	private String r_content;
	private Date r_regdate;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int r_num, int l_num, String a_id, int r_star, int r_level, int r_recommend, String r_content,
			Date r_regdate) {
		super();
		this.r_num = r_num;
		this.l_num = l_num;
		this.a_id = a_id;
		this.r_star = r_star;
		this.r_level = r_level;
		this.r_recommend = r_recommend;
		this.r_content = r_content;
		this.r_regdate = r_regdate;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public int getL_num() {
		return l_num;
	}

	public void setL_num(int l_num) {
		this.l_num = l_num;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public int getR_star() {
		return r_star;
	}

	public void setR_star(int r_star) {
		this.r_star = r_star;
	}

	public int getR_level() {
		return r_level;
	}

	public void setR_level(int r_level) {
		this.r_level = r_level;
	}

	public int getR_recommend() {
		return r_recommend;
	}

	public void setR_recommend(int r_recommend) {
		this.r_recommend = r_recommend;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Date getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}

	
	
}
