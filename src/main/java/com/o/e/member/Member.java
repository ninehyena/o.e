package com.o.e.member;

import java.math.BigDecimal;

public class Member {
	private String m_id;
	private String m_pw;
	private String m_lesson;
	private String m_nickname;
	private BigDecimal m_phone;
	private String m_email;
	private String m_addr1;
	private String m_addr2;
	private String m_addr3;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String m_id, String m_pw, String m_lesson, String m_nickname, BigDecimal m_phone, String m_email,
			String m_addr1, String m_addr2, String m_addr3) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_lesson = m_lesson;
		this.m_nickname = m_nickname;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_addr1 = m_addr1;
		this.m_addr2 = m_addr2;
		this.m_addr3 = m_addr3;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_lesson() {
		return m_lesson;
	}

	public void setM_lesson(String m_lesson) {
		this.m_lesson = m_lesson;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public BigDecimal getM_phone() {
		return m_phone;
	}

	public void setM_phone(BigDecimal m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_addr1() {
		return m_addr1;
	}

	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}

	public String getM_addr2() {
		return m_addr2;
	}

	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}

	public String getM_addr3() {
		return m_addr3;
	}

	public void setM_addr3(String m_addr3) {
		this.m_addr3 = m_addr3;
	}
	
	
	
}
