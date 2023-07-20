<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

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