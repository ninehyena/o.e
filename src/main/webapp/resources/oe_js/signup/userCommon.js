/**
 * 
 */
// 회원가입 버튼
$(function gosignup() {
	$("#goSignupBtn").click(function() {
		location.href = "signup";
	});
});
// 약관동의 페이지 버튼
$(function gosignup() {
	$("#goRegisterBtn").click(function() {
		location.href = "registerAgree";
	});
});
// 카카오 로그아웃 버튼
$(function kakaoLogout() {
	$("#kakaoLogoutBtn").click(function() {
		location.href = "kakaoLogout";

	});
});
//비밀번호 찾기
$(function goPwFind() {
	$("#findPw").click(function() {
		var m_id = $("#m_id").val();
		var m_email = $("#m_email").val();
		$.ajax({
			url : "/e/pwFind.do",
			type : "POST",
			data : {
				m_id : m_id,
				m_email : m_email
			},
			success : function(data) {
				alert(data);
			},
		})
	});
});

