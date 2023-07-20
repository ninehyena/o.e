<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<br>
<br>
<br>
정보글 게시판
<table id="readTable">
	<tr>
		<td class="regItem">글 카테고리</td>
		<td><input name="b_category"
			value='<c:out value="${board.b_category}" />' readonly></td>
	</tr>

	<tr>
		<td class="regItem">글 제목</td>
		<td><input name="b_title"
			value='<c:out value="${board.b_title}" />' readonly></td>
	</tr>

	<tr>
		<td class="regItem">글 내용</td>
		<td><textarea cols="50" rows="10" name="b_content" readonly><c:out
					value="${board.b_content}" /></textarea></td>
	</tr>
</table>
<div class="getBtnTwins">
	<button data-oper="updateBoard" id="updBtn">수정</button>
	<button data-oper="deleteBoard" id="delBtn">삭제</button>
	<button data-oper="boardList" id="listBtn">목록</button>
</div>

<form action="readBoard" method="GET">
	<input type="hidden" id="b_no" name="b_no"
		value="<c:out value='${board.b_no}'/>">
</form>
<script>
	$(document).ready(function() {

		// 페이지 이동 관련 정보 스크립트 시작.
		var formObj = $("form");

		$("#updBtn").on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'updateBoard') {
				formObj.attr("action", "updateBoard");
			}
			formObj.submit();
		});

		$("#listBtn").on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'boardList') {
				formObj.find("#b_no").remove();
				formObj.attr("action", "boardList");
			}
			formObj.submit();
		});

		$("#delBtn").on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'deleteBoard') {
				formObj.attr("action", "deleteBoard");
			}
			formObj.submit();
		});
	});
</script>

<%@ include file="../footer.jsp"%>