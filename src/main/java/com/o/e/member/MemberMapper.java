package com.o.e.member;

public interface MemberMapper {
	
	//회원가입
	public abstract int regSignup(Member m);
	
	public int userIdCheck(String m_id); // 아이디 중복 검사.
}
