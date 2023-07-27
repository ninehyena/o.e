<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../header.jsp"%>

<header id="gtco-header" class="gtco-cover gtco-cover-sm-v"
	role="banner"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12 col-md-offset-0 text-center">

				<div class="row">
					<div class="col-md-12 mt-text animate-box"
						data-animate-effect="fadeInUp">
						<h1 class="cursive-font">
							<a href="board" id="oe_white">INFORMATION</a>
						</h1>
					</div>
				</div>

			</div>
		</div>
	</div>
</header>

<div class="gtco-section-v">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
				<h2 class="oe_font primary-color">정보 게시판</h2>
			</div>
		</div>
		<div class="row mb40">
			<form class="form-inline oe_float_right" action="board_search" >
				<input class="form-control" type="search" name="search" placeholder="검색어를 입력하세요">
				<button class="btn btn-primary oe_font_bold_18 mt4" type="submit">검색</button>
			</form>
		</div>
		<div class="row">
				<table class="table table-hover oe_font_bold_18">
					<tr>
						<th class="oe_center">NO</th>
						<th class="oe_center">카테고리</th>
						<th class="oe_center">제목</th>
						<th class="oe_center">등록일</th>
					</tr>
					<c:if test="${empty boards}">
						<tr>
							<td colspan="5" align="center"><b>등록된 정보글이 없습니다.</b></td>
						</tr>
					</c:if>
					<c:forEach var="b" items="${boards }" varStatus="status">
						<tr onclick="location.href='boardDetail?b_no=${b.b_no}'" class="mouse">
							<td class="oe_center oe_vcenter"><c:out value="${b.b_no}"/></td>
							<td class="oe_center oe_vcenter"><c:out value="${b.b_category}" /></td>
							<td class="oe_center oe_vcenter"><c:out value="${b.b_title}" /></td>
							<td class="oe_center oe_vcenter"><fmt:formatDate value="${b.b_regdate}" pattern="yyyy.MM.dd" /></td>
						</tr>
					</c:forEach>
				</table>

		</div>
		
		<!-- paging -->
		<div class="pageCount">
			<c:forEach var="p" begin="1" end="${pageCount}">
				<a href="board_paging?p=${p}">${p}</a>
			</c:forEach>
		</div>
	</div>
</div>

<c:if test="${sessionScope.loginMember != null && sessionScope.loginMember.m_id == 'admin'}">
	<div
		style="display: flex; flex-direction: row; align-items: center; justify-content: center;">
		<button class="btn btn-primary" onclick="location.href='regBoard'">글쓰기</button>
	</div>
</c:if>

<br>

<br>
<%@ include file="../footer.jsp"%>