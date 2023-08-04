package com.o.e.comment;

import java.util.Date;

import com.o.e.member.Member;

public class Comment {
	private int c_num;
	private int l_num;
	private String c_id;
	private String c_content;
	private Date c_regdate;
	private int c_indent;
	private int c_ansnum;
	
	private Member member;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(int c_num, int l_num, String c_id, String c_content, Date c_regdate, int c_indent, int c_ansnum) {
		super();
		this.c_num = c_num;
		this.l_num = l_num;
		this.c_id = c_id;
		this.c_content = c_content;
		this.c_regdate = c_regdate;
		this.c_indent = c_indent;
		this.c_ansnum = c_ansnum;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public int getL_num() {
		return l_num;
	}

	public void setL_num(int l_num) {
		this.l_num = l_num;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public Date getC_regdate() {
		return c_regdate;
	}

	public void setC_regdate(Date c_regdate) {
		this.c_regdate = c_regdate;
	}

	public int getC_indent() {
		return c_indent;
	}

	public void setC_indent(int c_indent) {
		this.c_indent = c_indent;
	}

	public int getC_ansnum() {
		return c_ansnum;
	}

	public void setC_ansnum(int c_ansnum) {
		this.c_ansnum = c_ansnum;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	

}
