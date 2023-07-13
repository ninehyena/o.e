package com.o.e.member;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private MailSendService mailService;
	
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
	@RequestMapping(value = "/signup/userIdCheck", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String userIdCheck(String m_id) {
		int result;
		try {
			result = mDAO.userIdCheck(m_id);
			System.out.println("아이디 중복 검사 결과: " + result);
			if (result != 0) {
				return "find";
			} else {
				return "available";
			}
		} catch (Exception e) {	
			e.printStackTrace();
		}
		return "available";
	}
	
	//이름 중복 검사
	@ResponseBody
	@RequestMapping(value = "/signup/userNameCheck", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String userNameCheck(String m_nickname) {
		int result;
		try {
			result = mDAO.userNameCheck(m_nickname);
			System.out.println("이름 중복 검사 결과: " + result);
			if (result != 0) {
				return "find";
			} else {
				return "available";
			}
		} catch (Exception e) {	
			e.printStackTrace();
		}
		return "available";
	}
	
	//이메일 인증하기
		@ResponseBody
		@RequestMapping(value = "/signup/mailCheck", method = RequestMethod.GET)
		public String mailCheck(String email) {
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			return mailService.joinEmail(email);
		}
	
	

}
