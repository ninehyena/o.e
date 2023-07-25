<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- <c:set var="path" value="${pageContext.request.contextPath}"/> -->
   <header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="gtco-container">
         <div class="row">
            <div class="col-md-12 col-md-offset-0 text-left">
            	<div class="row row-mt-15em">
						<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
							<span class="intro-text-small">Hand-crafted by <a href="http://gettemplates.co" target="_blank">GetTemplates.co</a></span>
							<h1 class="cursive-font">마이페이지</h1>
						</div>
							<form action="mypageUpdate" method="post" onsubmit="return Validation2()">
								<table>
									<tr>
										<td>아이디</td>
										<td><input name="m_id" id="signupId" class="id_confirm" value="${sessionScope.loginMember.m_id }" readonly="readonly" />
								 			
								 		</td>
								 		
									</tr>
									<tr>
										<td>비밀번호</td>
										<td><input type="password" id="signupPw" name="m_pw" placeholder="비밀번호를 입력하세요" required /><br>
											<span id="pwImpo" style="display: none;">비밀번호는 4글자 이상 12글자 이하</span>
								 			<span id="pwAva" style="display: none;">사용 가능</span>
								 			<span id="pwOver" style="display: none;">아이디와 동일한 비밀번호는 사용할 수 없습니다.</span>
										</td>
									</tr>
									<tr>
										<td>비밀번호 확인</td>
										<td><input type="password" id="signupPwchk" placeholder="비밀번호를 입력하세요"/><br>
											<span id="pwchkImpo" style="display: none;">비밀번호는 4글자 이상 12글자 이하</span>
											<span id="pwchkAva" style="display: none;">사용 가능</span>
											<span id="pwchkOver" style="display: none;">비밀번호와 동일하지 않습니다.</span>
										</td>
									</tr>
									<tr>
										<td>선생님?</td>
										<td>
											<!-- <input type="checkbox" class="l_day" name="l_day" value="금요일" <c:if test="${fn:contains(detail.l_day, '금요일') }">checked</c:if>> -->
											<input type="hidden" id="getMlesson" value="${sessionScope.loginMember.m_lesson }">
											<input type="radio" name="m_lesson" value="not_lesson" <c:if test="${fn:contains(sessionScope.loginMember.m_lesson, 'not_lesson')}">checked</c:if>>교습
											<input type="radio" name="m_lesson" value="lesson"  <c:if test="${fn:contains(sessionScope.loginMember.m_lesson, 'lesson')}">checked</c:if>>강습
										</td>
									</tr>
									<tr>
										<td>이름</td>
										<td><input name="m_nickname" id="signupNickname" autofocus="autofocus"
								 				autocomplete="off" placeholder="닉네임을 입력하세요" 
								 				value="${sessionScope.loginMember.m_nickname }"><br>
								 			<span id="nameImpo" style="display: none;">이름은 최소 2글자 15글자 이하</span>
								 			<span id="nameAva" style="display: none;">사용 가능한 이름</span>
								 			<span id="nameOver" style="display: none;">중복된 이름입니다.</span>
								 		</td>
									</tr>
									<tr>
										<td>연락처</td>
										<td><input name="m_phone" id="signupPhone" autofocus="autofocus"
								 				autocomplete="off" placeholder="숫자만 입력해주세요" 
								 				value="${sessionScope.loginMember.m_phone }" maxlength="11"
								 				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
								 		</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td><input name="m_email" id="signupEmail" autofocus="autofocus"
								 				autocomplete="off" placeholder="이메일을 입력하세요"
								 				value="${sessionScope.loginMember.m_email }" readonly="readonly">
								 			<button id="signupEmailChkBtn" type="button">인증번호 발송</button><br>
							 				<span id="emailImpo" style="display: none;">잘못된 이메일 형식입니다.</span>
								 			<span id="emailAva" style="display: none;">사용 가능한 이메일</span>
									
										<input id="emailChk"autofocus="autofocus"
								 				autocomplete="off" placeholder="인증번호 6자리를 입력하세요."><br>
										<span id="mail-check-warn"></span>
									</tr>
									<tr>
										<td>주소</td>
										<td><input name="m_addr1" id="addr1" readonly="readonly" value="${sessionScope.loginMember.m_addr1 }">
										<input type="button" id="addrBtn" value="우편번호"><br>
										<input name="m_addr2" id="addr2" readonly="readonly" value="${sessionScope.loginMember.m_addr2 }">
										<input name="m_addr3" id="addr3" autofocus="autofocus"
								 				autocomplete="off" placeholder="나머지 주소를 입력하세요" value="${sessionScope.loginMember.m_addr3 }" required></td>
									</tr>
									<tr>
										<td colspan="2" align="center">
											<button type="submit" name="mypageUpdateBtn">수정하기</button>
										</td>
									</tr>
								</table>
									
							</form>

					</div>
                     
            </div>
         </div>
      </div>
   </header>



<%@ include file="../footer.jsp"%>