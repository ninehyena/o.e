<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner"
	style="height:80px;"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
</header>


<div class="gtco-section">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center gtco-heading" style="margin-bottom: 0;">
				<h3><a href="idFind">아이디 찾기</a></h3>  <h1><a href="pwFind">비밀번호 찾기</a></h1>
			</div>
			<div class="row">
				<table>
					<tr>
						<td>아이디</td>
						<td>
							<!-- <input name="m_id" id="pwFind_inputId" autofocus="autofocus" -->
							<input name="m_id" id="m_id" autofocus="autofocus"
			 				autocomplete="off" placeholder="아이디를 입력하세요">
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
<!-- 							<input name="m_email" id="pwFind_inputEmail" -->
							<input name="m_email" id="m_email"
			 				autocomplete="off" placeholder="이메일을 입력하세요">
		 				</td>
					</tr>
					<tr>
						<td align="center" rowspan="2">
							<button id="findPw">비밀번호 찾기</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp"%>