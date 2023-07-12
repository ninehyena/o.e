 // 유효성 검사 메서드
    function Validation() {
        //변수에 저장
        var uid = document.getElementById("uid")
        var pw = document.getElementById("pw")
        var pwchk = document.getElementById("pwchk")
        var nickname = document.getElementById("nickname")
        var email = document.getElementById("email")

        // 정규식
        // id, pw
        var regIdPw = /^[a-zA-Z0-9]{4,12}$/;
        // 이름
        var regName = /^[가-힣a-zA-Z0-9]{2,15}$/;
        // 이메일
        var regMail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

        //아이디 확인
        if(uid.value == ""){
            alert("아이디를 입력하세요.")
            uid.focus();
            return false;
        }
        //아이디 영어 대소문자 확인
        else if(!regIdPw.test(uid.value)){
            alert("4~12자 영문 대소문자, 숫자만 입력하세요.")
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
            alert("4~12자 영문 대소문자, 숫자만 입력하세요.")
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

        //메일주소 확인
        if(email.value.length == 0){
            alert("메일주소를 입력하세요.")
            email.focus();
            return false;
        }

        else if(!regMail.test(email.value)){
            alert("잘못된 이메일 형식입니다.")
            email.focus();
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

        // 유효성 문제 없을 시 폼에 submit
        document.joinForm.submit();
    }
