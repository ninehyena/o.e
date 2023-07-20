<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../header.jsp"%>

<br>
<br>
<br>
<h3>공지 사항 게시판</h3>
<table>
	<c:forEach var="n" items="${notices}">
		<tr>
			<td><c:out value="${n.n_no}" /></td>
			<td><a href="readNotice?n_no=${n.n_no}"><c:out
						value="${n.n_title}" /></a></td>
			<td><fmt:formatDate value="${n.n_regdate}" pattern="yyyy.MM.dd." /></td>
		</tr>
	</c:forEach>
</table>
<a href="regNotice">공지 등록</a>
<br>
<a href="boardList">정보글 게시판으로</a>
<%@ include file="../footer.jsp"%>