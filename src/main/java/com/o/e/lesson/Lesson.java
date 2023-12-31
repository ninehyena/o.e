package com.o.e.lesson;

import java.util.Date;

import com.o.e.member.Member;

public class Lesson {
	private int l_num;
	private String l_type;
	private String l_category;
	private String l_teacher_id;
	private String l_level;
	private Date l_regdate;
	
	private LessonDetail lessonDetail;
	
	private ApplicationList applicationList;
	
	private Member member;

	public Lesson() {
		// TODO Auto-generated constructor stub
	}

	public Lesson(int l_num, String l_type, String l_category, String l_teacher_id, String l_level, Date l_regdate) {
		super();
		this.l_num = l_num;
		this.l_type = l_type;
		this.l_category = l_category;
		this.l_teacher_id = l_teacher_id;
		this.l_level = l_level;
		this.l_regdate = l_regdate;
	}

	public int getL_num() {
		return l_num;
	}

	public void setL_num(int l_num) {
		this.l_num = l_num;
	}

	public String getL_type() {
		return l_type;
	}

	public void setL_type(String l_type) {
		this.l_type = l_type;
	}

	public String getL_category() {
		return l_category;
	}

	public void setL_category(String l_category) {
		this.l_category = l_category;
	}

	public String getL_teacher_id() {
		return l_teacher_id;
	}

	public void setL_teacher_id(String l_teacher_id) {
		this.l_teacher_id = l_teacher_id;
	}

	public String getL_level() {
		return l_level;
	}

	public void setL_level(String l_level) {
		this.l_level = l_level;
	}

	public Date getL_regdate() {
		return l_regdate;
	}

	public void setL_regdate(Date l_regdate) {
		this.l_regdate = l_regdate;
	}
	
	public LessonDetail getLessonDetail() {
		return lessonDetail;
	}

	public void setLessonDetail(LessonDetail lessonDetail) {
		this.lessonDetail = lessonDetail;
	}

	public ApplicationList getApplicationList() {
		return applicationList;
	}

	public void setApplicationList(ApplicationList applicationList) {
		this.applicationList = applicationList;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	
}
