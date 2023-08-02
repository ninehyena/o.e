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
function kakaoLogout() {
	Swal.fire({
        title: '<h2 class="primary-color"><b>로그아웃 하시겠습니까?</b></h2>',
        showCancelButton: true,
        confirmButtonColor: '#FBB448',
        cancelButtonColor: '#d33',
        confirmButtonText: '로그아웃',
        cancelButtonText: '돌아가기'
    }).then((result) => {
        if (result.isConfirmed) {
        	location.href = "kakaoLogout";
        }
    });
};
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

