package com.o.e.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO mDAO;
	//회원가입페이지
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String Singup(Member m, HttpServletRequest req) {
		return "user/signup";
	}
	
	//회원가입하기
	@RequestMapping(value = "/signup.reg", method = RequestMethod.POST)
	public String regSignup(Member m, HttpServletRequest req) {
		mDAO.regSignup(m, req);
//		mDAO.loginCheck(req);
		return "redirect:/";
	}
}
