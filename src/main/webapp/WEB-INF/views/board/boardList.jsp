<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<c:if test="${empty boards}">
	<br>
	<br>
	<br>
	<h3>등록된 정보글이 없습니다.</h3>
	<br>
	<br>
	<br>
</c:if>

<a href="noticeList" style="font-size: 20px; font-weight: bolder;">공지
	게시판으로 이동</a>
<br>
<table class="table" style="margin-top: 15px;">
	<thead>
		<tr>
			<th scope="col" style="width: 95px;">No</th>
			<th scope="col" style="width: 140px;">카테고리</th>
			<th scope="col">제목</th>
			<th scope="col" style="width: 100px;">등록일</th>
		</tr>
	</thead>
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
<div
	style="display: flex; flex-direction: row; align-items: center; justify-content: center;">
	<button class="btn btn-primary" onclick="location.href='regBoard'">글쓰기</button>
</div>
<div style="text-align: center; font-size: 18px; font-weight: 900;">
	<c:forEach var="p" begin="1" end="${pageCount}">
		<a href="boardListWithPaging?p=${p}">${p}</a>
	</c:forEach>
</div>

<br>
<form class="boardSerach" action="boardSearch"
	style="display: flex; justify-content: center;">
	<input class="form-control mr-sm-2" type="search" name="search"
		placeholder="검색어를 입력하세요" style="width: 200px; margin-right: 5px;">
	<button class="btn btn-primary" type="submit">검색</button>
</form>
<br>
<%@ include file="../footer.jsp"%>