package com.o.e.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private SqlSession ss;
	
	//회원가입 약관 동의 페이지
	@RequestMapping(value = "/registerAgree", method = RequestMethod.GET)
	public String register(Member m, HttpServletRequest req) {
		
		return "user/registerAgree";
	}
	
	//회원가입페이지
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String Singup(Member m, HttpServletRequest req) {
		
		return "user/signup2";
	}
	
	//회원가입하기
	@RequestMapping(value = "/signup.reg", method = RequestMethod.POST)
	public String regSignup(Member m, HttpServletRequest req) {
		mDAO.regSignup(m, req);
		return "redirect:/";
	}
	
	//아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "/sigup/userIdCheck", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
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
			if (result == 0) {
				return "true";
			} else {
				return "false";
			}
		} catch (Exception e) {	
			e.printStackTrace();
		}
		return "false";
	}
	
	//이메일 중복 검사
	@ResponseBody
	@RequestMapping(value = "/sigup/userEmailCheck", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String userEmailCheck(String m_email) {
		int result;
		try {
			result = mDAO.userEmailCheck(m_email);
			System.out.println("이메일 중복 검사 결과: " + result);
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
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	public String mailCheck(String email) throws Exception {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return MailSendService.mailSend(email);
	}
	
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member m, HttpServletRequest req) {
		mDAO.login(m, req);
//		mDAO.cumulativeStudent(m.getM_id());
		return "redirect:/";
	}
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		mDAO.logout(req, res);
		session.invalidate();
		return "redirect:/";
	}

	//내정보 페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
	public String mypage(String m_id, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}
		return "user/mypage2";
	}
	
	//내정보 수정
	@RequestMapping(value = "/updateMypage", method = RequestMethod.POST)
	public String mypageUpdate(Member m, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}
		mDAO.mypageUpdate(m, req); 
		return "redirect:/";
	}
	
	//아이디 찾기 페이지
	@RequestMapping(value = "/idFind", method = RequestMethod.GET)
	public String idFind() {
		return "user/idFind";
	}
	//아이디 찾기 기능
//	@RequestMapping(value = "/idFind.do", method = RequestMethod.GET)
//	public String goIdFind(String m_email, HttpServletRequest req) {
//		mDAO.searchUserId(m_email, req);
//		return "user/idFind";
//	}
	
	@RequestMapping(value = "/idFind.do", method = RequestMethod.GET)
	public @ResponseBody String goIdFind(String m_email, HttpServletRequest req) {
		// System.out.println(m_email);
		String id = mDAO.searchUserId(m_email, req);
		System.out.println(id);
		return id;
	}
	
	
	//패스워드 찾기 페이지
	@RequestMapping(value = "/pwFind", method = RequestMethod.GET)
	public String pwFind() {
		return "user/pwFind";
	}
	//패스워드 찾기 기능
//	@ResponseBody
//	@RequestMapping(value = "/pwFind.do", method = RequestMethod.POST)
//	public void goPwFind(Member m, HttpServletRequest req, HttpServletResponse res) throws Exception {
////		mDAO.searchUserPw(m,req,res);
//		res.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = res.getWriter();
//		MemberMapper mm = ss.getMapper(MemberMapper.class);
//		try {
//			if (mDAO.userIdCheck(m.getM_id()) == 0) {
//				out.println("아이디가 없습니다.");
//				out.flush();
//				out.close();
//			} else if (mDAO.userEmailCheck(m.getM_email()) == 0) {
//				out.print("이메일이 없습니다.");
//				out.flush();
//				out.close();
//			} else {
//				// 임시 비밀번호 생성
//				String pw = "";
//				for (int i = 0; i < 12; i++) {
//					pw += (char) ((Math.random() * 26) + 97);
//				}
//				m.setM_pw(pw);
//				// 비밀번호 변경
//				mm.updateUserPw(m);
//				// 비밀번호 변경 메일 발송
//				MailSendService.sendEmail(m);
//				out.print("이메일 발송");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	@ResponseBody
	@RequestMapping(value = "/pwFind.do", method = RequestMethod.POST)
	public void goPwFind(String m_id, String m_email, Member m, HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("비번 찾기(아이디) : " + m_id);
		System.out.println("비번 찾기(이메일) : " + m_email);

		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		try {
			if (mDAO.userIdCheck(m.getM_id()) == 0) {
				out.print("아이디가 없습니다.");
			} else if (mDAO.userEmailCheck(m.getM_email()) == 0) {
				out.print("이메일이 없습니다.");
			} else if (mm.searchUserPw(m) != null){
				// 임시 비밀번호 생성
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				m.setM_pw(pw);
				System.out.println("변경된 비밀번호 : " + m.getM_pw());
				// 비밀번호 변경
				mm.updateUserPw(m);
				// 비밀번호 변경 메일 발송
				MailSendService.sendEmail(m);
				out.print("이메일 발송");
			} else {
				out.print("아이디&이메일 불일치");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원탈퇴
	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String deleteMember(HttpServletRequest req, HttpServletResponse res) {
		mDAO.deleteMember(req, res);
		return "redirect:/";
	}
}
