<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner"
	style="background-image: url(resources/images/img_bg_1.jpg); height:80px;"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
</header>


<div class="gtco-section">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center gtco-heading" style="margin-bottom: 0;">
				<h1><a href="idFind">아이디 찾기</a></h1>  <h3><a href="pwFind">비밀번호 찾기</a></h3>
			</div>
			<div class="row">
				<c:if test="${sessionScope.userId == null}">
					<form action="idFind.do" method="GET">
						<table>
							<tr>
								<td>
									이메일
								</td>
								<td>
									<input name="m_email" autofocus="autofocus"
					 				autocomplete="off" placeholder="이메일을 입력하세요">
								</td>
							</tr>
							<tr>
								<td align="center" rowspan="2">
									<button id='find_id' onclick="findIdClick()">아이디 찾기</button>
								</td>
							</tr>
						</table>
					</form>
				</c:if>
				
				<c:if test="${sessionScope.userId!= null}">
						<table>
							<tr>
								<td>
									검색 결과
								</td>
							</tr>
							<tr>
								<td>사용자 아이디 :</td>
								<td>
									<input value="${sessionScope.userId }" readonly="readonly" style="border: none; outline: none;">
								</td>
							</tr>
							<tr>
								<td align="center" rowspan="2">
									<a href="pwFind"><button>비밀번호 찾기</button></a>
								</td>
							</tr>
						</table>
				</c:if>
			</div>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp"%>