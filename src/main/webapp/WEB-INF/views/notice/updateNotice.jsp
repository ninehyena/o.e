<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<br>
<br>
<br>
공지 사항 수정
<form action="updateNotice.do" method="POST">
	<table id="regTable">
		<tr>
			<td class="regItem">공지 제목</td>
			<td><input name="n_title"
				value='<c:out value="${notice.n_title}" />'></td>
		</tr>
		<tr>
			<td class="regItem">공지 내용</td>
			<td><textarea cols="50" rows="10" name="n_content"><c:out
						value="${notice.n_content}" /></textarea></td>
		</tr>
	</table>
	<div class="regBtnDiv">
		<button>수정 완료</button>	
	</div>
	<input type="hidden" id="n_no" name="n_no"
		value="<c:out value='${notice.n_no}'/>">
</form>

<%@ include file="../footer.jsp"%>