//회원가입버튼
$(function gosignup() {
	$("#goSignupBtn").click(function(){
		location.href="signup";
	});
});

//아이디 중복확인
$(document).ready(function(){
	var regIdPw = /^[a-zA-Z0-9!@#$%^*+=-]{4,12}$/;
	
	$("#signupId").change(function(){
//		var uid = document.getElementById("signupId");
		var m_id = $(this).val();
		//빈 칸 체크 , 4자 이상 12자 이하 체크
		if (m_id != '') {
			if (!regIdPw.test(m_id)) {
			   //alert("아이디는 영문자 또는 영문자와 숫자 조합 4~12자여야 해요.22");
			   $("#ava").css("display", "none");
			   $("#over").css("display", "none");
			   $("#impo").css("display", "block");
			       $(this).focus();
			       return false;
			    }
		}
		var data = {
	            m_id : m_id
        }

		$.ajax({
			url : "/userIdCheck",
			type : "POST",
            data : data,
//            data : {"m_id" : uid},
            success : function(result) {
            	if (result != 'find') {
                    $("#ava").css("display", "block");
                    $("#over").css("display", "none");
                    $("#impo").css("display", "none");
                 } else {
                	console.log(result);
                    $("#over").css("display", "block");
                    $("#ava").css("display", "none");
                    $("#impo").css("display", "none");
                 }
            }
		})
	})
});

// 유효성 검사 메서드
function Validation() {
    //변수에 저장
	var uid = document.getElementById("signupId")
    var pw = document.getElementById("signupPw")
    var pwchk = document.getElementById("signupPwchk")
    var nickname = document.getElementById("signupNickname")
    var phone = document.getElementById("signupPhone")
    var email = document.getElementById("signupEmail")
    var arr1 = document.getElementById("arr1")
    var arr2 = document.getElementById("arr2")
    var arr3 = document.getElementById("arr3")

    // 정규식
    // id, pw
    var regIdPw = /^[a-zA-Z0-9!@#$%^*+=-]{4,12}$/;
    // 이름
    var regName = /^[가-힣a-zA-Z0-9]{2,15}$/;
    // 이메일
    var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    // 전화번호
    var regPhone= /^\d{2,3}-?\d{3,4}-?\d{4}$/;
    
    //아이디 확인
    if(uid.value == ""){
        alert("아이디를 입력하세요.")
        uid.focus();
        return false;
    }
    //아이디 영어 대소문자 확인
    else if(!regIdPw.test(uid.value)){
        alert("아이디는 4~12자 영문 대소문자, 숫자만 입력하세요.")
        uid.focus();
        return false;
    }

    //비밀번호 확인
    if(pw.value == ""){
        alert("비밀번호를 입력하세요.")
        pw.focus();
        return false;
    }
    //비밀번호 영어 대소문자 확인
    else if(!regIdPw.test(pw.value)){
        alert("비밀번호는 4~12자 영문 대소문자, 숫자만 입력하세요.")
        pw.focus();
        return false;
    }
    //비밀번호와 아이디 비교
    else if(pw.value == uid.value){
        alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
        pw.focus();
        return false;
    }


    //비밀번호 확인
    if(pwchk.value !== pw.value){
        alert("비밀번호와 동일하지 않습니다.")
        pwchk.focus();
        return false;
    }


    //이름 확인 = 한글과 영어만 가능하도록
    if(nickname.value == ""){
        alert("이름을 입력하세요.")
        nickname.focus();
        return false;
    }

    else if(!regName.test(nickname.value)){
        alert("최소 2글자 이상, 한글과 영어만 입력하세요.")
        nickname.focus();
        return false;
    }
    //전화번호 확인 = 숫자만 가능하도록
    if(phone.value == ""){
        alert("전화번호를 입력하세요.")
        phone.focus();
        return false;
    }
    else if(!regPhone.test(phone.value)){
        alert("잘못된 전화번호 형식입니다.")
        phone.focus();
        return false;
    }
    
    //메일주소 확인
    if(email.value.length == 0){
    	alert("메일주소를 입력하세요.")
    	email.focus();
    	return false;
    }
    
    else if(!regEmail.test(email.value)){
    	alert("잘못된 이메일 형식입니다.")
    	email.focus();
    	return false;
    }
 
    //주소 확인
    if(addr1.value == ""){
        alert("주소를 입력하세요.")
        addr1.focus();
        return false;
    }
    if(addr2.value == ""){
        alert("주소를 입력하세요.")
        addr2.focus();
        return false;
    }
    if(addr3.value == ""){
        alert("상세 주소를 입력하세요.")
        addr3.focus();
        return false;
    }
    if ($('#signupId').attr("check_result") == "fail"){
        alert("아이디 중복체크를 해주시기 바랍니다.");
        $('#signupId').focus();
        return false;
      }
    // 유효성 문제 없을 시 폼에 submit
    document.joinForm.submit();
}
