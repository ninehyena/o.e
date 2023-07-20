<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../header.jsp"%>

<br>
<br>
<br>
<h3>정보글 게시판</h3>
<table>
	<c:forEach var="b" items="${boards}">
		<tr>
			<td><c:out value="${b.b_no}" /></td>
			<td><c:out value="${b.b_category}" /></td>
			<td><a href="readBoard?b_no=${b.b_no}"><c:out
						value="${b.b_title}" /></a></td>
			<td><fmt:formatDate value="${b.b_regdate}" pattern="yyyy.MM.dd." /></td>
		</tr>
	</c:forEach>
</table>
<a href="regBoard">정보글 등록</a>
<br>
<a href="noticeList">공지글 게시판으로</a>
<%@ include file="../footer.jsp"%>