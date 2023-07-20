<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<br>
<br>
<br>
공지 사항 읽기
<table id="readTable">
	<tr>
		<td class="regItem">공지 제목</td>
		<td><input name="n_title"
			value='<c:out value="${notice.n_title}" />' readonly=readonly></td>
	</tr>
	<tr>
		<td class="regItem">공지 내용</td>
		<td><textarea cols="50" rows="10" name="n_content"
				readonly="readonly"><c:out value="${notice.n_content}" /></textarea></td>
	</tr>
</table>
<div class="getBtnTwins">
	<button data-oper="updateNotice" id="updBtn">수정</button>
	<button data-oper="deleteNotice" id="delBtn">삭제</button>
	<button data-oper="noticeList" id="listBtn">목록</button>
</div>

<form action="readNotice" method="GET">
	<input type="hidden" id="n_no" name="n_no"
		value="<c:out value='${notice.n_no}'/>">
</form>
<script>
	$(document).ready(function() {

		// 페이지 이동 관련 정보 스크립트 시작.
		var formObj = $("form");

		$("#updBtn").on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'updateNotice') {
				formObj.attr("action", "updateNotice");
			}
			formObj.submit();
		});

		$("#listBtn").on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'noticeList') {
				formObj.find("#n_no").remove();
				formObj.attr("action", "noticeList");
			}
			formObj.submit();
		});

		$("#delBtn").on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'deleteNotice') {
				formObj.attr("action", "deleteNotice");
			}
			formObj.submit();
		});
	});
</script>

<%@ include file="../footer.jsp"%>