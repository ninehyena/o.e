<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<br>
<br>
<br>
정보글 등록
<form action="regBoard.do" method="POST">
	<table id="regTable">
		<tr>
			<td class="regItem">정보글 카테고리</td>
			<td><input name="b_category"></td>
		</tr>
		<tr>
			<td class="regItem">정보글 제목</td>
			<td><input name="b_title"></td>
		</tr>
		<tr>
			<td class="regItem">정보글 내용</td>
			<td><textarea cols="50" rows="10" name="b_content"></textarea></td>
		</tr>
	</table>

	<div class="regBtnDiv">
		<button id="regBtn">등록하기</button>
	</div>
</form>

<%@ include file="../footer.jsp"%>