package com.o.e;

<<<<<<< HEAD
=======
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

>>>>>>> refs/remotes/origin/sang
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.o.e.lesson.LessonDAO;
import com.o.e.member.MemberDAO;

@Controller
public class HomeController {
	
	@Autowired
	private LessonDAO lDAO;
	
	@Autowired
	private MemberDAO mDAO;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		mDAO.loginCheck(req);
		lDAO.countLessons(req);
		lDAO.needDatas(req);
		
		return "index";
	}
	
}
