package com.o.e.lesson;

import java.util.Date;

public class ApplicationList {
	private int l_num;
	private String a_id;
	private int a_status;
	private Date a_date;
	private int cnt; // 신규 신청 count
	
	private Lesson lesson; 
	
	
	
	public Lesson getLesson() {
		return lesson;
	}

	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public ApplicationList() {
		// TODO Auto-generated constructor stub
	}

	public ApplicationList(int l_num, String a_id, int a_status, Date a_date) {
		super();
		this.l_num = l_num;
		this.a_id = a_id;
		this.a_status = a_status;
		this.a_date = a_date;
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

	public int getA_status() {
		return a_status;
	}

	public void setA_status(int a_status) {
		this.a_status = a_status;
	}

	public Date getA_date() {
		return a_date;
	}

	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}

}
