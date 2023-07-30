	
var isPwChecked = false; // pw 확인
var isPwChecked2 = false; // pwChk 확인
var isNameChecked = true; // 이름 중복체크 확인
var isPhoneChecked = false; //전화번호 양식 확인
$(function(){
	$('#signupEmailChkBtn').attr('disabled',true); //인증번호 발송 버튼 비활성화

	var regIdPw = /^[a-zA-Z0-9!@#$%^*+=-]{4,12}$/;
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
	var regName = /^[가-힣a-zA-Z0-9]{3,15}$/;
	
	$("#signupNickname2").change(function(){
		isNameChecked = false; // 변경되면 확인 풀리게
		var m_nickname = $("#signupNickname2").val();
		var data = {
			m_nickname : m_nickname
		}
		$.ajax({
			url : "/e/signup/userNameCheck",
			type : "POST",
			data : data,
			success : function(result) {
				// 빈 칸 체크 , 3자 이상 15자 이하 체크
				if (m_nickname.length != 0) {
					if (!regName.test(m_nickname)) {
						$("#nameAva").css("display", "none");
						$("#nameOver").css("display", "none");
						$("#nameImpo").css("display", "block");
					} 
					else if (result == "true") {
						$("#nameAva").css("display", "block");
						$("#nameOver").css("display", "none");
						$("#nameImpo").css("display", "none");
						isNameChecked = true;
					} else {
						$("#nameAva").css("display", "none");
						$("#nameOver").css("display", "block");
						$("#nameImpo").css("display", "none");
					}
				}
            },error : function(req,status,err){
				console.log(req);
			}
		})
	});//nameCheck end
});//function end

$(function(){
	//회원 탈퇴 버튼
    $("#memberSecessionBtn").click(function(){
    	let secessionCheck = prompt("정말 탈퇴하시겠습니까? Y/N");
    	if(secessionCheck == "Y"){
    		location.href = "deleteMember";
    		alert("지금까지 이용해주셔서 감사합니다.");
    	}
    });
});

// 유효성 검사 메서드
function Validation2() {
//	event.preventDefault();
	// 변수에 저장
	var m_id = document.getElementById("signupId")
	var pw = document.getElementById("signupPw")
	var pwchk = document.getElementById("signupPwchk")
	var nickname = document.getElementById("signupNickname2")
	var phone = document.getElementById("signupPhone2")
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
		alert("전화번호 양식에 맞춰 작성해 주세요. ex) 010 1234 5678")
		phone.focus();
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
