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
							<a href="boardList">INFOMATION</a>
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
정보글 등록
<form action="regBoard.do" method="POST" enctype="multipart/form-data">
	<table id="regTable">
		<tr>
			<td class="regItem">정보글 카테고리</td>
			<td><select name="b_category">
					<option value="공연 정보">공연 정보</option>
					<option value="악기 정보">악기 정보</option>
					<option value="연습실 정보">연습실 정보</option>
					<option value="기타">기타</option>
			</select></td>
		</tr>
		<tr>
			<td class="regItem">정보글 제목</td>
			<td><input name="b_title"></td>
		</tr>
		<tr>
			<td class="regItem">정보글 내용</td>
			<td><textarea cols="50" rows="10" name="b_content"></textarea></td>
		</tr>
		<tr>
			<th class="regItem">포스터</th>
			<td><input type='file' name='b_poster' size='50'></td>
		</tr>
	</table>

	<div class="regBtnDiv">
		<button id="regBtn">등록하기</button>
	</div>
</form>

<%@ include file="../footer.jsp"%>