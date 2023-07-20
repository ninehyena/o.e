package com.o.e.lesson;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.o.e.member.MemberDAO;

@Controller
public class ReviewController {

	@Autowired
	LessonDAO lDAO;
	
	@Autowired
	ReviewDAO rDAO;
	
	@Autowired
	MemberDAO mDAO;
	
	// 리뷰 작성 페이지
	@RequestMapping(value = "/writeReview", method = RequestMethod.GET)
	public String review(int l_num, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}
		lDAO.getDetail(l_num, req);

		return "lesson/writeReview";
	}

	// 리뷰 작성
	@RequestMapping(value = "/writeReview", method = RequestMethod.POST)
	public String writeReview(Review r, int l_num, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}
		rDAO.writeReview(r, l_num, req);

		return "redirect:/lessonDetail?l_num=" + l_num;
	}
}
