package com.o.e.lesson;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.o.e.member.MemberDAO;

@Controller
public class ReviewController {

	@Autowired
	private LessonDAO lDAO;
	
	@Autowired
	private ReviewDAO rDAO;
	
	@Autowired
	private MemberDAO mDAO;
	
	// 리뷰 작성 페이지
	@RequestMapping(value = "/writeReview", method = RequestMethod.GET)
	public String review(int l_num, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}
		lDAO.getDetail(l_num, req);

		return "review/writeReview";
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
	
	// 리뷰 리스트
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String getReview(int l_num, HttpServletRequest req) {
		if (req.getParameter("p") != null) {
			int p = Integer.parseInt(req.getParameter("p"));
			rDAO.getReivews(p, l_num, req);
		} else {
			rDAO.getReivews(1, l_num, req);
		}

		return "review/review";
	}
	
	@RequestMapping(value = "/review_paging", method = RequestMethod.GET)
	public String paging(int l_num, HttpServletRequest req) {
		if (req.getParameter("p") != null) {
			int p = Integer.parseInt(req.getParameter("p"));
			rDAO.getReivews(p, l_num, req);
		} else {
			rDAO.getReivews(1, l_num, req);
		}

		return "review/review";
	}
	
	@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET)
	public @ResponseBody Review reviewDetail(@RequestParam("r_num") int r_num) {
		
		return rDAO.reviewDetail(r_num);
	}
}
