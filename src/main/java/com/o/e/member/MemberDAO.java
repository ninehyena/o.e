package com.o.e.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.o.e.lesson.LessonMapper;

@Service
public class MemberDAO {
	//DB연결
	@Autowired
	private SqlSession ss;
	
	//회원가입 ( 저장)
	public void regSignup(Member m, HttpServletRequest req) {
		try {
			MemberMapper mm = ss.getMapper(MemberMapper.class);
			System.out.println(mm);
			
			if(mm.regSignup(m)==1) {
				System.out.println("회원가입 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 실패");
			
		}
	}
	
	//아이디 중복 검사
	public int userIdCheck(String m_id) throws Exception {
		MemberMapper mm = ss.getMapper(MemberMapper.class);
	    return mm.userIdCheck(m_id);
	   }
	//이름 중복 검사
	public int userNameCheck(String m_nickname) throws Exception {
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		return mm.userNameCheck(m_nickname);
	}
	//이메일 중복 검사
	public int userEmailCheck(String m_email) throws Exception {
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		return mm.userEmailCheck(m_email);
	}
	
	//인증 뱃지
	public int cumulativeStudent(String m_id) {
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		System.out.println("mm.cumulativeStudent(m_id) 값 : "+mm.cumulativeStudent(m_id));
		return mm.cumulativeStudent(m_id);
	}
	
	//로그인
	public void login(Member m, HttpServletRequest req) {
		try {
			req.setCharacterEncoding("EUC-KR");
			String id = req.getParameter("m_id"); 
			System.out.println("id값:"+id);//입력 확인용
			String pw = req.getParameter("m_pw"); 
			System.out.println("pw값:"+pw);//입력 확인용
			
			MemberMapper mm = ss.getMapper(MemberMapper.class);
			// 로그인 회원의 정보가 있다면
			if(mm.login(m) != null) {
				//입력한 pw와 회원가입한 pw가 같다면
				if((mm.login(m).getM_pw()).equals(pw)) {
					req.getSession().setAttribute("loginMember", mm.login(m));
					if((mm.login(m).getM_lesson()).equals("lesson")) {
						req.getSession().setAttribute("memberBadgeCheck", mm.cumulativeStudent(id));
					}
					req.getSession().setMaxInactiveInterval(600); //10분
					System.out.println("로그인 성공");
				}else {
					System.out.println("로그인 실패/pw 오류");
				}
			}else {
				System.out.println("로그인 실패/미가입 ID");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 실패/DB 통신 오류");
		}
	}
	
	//카카오 로그인
	public void kakaoLogin(String m_email, HttpServletRequest req) {
		try {
			System.out.println("m_email값:"+m_email);//입력 확인용
			
			MemberMapper mm = ss.getMapper(MemberMapper.class);
			// 로그인 회원의 정보가 있다면
			if(mm.kakaoLogin(m_email) != null) {
				req.getSession().setAttribute("loginMember", mm.kakaoLogin(m_email));
				req.getSession().setAttribute("memberBadgeCheck", mm.cumulativeStudent(mm.kakaoLogin(m_email).getM_id()));
				req.getSession().setMaxInactiveInterval(600); //10분
				System.out.println("카카오 로그인 성공");
			}else {
				System.out.println("카카오 로그인 실패/미가입 ID");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("카카오 로그인 실패/DB 통신 오류");
		}
	}

	//로그아웃
	public void logout(HttpServletRequest req, HttpServletResponse res) {
		//해당 회원에 대한 session만 null로
		req.getSession().setAttribute("loginMember", null);
		Cookie[] cookies = req.getCookies(); // 모든 쿠키의 정보를 cookies에 저장
		if(cookies != null){ // 쿠키가 한개라도 있으면 실행
			for(int i=0; i< cookies.length; i++){
			cookies[i].setMaxAge(0); // 유효시간을 0으로 설정
			res.addCookie(cookies[i]); // 응답 헤더에 추가
			}
		}
		System.out.println("로그아웃 성공");
	}
	
	//회원 정보 수정
	public void mypageUpdate(Member m, HttpServletRequest req) {
		try {
			MemberMapper mm = ss.getMapper(MemberMapper.class);
			if(mm.mypageUpdate(m)==1) {
				//수정한 값 다시 로그인세션(loginMember)에 담기
				req.getSession().setAttribute("loginMember", mm.login(m)); 
				req.getSession().setMaxInactiveInterval(600); //10분
				System.out.println("회원정보 수정 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원정보 수정 실패");
		}
	}
	
	// 로그인 확인
	public boolean loginCheck(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		if (m != null) {
			// 로그인 성공 or 로그인 상태 유지 시
			if (m.getM_lesson().equals("not_lesson")) {
				req.setAttribute("cnt", ss.getMapper(LessonMapper.class).noLesson(m.getM_id()));
			} else {
				if (ss.getMapper(LessonMapper.class).notRegLesson(m.getM_id()) == 1) {
					req.setAttribute("notRegLesson", 0);
					req.setAttribute("cnt", ss.getMapper(LessonMapper.class).countNewStu(m.getM_id()));
				} else {
					req.setAttribute("notRegLesson", 1);
				}
			}
			return true;
		}
		// 로그인 상태가 아니거나 로그인 실패 시
		return false;
	}
	
	//아이디 찾기
	public void searchUserId(String m_email, HttpServletRequest req) {
		System.out.println("m_email값:"+m_email);//입력 확인용
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		// 로그인 회원의 정보가 있다면
		if(mm.searchUserId(m_email) != null) {
			req.getSession().setAttribute("userId", mm.searchUserId(m_email).getM_id());
			req.getSession().setMaxInactiveInterval(1); //1초
		}
	}
	//비밀번호 변경
	public int update_pw(Member m) throws Exception{
		return ss.update("member.update_pw", m);
	}
	
	//회원탈퇴
	public void deleteMember(HttpServletRequest req, HttpServletResponse res) {
		try {
			MemberMapper mm = ss.getMapper(MemberMapper.class);
			Member m = (Member) req.getSession().getAttribute("loginMember");
			String m_id = m.getM_id();
			if(mm.deleteMember(m_id)==1) {
				System.out.println("회원탈퇴 성공");
				
				logout(req, res); //탈퇴하면 로그아웃(세션,쿠키 삭제)
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원탈퇴 실패");
		}
	}
	
}
