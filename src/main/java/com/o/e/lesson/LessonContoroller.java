package com.o.e.lesson;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LessonContoroller {
	
	@Autowired
	LessonDAO lDAO;
	
	// 레슨 목록
	@RequestMapping(value = "lesson", method = RequestMethod.GET)
	public String lesson(HttpServletRequest req) {
		lDAO.getList(req);
		
		return "lesson/lesson";
	}
	
	// 레슨 등록 페이지 이동
	@RequestMapping(value = "regLesson", method = RequestMethod.GET)
	public String goRegLesson(HttpServletRequest req) {
		
		return "lesson/regLesson";
	}
	
	// 레슨 등록
	@RequestMapping(value = "regLesson", method = RequestMethod.POST)
	public String regLesson(Lesson l, HttpServletRequest req) {
		lDAO.regLesson(l, req);
		
		return "lesson/regLessonDetail";
	}
	
	// 레슨 상세 정보 등록
	@RequestMapping(value = "regLessonDetail", method = RequestMethod.POST)
	public String regLessonDetail(LessonDetail ld, HttpServletRequest req) {
		lDAO.regLessonDetaul(ld, req);
		
		return "redirect:/lesson";
	}
	
	// 레슨 상세보기
	@RequestMapping(value = "lessonDetail", method = RequestMethod.GET)
	public String lessonDetail(HttpServletRequest req) {
		
		return "lesson/detail";
	}
}
