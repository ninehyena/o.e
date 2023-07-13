package com.o.e.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		//아이디 중복체크
		//mDAO.
		return "redirect:/";
	}
	
	//아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "/userIdCheck", method = RequestMethod.POST)
	public String userIdCheck(String m_id) throws Exception {

		System.out.println("아이디 중복 검사");

	int result = mDAO.userIdCheck(m_id);

		System.out.println("아이디 중복 검사 결과: " + result);

	if (result != 0) {
		return "find";
	} else {
		return "available";
		}
	}
}
