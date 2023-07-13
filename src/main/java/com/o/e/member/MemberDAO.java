package com.o.e.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
