package com.o.e.schedule;

import java.util.Date;

public class Schedule {
	private String m_id;
	private String a_id;
	private String s_title;
	private Date s_start;
	private Date s_end;
	
	public Schedule() {
		// TODO Auto-generated constructor stub
	}

	public Schedule(String m_id, String a_id, String s_title, Date s_start, Date s_end) {
		super();
		this.m_id = m_id;
		this.a_id = a_id;
		this.s_title = s_title;
		this.s_start = s_start;
		this.s_end = s_end;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getS_title() {
		return s_title;
	}

	public void setS_title(String s_title) {
		this.s_title = s_title;
	}

	public Date getS_start() {
		return s_start;
	}

	public void setS_start(Date s_start) {
		this.s_start = s_start;
	}

	public Date getS_end() {
		return s_end;
	}

	public void setS_end(Date s_end) {
		this.s_end = s_end;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	
	
}
