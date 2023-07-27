package com.o.e.member;

public interface MemberMapper {
	
	//회원가입
	public abstract int regSignup(Member m);
	
	public int userIdCheck(String m_id) throws Exception; // 아이디 중복 검사.
	public int userNameCheck(String m_nickname) throws Exception; // 아이디 중복 검사.
	public int mailCheck(String m_email) throws Exception; // 아이디 중복 검사.
	
	//로그인
	public abstract Member login(Member m);
	
	//마이페이지 회원 정보 수정
	public abstract int mypageUpdate(Member m);
	
}
