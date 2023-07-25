<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<header id="gtco-header" class="gtco-cover gtco-cover-sm-v"
	role="banner"
	style="background-image: url(resources/images/img_bg_1.jpg)"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12 col-md-offset-0 text-center">

				<div class="row">
					<div class="col-md-12 mt-text animate-box"
						data-animate-effect="fadeInUp">
						<h1 class="cursive-font">
							<a href="noticeList">NOTICE</a>
						</h1>
					</div>
				</div>

			</div>
		</div>
	</div>
</header>

<br>
<br>
<br>
공지 사항 등록
<form action="regNotice.do" method="POST">
	<table id="regTable">
		<tr>
			<td class="regItem">공지 제목</td>
			<td><input name="n_title"></td>
		</tr>
		<tr>
			<td class="regItem">공지 내용</td>
			<td><textarea cols="50" rows="10" name="n_content"></textarea></td>
		</tr>
	</table>
	<div class="regBtnDiv">
		<button id="regBtn">등록하기</button>
	</div>
</form>

<%@ include file="../footer.jsp"%>