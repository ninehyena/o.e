package com.o.e.member;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class kakaoController {
	
	@Autowired
	public kakaoLoginService KakaoLogin;
	
	//카카오로그인 -> 자동 로그인
	@Autowired
	private MemberDAO mDAO;
	
	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	// 2번 받은 code를 iKakaoLogin.getAccessToken로 보냄 ###access_Token###로 찍어서 잘 나오면은 다음단계진행
	// 3번 받은 access_Token를 iKakaoLogin.getUserInfo로 보냄 userInfo받아옴, userInfo에 nickname, email정보가 담겨있음
	@RequestMapping(value="/kakaoLogin")
	public String login(@RequestParam("code") String code, HttpSession session, HttpServletRequest req) throws Throwable {
		// 1번
		System.out.println("code: " + code);
		// 2번
		String access_token = KakaoLogin.getAccessToken(code);
		System.out.println("access_token" + access_token);
		// 3번
		HashMap<String,Object> userInfo = KakaoLogin.getUserInfo(access_token);
		session.setAttribute("access_token", access_token);
		session.setAttribute("email", userInfo.get("email"));
		session.setAttribute("nickname", userInfo.get("nickname"));
		session.setMaxInactiveInterval(1); //1초
		
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		System.out.println("###userInfo#### : " + userInfo);
		
		String m_email = (String) userInfo.get("email");
		int result;
		try {
			result = mDAO.userEmailCheck(m_email);
			System.out.println("이메일 중복 검사 결과: " + result);
			if (result != 0) { //이메일이 있다면 로그인
				mDAO.kakaoLogin(m_email, req);
				return "redirect:/";
			} else { //없다면 회원가입 페이지
				return "user/signup";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
		// return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할거기 때문에 따로 return 값을 두지는 않았음
	}
	
	
	//카카오 로그아웃
	@RequestMapping(value="/kakaoLogout")
	public String logout(HttpServletRequest req, HttpServletResponse res) {
		try {
			HttpSession session = req.getSession(false); //세션이 없을때 생성하지 않기 위해 false

			KakaoLogin.unlink((String)session.getAttribute("access_token"));
			KakaoLogin.kakaoLogout((String)session.getAttribute("access_token"));
			
			if(session != null) {
				session.invalidate(); // 세션 무효화(삭제)
			}
			Cookie[] cookies = req.getCookies(); // 모든 쿠키의 정보를 cookies에 저장
			if(cookies != null){ // 쿠키가 한개라도 있으면 실행
				for(int i=0; i< cookies.length; i++){
				cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
				res.addCookie(cookies[i]); // 응답 헤더에 추가
				}
			}
			System.out.println("카카오 로그아웃");
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}

	//카카오 연결 끊기
	@RequestMapping(value="/kakaoUnlink")
	public String unlink(HttpSession session) {
		try {
			//세션에서 엑세스 토큰을 가져와서 unlink
			KakaoLogin.unlink((String)session.getAttribute("access_token"));
			session.invalidate(); //세션 삭제
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/";
	}
}
