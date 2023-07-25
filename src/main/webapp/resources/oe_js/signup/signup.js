//회원가입 버튼
$(function gosignup() {
	$("#goSignupBtn").click(function(){
		location.href="signup";
	});
});
//약관동의 페이지 버튼
$(function gosignup() {
	$("#goRegisterBtn").click(function(){
		location.href="registerAgree";
	});
});
//로그아웃 버튼
$(function logout() {
	$("#logoutBtn").click(function(){
		location.href="logout";
	});
});
//페이지 로딩과 동시에 실행되는 함수
$(document).ready(function(){
	$('#signupEmailChkBtn').attr('disabled',true); //인증번호 발송 버튼 비활성화
	
//	function Validation() {
//		// 변수에 저장
//		var m_id = document.getElementById("signupId")
//		console.log(m_id);
//		//아이디 확인
//		if(m_id.value == "tt"){
//			alert("아이디를 입력하세요.")
//			uid.focus();
//			return false;
//		}
//		// 유효성 문제 없을 시 폼에 submit
//		//return true;
//		return false;
//	}
});
	
var isIdChecked = false; // id 중복체크 확인
var isPwChecked = false; // pw 확인
var isPwChecked2 = false; // pwChk 확인
var isNameChecked = false; // 이름 중복체크 확인
var isPhoneChecked = false; //전화번호 양식 확인
var isEmailChecked = false; // email 중복체크 확인
// 아이디 중복확인
$(function(){

	var regIdPw = /^[a-zA-Z0-9!@#$%^*+=-]{4,12}$/;
	
	$("#signupId").change(function(){
		isIdChecked = false; // 변경되면 확인 풀리게
		var m_id = $(this).val();
		// 빈 칸 체크 , 4자 이상 12자 이하 체크
		if (m_id.length == 0 || m_id != '') {
			if (!regIdPw.test(m_id)) {
			   // alert("아이디는 영문자 또는 영문자와 숫자 조합 4~12자여야 해요.22");
			   $("#idAva").css("display", "none");
			   $("#idOver").css("display", "none");
			   $("#idImpo").css("display", "block");
			       return false;
			    }
		}
		var data = {
	            m_id : m_id
        }
		$.ajax({
			url : "/e/signup/userIdCheck",
			type : "POST",
            data : data,
            success : function(result) {
            	if (result != 'find') {
                    $("#idAva").css("display", "block");
                    $("#idOver").css("display", "none");
                    $("#idImpo").css("display", "none");
                    isIdChecked = true;
                 } else {
                    $("#idOver").css("display", "block");
                    $("#idAva").css("display", "none");
                    $("#idImpo").css("display", "none");
                    isIdChecked = false;
                 }
            },error : function(req,status,err){
				console.log(req);
			}
		})
	});
	
	//비밀번호 체크
	$("#signupPw").change(function(){
		isPwChecked = false; // 변경되면 확인 풀리게
		var pw = $("#signupPw").val();
		var m_id = $("#signupId").val();
		// 빈 칸 체크 , 4자 이상 12자 이하 체크
		if (pw.length == 0 || pw != '') {
			if (!regIdPw.test(pw)) {
				$("#pwAva").css("display", "none");
				$("#pwImpo").css("display", "block");
				$("#pwOver").css("display", "none");
			}
			// id랑 pw 같으면 사용 불가능
			else if(pw === m_id){
				$("#pwAva").css("display", "none");
				$("#pwImpo").css("display", "none");
				$("#pwOver").css("display", "block");
			} 
			else {
				$("#pwAva").css("display", "block");
				$("#pwImpo").css("display", "none");
				$("#pwOver").css("display", "none");
				isPwChecked = true;
			}
		}
	});
	
	// 비밀번호 확인 체크
	$("#signupPwchk").change(function(){
		isPwChecked2 = false;
		var pw = $("#signupPw").val();
		var pwchk = $("#signupPwchk").val();
		if (pwchk.length == 0 || pwchk != '') {
			$("#pwchkImpo").css("display", "block");
			if(pwchk!= pw){
				$("#pwchkOver").css("display", "block");
				$("#pwchkAva").css("display", "none");
		        $("#pwchkImpo").css("display", "none");
		    } else if(pwchk === pw) {
		    	$("#pwchkOver").css("display", "none");
		    	$("#pwchkAva").css("display", "block");
		        $("#pwchkImpo").css("display", "none");
		        isPwChecked2 = true;
		    } else {
		    	$("#pwchkOver").css("display", "none");
		    	$("#pwchkAva").css("display", "none");
		        $("#pwchkImpo").css("display", "block");
		    }
		}
	});
	
	// 이름(닉네임) 확인
	var regName = /^[가-힣a-zA-Z0-9]{2,15}$/;
	
	$("#signupNickname").change(function(){
		isNameChecked = false; // 변경되면 확인 풀리게
		var m_nickname = $(this).val();
		// 빈 칸 체크 , 4자 이상 12자 이하 체크
		if (m_nickname.length == 0 || m_nickname != '') {
			if (!regName.test(m_nickname)) {
			   // alert("아이디는 영문자 또는 영문자와 숫자 조합 4~12자여야 해요.22");
			   $("#nameAva").css("display", "none");
			   $("#nameOver").css("display", "none");
			   $("#nameImpo").css("display", "block");
			   }
		}
		var data = {
				m_nickname : m_nickname
        }
		$.ajax({
			url : "/e/signup/userNameCheck",
			type : "POST",
            data : data,
            success : function(result) {
            	if (result != 'find') {
                    $("#nameAva").css("display", "block");
                    $("#nameOver").css("display", "none");
                    $("#nameImpo").css("display", "none");
                    isNameChecked = true;
                 } else {
                    $("#nameOver").css("display", "block");
                    $("#nameAva").css("display", "none");
                    $("#nameImpo").css("display", "none");
                 }
            },error : function(req,status,err){
				console.log(req);
			}
		})
	});

	//이메일 양식 확인
	var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	$("#signupEmail").change(function(){
		var email = $('#signupEmail').val();
		if (email.length == 0 || email != '') {
			if (!regEmail.test(email)) {
				$("#emailAva").css("display", "none");
				$("#emailImpo").css("display", "block");
				$('#signupEmailChkBtn').attr('disabled',true); //인증번호 발송 버튼 비활성화
			} else {
				$("#emailAva").css("display", "block");
				$("#emailImpo").css("display", "none");
				$('#signupEmailChkBtn').attr('disabled',false); //인증번호 발송 버튼 활성화
			}
		}
	});
	// 이메일 인증
	$("#signupEmailChkBtn").click(function(){ // 인증번호 발송 버튼 클릭시
		var email = $('#signupEmail').val(); // 입력한 이메일 저장
		console.log('완성된 이메일 : ' + email); // 이메일 잘 가져오는지 확인
		
   	 	$.ajax({
			type : "GET",
			url :  "/e/signup/mailCheck?email="+email,
			success : function (data) {
				console.log("data : " +  data);
				code = data;
				alert('인증번호가 전송되었습니다.')
			}			,
			error: function(data){
				alert("메일 발송에 실패했습니다.");
			}
		}); // end ajax
	});// end send eamil
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('#emailChk').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#signupEmailChkBtn').attr('disabled',true); //인증번호 발송 버튼 비활성화
	        isEmailChecked = true;
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
			isEmailChecked = false;
		}
	});
});
	



// 유효성 검사 메서드
function Validation() {
//	event.preventDefault();
	// 변수에 저장
	var m_id = document.getElementById("signupId")
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
	// var regIdPw = /^[a-zA-Z0-9!@#$%^*+=-]{4,12}$/;
	// 이름
	// var regName = /^[가-힣a-zA-Z0-9]{2,15}$/;
	// 이메일
	//var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	// 전화번호
	var regPhone = /^[0-9]{9,11}$/;
	
	//아이디 확인
	if(m_id.value == ""){
		alert("아이디를 입력하세요.")
		m_id.focus();
		return false;
	}
	// id 중복확인 체크(isIdChecked가 true가 아닐 경우)
	if(isIdChecked == false){
		alert("이미 등록된 아이디 입니다.")
		m_id.focus();
		return false;
	}
	//비밀번호 확인
	if(pw.value == ""){
		alert("비밀번호를 입력하세요.")
		pw.focus();
		return false;
	}
	// pw 체크
	if(isPwChecked == false){
		alert("비밀번호를 확인 해주세요.")
		pw.focus();
		return false;
	}
	// pwchk 체크
	if(isPwChecked2 == false){
		alert("입력한 비밀번호와 일치하지 않습니다.")
		pwchk.focus();
		return false;
	}
	// 이름 확인 = 한글과 영어만 가능하도록
	if(nickname.value == ""){
		alert("이름을 입력하세요.")
		nickname.focus();
		return false;
	}
	// 이름 중복확인
	if(isNameChecked == false){
		alert("이미 등록된 이름입니다.")
		nickname.focus();
		return false;
	}
	// 전화번호 확인 = 숫자만 가능하도록
	if(phone.value == ""){
		alert("전화번호를 입력하세요.")
		phone.focus();
		return false;
	}
	if (!regPhone.test(phone.value)) {
		alert("전화번호 양식에 맞춰 작성해 주세요. <br> ex) 010 1234 5678")
		phone.focus();
		return false;
    }
	// 메일주소 확인
	if(email.value == ""){
		alert("메일주소를 입력하세요.")
		email.focus();
		return false;
	}
	// email 체크
	if(isEmailChecked == false){
		alert("이메일 인증을 진행 해주세요.")
		email.focus();
		return false;
	}
	// 주소 확인
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

	// 유효성 문제 없을 시 폼에 submit
	return true;
}
