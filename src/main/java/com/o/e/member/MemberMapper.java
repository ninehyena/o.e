package com.o.e.member;

public interface MemberMapper {
	
	//회원가입
	public abstract int regSignup(Member m);
	
	public int userIdCheck(String m_id) throws Exception; // 아이디 중복 검사.
	public int userNameCheck(String m_nickname) throws Exception; // 아이디 중복 검사.
	public int userEmailCheck(String m_email) throws Exception; // 이메일 중복 검사.
	
	//로그인
	public abstract Member login(Member m);
	//인증뱃지를 위한 수업당 누적 학생수
	public int cumulativeStudent(String m_id);
	//카카오 로그인(이메일 로그인)
	public abstract Member kakaoLogin(String m_email);
	
	//마이페이지 회원 정보 수정
	public abstract int mypageUpdate(Member m);
	
	//아이디 찾기
	public abstract Member searchUserId(String m_email);
	//비밀번호 찾기
	public abstract Member searchUserPw(String m_id);
	//임시비밀번호로 수정
	public abstract void updateUserPw(Member m);
	
	//회원 탈퇴
	public abstract int deleteMember(String m_id);
}
