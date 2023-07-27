<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<br>
<br>
<br>
글 사항 수정
<form action="updateBoard.do" method="POST">
	<table id="regTable">
		<tr>
			<td class="regItem">글 카테고리</td>
			<td><input name="b_category"
				value='<c:out value="${board.b_category}" />'></td>
		</tr>

		<tr>
			<td class="regItem">글 제목</td>
			<td><input name="b_title"
				value='<c:out value="${board.b_title}" />'></td>
		</tr>
		<tr>
			<td class="regItem">글 내용</td>
			<td><textarea cols="50" rows="10" name="b_content"><c:out
						value="${board.b_content}" /></textarea></td>
		</tr>
	</table>
	<div class="regBtnDiv">
		<button>수정 완료</button>
	</div>
	<input type="hidden" id="b_no" name="b_no"
		value="<c:out value='${board.b_no}'/>">
</form>

<%@ include file="../footer.jsp"%>