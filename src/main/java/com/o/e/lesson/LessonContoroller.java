package com.o.e.lesson;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.o.e.TokenManager;
import com.o.e.comment.Comment;
import com.o.e.comment.CommentDAO;
import com.o.e.member.MemberDAO;

@Controller
public class LessonContoroller {

	@Autowired
	private LessonDAO lDAO;

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private ReviewDAO rDAO;

	@Autowired
	private CommentDAO cDAO;

	// 레슨 목록에 처음 접근
	@RequestMapping(value = "lesson", method = RequestMethod.GET)
	public String lesson(HttpServletRequest req) {
		lDAO.clearSearch(req);
		lDAO.countLessons(req);
		if (req.getParameter("p") != null) {
			int p = Integer.parseInt(req.getParameter("p"));
			lDAO.getAllList(p, req);
		} else {
			lDAO.getAllList(1, req);
		}

		return "lesson/lesson";
	}

	// 레슨 목록 페이징
	@RequestMapping(value = "/lesson_paging", method = RequestMethod.GET)
	public String paging(HttpServletRequest req) {
		if (req.getParameter("p") != null) {
			int p = Integer.parseInt(req.getParameter("p"));
			lDAO.getAllList(p, req);
		} else {
			lDAO.getAllList(1, req);
		}
		 System.out.println("세션에 있는 검색어 : " +
		 req.getSession().getAttribute("type") +
		 req.getSession().getAttribute("search"));

		return "lesson/lesson";
	}

	// 목록 타입 선택
	@RequestMapping(value = "/lesson_search", method = RequestMethod.GET)
	public String lessonSearch(HttpServletRequest req) {
		lDAO.searchMsg(req);
		lDAO.getAllList(1, req);

		return "lesson/lesson";
	}

	// 레슨 등록 페이지 이동
	@RequestMapping(value = "regLesson", method = RequestMethod.GET)
	public String goRegLesson(HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}

		return "lesson/regLesson";
	}

	// 레슨 등록
	@RequestMapping(value = "regLesson", method = RequestMethod.POST)
	public String regLesson(Lesson l, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}

		lDAO.regLesson(l, req);

		return "lesson/regLessonDetail2";
	}

	// 레슨 상세 정보 등록
	@RequestMapping(value = "regLessonDetail", method = RequestMethod.POST)
	public String regLessonDetail(LessonDetail ld, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}

		lDAO.regLessonDetail(ld, req);

		return "redirect:/lesson";
	}

	// 레슨 상세보기
	@RequestMapping(value = "lessonDetail", method = RequestMethod.GET)
	public String lessonDetail(int l_num, HttpServletRequest req) {
		lDAO.getDetail(l_num, req);
		rDAO.check(l_num, req);
		rDAO.getAvg(l_num, req);
		cDAO.countCmts(req);
		TokenManager.make(req);

		if (req.getParameter("p") != null) {
			int p = Integer.parseInt(req.getParameter("p"));
			rDAO.getReivews(p, l_num, req);
			cDAO.getAllCmt(p, l_num, req);
		} else {
			rDAO.getReivews(1, l_num, req);
			cDAO.getAllCmt(1, l_num, req);
		}

		return "lesson/detail2";
	}

	// 레슨 신청하기
	@RequestMapping(value = "applyLesson", method = RequestMethod.GET)
	public String applyLesson(int l_num, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/lessonDetail?l_num=" + l_num;
		}

		lDAO.apply(l_num, req);

		return "redirect:/lessonDetail?l_num=" + l_num;
	}

	// 레슨 신청 취소
	@RequestMapping(value = "/cancelApplication", method = RequestMethod.GET)
	public String cancel(int l_num, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/lessonDetail?l_num=" + l_num;
		}

		lDAO.cancel(l_num, req);

		return "redirect:/lessonDetail?l_num=" + l_num;
	}

	// 레슨 수정
	@RequestMapping(value = "/updateLesson", method = RequestMethod.GET)
	public String update(int l_num, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/lessonDetail?l_num=" + l_num;
		}

		lDAO.getDetail(l_num, req);

		return "lesson/updateLesson";
	}

	@RequestMapping(value = "/updateLesson", method = RequestMethod.POST)
	public String goUpdate(Lesson l, LessonDetail ld, HttpServletRequest req) {
		int l_num = l.getL_num();
		if (!mDAO.loginCheck(req)) {
			return "redirect:/lessonDetail?l_num=" + l_num;
		}

		l_num = lDAO.update(l, ld, req);
		if (l_num == 0) {
			return "redirect:/lesson";
		}

		return "redirect:/lessonDetail?l_num=" + l_num;
	}

	// 레슨 삭제
	@RequestMapping(value = "/deleteLesson", method = RequestMethod.GET)
	public String delete(int l_num, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/lessonDetail?l_num=" + l_num;
		}
		
		lDAO.delete(l_num, req);

		return "redirect:/lesson";
	}

	// 나의 레슨
	@RequestMapping(value = "/myLesson", method = RequestMethod.GET)
	public String myLesson(HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}

		lDAO.countUserRegLessons(req);
		lDAO.countUserApplyLessons(req);

		if (req.getParameter("p") != null) {
			int p = Integer.parseInt(req.getParameter("p"));
			lDAO.getMyList(p, req);
		} else {
			lDAO.getMyList(1, req);
		}

		return "user/myLesson";
	}

	// 레슨 목록 페이징
	@RequestMapping(value = "/myLesson_paging", method = RequestMethod.GET)
	public String myLessonPaging(HttpServletRequest req) {
		if (req.getParameter("p") != null) {
			int p = Integer.parseInt(req.getParameter("p"));
			lDAO.getMyList(p, req);
			;
		} else {
			lDAO.getMyList(1, req);
		}
		return "user/myLesson";
	}

	// 신규 레슨 신청한 회원 정보 가져오기
	@RequestMapping(value = "/applicationDetail", method = RequestMethod.GET)
	public String applicationDetail(int l_num, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}

		if (req.getParameter("p") != null) {
			int p = Integer.parseInt(req.getParameter("p"));
			lDAO.getStudent(p, l_num, req);
		} else {
			lDAO.getStudent(1, l_num, req);
		}

		return "user/confirmApplication";
	}

	@RequestMapping(value = "/applicationDetail_paging", method = RequestMethod.GET)
	public String applicationDetail_paging(int l_num, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}

		if (req.getParameter("p") != null) {
			int p = Integer.parseInt(req.getParameter("p"));
			lDAO.getStudent(p, l_num, req);
		} else {
			lDAO.getStudent(1, l_num, req);
		}

		return "user/confirmApplication";
	}

	// 레슨 신청 대기 -> 진행
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public @ResponseBody int confirm(@RequestParam("l_num") int l_num, @RequestParam("a_id") String a_id,
			HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return 0;
		}

		System.out.println("현재 레슨의 번호 : " + l_num);
		System.out.println("수강생 아이디 : " + a_id);
		int cnt = lDAO.confirm(l_num, a_id);

		return cnt;
	}

	// 레슨 진행 -> 완료
	@RequestMapping(value = "/finish", method = RequestMethod.POST)
	public @ResponseBody int finish(@RequestParam("l_num") int l_num, @RequestParam("a_id") String a_id,
			HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return 0;
		}

		System.out.println("현재 레슨의 번호 : " + l_num);
		System.out.println("수강생 아이디 : " + a_id);
		int cnt = lDAO.finish(l_num, a_id);

		return cnt;
	}

	// 댓글 등록
	@RequestMapping(value = "/cmtWrite", method = RequestMethod.POST)
	public String regCmt(Comment cmt, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}

		TokenManager.make(req);
		cDAO.regCmt(cmt, req);

		int l_num = Integer.parseInt(req.getParameter("l_num"));
		return lessonDetail(l_num, req);
	}

	// 대댓글 등록
	@RequestMapping(value = "/cmtCmtWrite", method = RequestMethod.POST)
	public String regCmtCmt(Comment cmt, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}

		TokenManager.make(req);
		cDAO.regCmt(cmt, req);

		int l_num = Integer.parseInt(req.getParameter("l_num"));
		return lessonDetail(l_num, req);
	}

	// 댓글 페이징
	@RequestMapping(value = "/cmt_paging", method = RequestMethod.GET)
	public String getCmtPage(HttpServletRequest req) {
		mDAO.loginCheck(req);
		int l_num = Integer.parseInt(req.getParameter("l_num"));
		if (req.getParameter("p") != null) {
			int p = Integer.parseInt(req.getParameter("p"));
			cDAO.getAllCmt(p, l_num, req);
		} else {
			cDAO.getAllCmt(1, l_num, req);
		}

		return lessonDetail(l_num, req);
	}

	@RequestMapping(value = "/updateCmt", method = RequestMethod.POST)
	public @ResponseBody int goUpdateCmt(String c_content, int l_num, int c_num, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return 0;
		}

		return cDAO.updateCmt(l_num, c_num, c_content);
	}

	// 삭제
	@RequestMapping(value = "/deleteCmt", method = RequestMethod.GET)
	public String deleteCmt(int l_num, int c_num, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}

		cDAO.deleteCmt(l_num, c_num);

		return lessonDetail(l_num, req);
	}

	// 레슨 추천
	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	public String goLecommend(Lesson l, LessonDetail ld, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}

		return "lesson/recommendLesson";
	}
	
//	@RequestMapping(value = "/recommend", method = RequestMethod.POST)
//	public String recommend(Lesson l, LessonDetail ld, HttpServletRequest req) {
//		if (!mDAO.loginCheck(req)) {
//			return "redirect:/";
//		}
//		lDAO.recommendLesson(l, ld, req);
//
//		return "lesson/recommendLesson";
//	}
	
	@RequestMapping(value = "/recommend", method = RequestMethod.POST)
	public @ResponseBody List<Lesson> recommend(String l_location, String l_type, String l_category,
			String l_level, int l_pay_min, int l_pay_max, String l_day, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return null;
		}
		System.out.println(l_location);
		System.out.println(l_pay_min);
		

		return lDAO.recommendLesson(l_location, l_type, l_category, l_level, l_pay_min, l_pay_max, l_day, req);
	}
	
	@RequestMapping(value = "/popularLesson", method = RequestMethod.GET)
	public @ResponseBody List<Lesson> popularLesson(HttpServletRequest req) {
		
		return lDAO.jsonData();
	}
}
