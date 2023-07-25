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
							<a href="noticeList">NOTICE</a>
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
<c:if test="${empty notices}">
	<br>
	<br>
	<br>
	<h3>등록된 공지글이 없습니다.</h3>
	<br>
	<br>
	<br>
</c:if>
<a href="boardList" style="font-size: 20px; font-weight: bolder;">정보
	게시판으로 이동</a>
<br>
<table class="table" style="margin-top: 15px;">
	<thead>
		<tr>
			<th scope="col" style="width: 95px;">No</th>
			<th scope="col">제목</th>
			<th scope="col" style="width: 110px;">등록일</th>
		</tr>
	</thead>
	<c:forEach var="n" items="${notices}">
		<tr>
			<td><c:out value="${n.n_no}" /></td>
			<td><a href="readNotice?n_no=${n.n_no}"><c:out
						value="${n.n_title}" /></a></td>
			<td><fmt:formatDate value="${n.n_regdate}" pattern="yyyy.MM.dd." /></td>
		</tr>
	</c:forEach>
</table>
<div
	style="display: flex; flex-direction: row; align-items: center; justify-content: center;">
	<button class="btn btn-primary" onclick="location.href='regBoard'">글쓰기</button>
</div>
<div style="text-align: center; font-size: 18px; font-weight: 900;">
	<c:forEach var="p" begin="1" end="${pageCount}">
		<a href="noticeListWithPaging?p=${p}">${p}</a>
	</c:forEach>
</div>
<br>
<%@ include file="../footer.jsp"%>