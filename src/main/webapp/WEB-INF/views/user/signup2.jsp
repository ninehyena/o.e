<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- <c:set var="path" value="${pageContext.request.contextPath}"/> -->
   
   <header id="gtco-header" class="gtco-cover gtco-cover-sm-v" role="banner"
		data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12 col-md-offset-0 text-center">
				<div class="row">
					<div class="col-md-12 mt-text animate-box"
						data-animate-effect="fadeInUp">
						<span class="intro-text-small">If you're <a href="/e">already a member?</a></span>
						<h1 class="cursive-font">Sign-Up</h1>
					</div>
				</div>

			</div>
		</div>
	</div>
</header>

<div class="gtco-section-v">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
				<h2 class="cursive-font primary-color">Sign up to be a member</h2>
				<p>회원 가입을 위한 정보를 작성해 주세요.</p>
			</div>
		</div>
		
		<div class="row w80 txt">
			<form action="signup.reg" method="post" onsubmit="return Validation();">
				<div class="form-group">
					<label for="signupId"><b>아이디</b></label> 
					<input name="m_id" id="signupId" class="form-control" autofocus="autofocus"
		 				autocomplete="off" placeholder="아이디를 입력하세요" 
		 				onKeyup="this.value=this.value.replace(/[^a-zA-Z0-9!@#$%^*+=-]/g,'');" />
		 				<!-- 한글 입력 방지, [] 안에 있는 정규식 외에는 입력 막기 -->
		 			<span id="idImpo" style="display: none;">아이디는 4글자 이상 12글자 이하</span>
		 			<span id="idAva" style="display: none;">사용 가능한 아이디</span>
		 			<span id="idOver" style="display: none;">중복된 아이디입니다.</span>
				</div>
				<div class="form-group">
					<label for="signupPw"><b>비밀번호</b></label> 
					<input type="password" id="signupPw" name="m_pw" class="form-control" placeholder="비밀번호를 입력하세요" />
					<span id="pwImpo" style="display: none;">비밀번호는 4글자 이상 12글자 이하</span>
		 			<span id="pwAva" style="display: none;">사용 가능</span>
		 			<span id="pwOver" style="display: none;">아이디와 동일한 비밀번호는 사용할 수 없습니다.</span>
				</div>
				<div class="form-group">
					<label for="signupPwchk"><b>비밀번호 확인</b></label> 
					<input type="password" id="signupPwchk" class="form-control" placeholder="비밀번호를 입력하세요"/>
					<span id="pwchkImpo" style="display: none;">비밀번호는 4글자 이상 12글자 이하</span>
					<span id="pwchkAva" style="display: none;">사용 가능</span>
					<span id="pwchkOver" style="display: none;">비밀번호와 동일하지 않습니다.</span>
				</div>
				<div class="form-group">
					<label for="m_lesson"><b>가입 목적</b></label><br> 
					<div class="w49_2 oe_center">
						<input type="radio" name="m_lesson" class="mr3" value="not_lesson" checked>레슨을 받고 싶어요
					</div>
					<div class="w49_2 oe_center">
						<input type="radio" name="m_lesson" class="mr3" value="lesson">레슨을 하고 싶어요
					</div>					
				</div>
				<div class="form-group">
					<label for="signupNickname"><b>이름</b></label> 
					<input name="m_nickname" id="signupNickname" autofocus="autofocus" class="form-control"
		 				autocomplete="off" placeholder="닉네임을 입력하세요">
		 			<span id="nameImpo" style="display: none;">이름은 최소 2글자 15글자 이하</span>
		 			<span id="nameAva" style="display: none;">사용 가능한 이름</span>
		 			<span id="nameOver" style="display: none;">중복된 이름입니다.</span>
				</div>
				<div class="form-group">
					<label for="l_content"><b>연락처</b></label> 
					<input name="m_phone" id="signupPhone" autofocus="autofocus" class="form-control"
		 				autocomplete="off" placeholder="숫자만 입력해주세요" maxlength="11"
		 				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
				</div>
				<div class="form-group">
					<label for="signupEmail"><b>이메일</b></label><br> 
					<input name="m_email" id="signupEmail" autofocus="autofocus" class="form-control w65"
		 				autocomplete="off" placeholder="이메일을 입력하세요">
		 			<button id="signupEmailChkBtn" type="button" class="btn btn-primary oe_font_bold_18 w32">인증번호 발송</button>
	 				<span id="emailImpo" style="display: none;">잘못된 이메일 형식입니다.</span>
		 			<span id="emailAva" style="display: none;">사용 가능한 이메일</span>
				
					<input id="emailChk"autofocus="autofocus" class="form-control"
			 				autocomplete="off" placeholder="인증번호 6자리를 입력하세요.">
					<span id="mail-check-warn"></span>
				</div>
				<div class="form-group">
					<label for="l_day"><b>주소</b></label><br>
					<input name="m_addr1" id="addr1" readonly="readonly" class="form-control w65 mb4">
					<input type="button" id="addrBtn" value="우편번호" class="form-control w32 mb4">
					<input name="m_addr2" id="addr2" readonly="readonly" class="form-control mb4">
					<input name="m_addr3" id="addr3" autofocus="autofocus" class="form-control mb4"
			 				autocomplete="off" placeholder="나머지 주소를 입력하세요">
				</div>
				<div class="oe_center">
					<button type="submit" class="btn btn-primary mt10 oe_font_bold_18">회원가입</button>
				</div>
			</form>

		</div>
	</div>
</div>


<%@ include file="../footer.jsp"%>
