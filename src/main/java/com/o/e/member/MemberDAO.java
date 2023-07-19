package com.o.e.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberDAO {
	// DB연결
	@Autowired
	private SqlSession ss;

	// 로그인 확인
	public boolean loginCheck(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		if (m != null) {
			// 로그인 성공 or 로그인 상태 유지 시
			return true;
		}
		// 로그인 상태가 아니거나 로그인 실패 시
		return false;
	}

	// 회원가입 ( 저장)
	public void regSignup(Member m, HttpServletRequest req) {
		try {
			MemberMapper mm = ss.getMapper(MemberMapper.class);
			System.out.println(mm);

			if (mm.regSignup(m) == 1) {
				System.out.println("회원가입 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 실패");

		}
	}

	// 아이디 중복 검사
	public int userIdCheck(String m_id) throws Exception {
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		return mm.userIdCheck(m_id);
	}

	// 이름 중복 검사
	public int userNameCheck(String m_nickname) throws Exception {
		MemberMapper mm = ss.getMapper(MemberMapper.class);
		return mm.userNameCheck(m_nickname);
	}

	// 로그인
	public void login(Member m, HttpServletRequest req) {
		try {
			req.setCharacterEncoding("EUC-KR");
			String id = req.getParameter("m_id");
			System.out.println("id값:" + id);// 입력 확인용
			String pw = req.getParameter("m_pw");
			System.out.println("pw값:" + pw);// 입력 확인용

			MemberMapper mm = ss.getMapper(MemberMapper.class);
			// 로그인 회원의 정보가 있다면
			if (mm.login(m) != null) {
				// 입력한 pw와 회원가입한 pw가 같다면
				if ((mm.login(m).getM_pw()).equals(pw)) {
					req.getSession().setAttribute("loginMember", mm.login(m));
					req.getSession().setMaxInactiveInterval(600); // 10분

//						Cookie c = new Cookie("lastLoginId", id);
//						c.setMaxAge(60 * 60 * 24 * 5);
//						res.addCookie(c);
					System.out.println("로그인 성공");
				} else {
					System.out.println("로그인 실패/pw 오류");
				}
			} else {
				System.out.println("로그인 실패/미가입 ID");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 실패/DB 통신 오류");
		}
	}

	// 로그아웃
	public void logout(HttpServletRequest req) {
		// 해당 회원에 대한 session만 null로
		req.getSession().setAttribute("loginMember", null);
		System.out.println("로그아웃 성공");
	}

	// 회원 정보 수정
	public void mypageUpdate(Member m, HttpServletRequest req) {
		try {
			MemberMapper mm = ss.getMapper(MemberMapper.class);
			if (mm.mypageUpdate(m) == 1) {
				System.out.println("글 수정 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("글 수정 실패");
		}
	}
}
