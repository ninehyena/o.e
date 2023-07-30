<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<a href="noticeList" id="oe_white">NOTICE</a>
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
				<h2 class="oe_font primary-color">공지사항</h2>
			</div>
		</div>
		<div class="row">
				<table class="table table-hover oe_font_bold_18">
					<tr>
						<th class="oe_center"></th>
						<th class="oe_center">NO</th>
						<th class="oe_center">제목</th>
						<th class="oe_center">등록일</th>
					</tr>
					<c:if test="${empty notices}">
						<tr>
							<td colspan="5" align="center"><b>등록된 공지글이 없습니다.</b></td>
						</tr>
					</c:if>
					<c:forEach var="n" items="${notices }" varStatus="status">
						<tr onclick="location.href='noticeDetail?n_no=${n.n_no}'" class="mouse">
							<td class="oe_center oe_vcenter"><img src="images/notice.png" class="checkbox"></td>
							<td class="oe_center oe_vcenter"><c:out value="${n.n_no}"/></td>
							<td class="oe_center oe_vcenter"><c:out value="${n.n_title}" /></td>
							<td class="oe_center oe_vcenter"><fmt:formatDate value="${n.n_regdate}" pattern="yyyy.MM.dd" /></td>
						</tr>
					</c:forEach>
				</table>

		</div>
		
		<!-- paging -->
		<div class="pageCount">
			<c:forEach var="p" begin="1" end="${pageCount}">
				<a href="notice_paging?p=${p}">${p}</a>
			</c:forEach>
		</div>
	</div>
</div>

<c:if test="${sessionScope.loginMember != null && sessionScope.loginMember.m_id == 'admin'}">
	<div style="display: flex; flex-direction: row; align-items: center; justify-content: center; margin-bottom: 40px;">
		<button class="btn btn-primary" onclick="location.href='regNotice'">글쓰기</button>
	</div>
</c:if>

<div class="gtco-cover gtco-cover-sm"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="gtco-container text-center">
		<div class="display-t">
			<div class="display-tc">
				<h1>&ldquo; Our high quality of service makes you back over
					and over again!&rdquo;</h1>
				<p>&mdash; Team sobakee </p>
			</div>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>