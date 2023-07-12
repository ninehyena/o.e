<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- <c:set var="path" value="${pageContext.request.contextPath}"/> -->
   <header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image: url(resources/images/img_bg_1.jpg)" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="gtco-container">
         <div class="row">
            <div class="col-md-12 col-md-offset-0 text-left">
            	<div class="row row-mt-15em">
						<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
							<span class="intro-text-small">Hand-crafted by <a href="http://gettemplates.co" target="_blank">GetTemplates.co</a></span>
							<h1 class="cursive-font">회원가입</h1>
						</div>
							

					</div>
                     
            </div>
         </div>
      </div>
   </header>
<form action="signup.reg" method="post" onsubmit="return Validation()">
	<table>
		<tr>
			<td>아이디</td>
			<td><input name="m_id" autofocus="autofocus"
	 				autocomplete="off" placeholder="아이디를 입력하세요">
	 				<button>중복확인</button></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="m_pw" placeholder="비밀번호를 입력하세요"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" placeholder="비밀번호를 입력하세요"></td>
		</tr>
		<tr>
			<td>선생님?</td>
			<td>
				<input type="radio" name="m_lesson" value="not_lesson" checked>교습
				<input type="radio" name="m_lesson" value="lesson">강습
			</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input name="m_nickname" autofocus="autofocus"
	 				autocomplete="off" placeholder="닉네임을 입력하세요">
	 				<button>중복확인</button></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input name="m_phone"autofocus="autofocus"
	 				autocomplete="off" placeholder="-제외하고 입력해주세요" maxlength="11"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input name="m_email" autofocus="autofocus"
	 				autocomplete="off" placeholder="이메일을 입력하세요">
			<button type="button">인증번호 발송</button><br>
		
			<input id="emailChk"autofocus="autofocus"
	 				autocomplete="off">
			<button type="button">인증하기</button></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input name="m_addr1" id="addr1" readonly="readonly"><input type="button" id="addrBtn" value="우편번호"><br>
			<input name="m_addr2" id="addr2" readonly="readonly">
			<input name="m_addr3" id="addr3" autofocus="autofocus"
	 				autocomplete="off" placeholder="나머지 주소를 입력하세요"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" name="signupBtn">회원가입</button>
			</td>
		</tr>
	</table>
		
</form>


<%@ include file="../footer.jsp"%>
