<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<header id="gtco-header" class="gtco-cover gtco-cover-sm-v" role="banner"
	style="background-image: url(resources/images/img_bg_1.jpg)"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12 col-md-offset-0 text-center">

				<div class="row">
					<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
						<h1 class="cursive-font">Confirm Application For Lesson</h1>
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
				<h2 class="cursive-font primary-color">Application List</h2>
				<h2 class="oe_font"><a href="lessonDetail?l_num=${lesson.l_num }" class="oe_underline">${lesson.l_level } 레벨의 ${lesson.l_category } ${lesson.l_type }반 레슨</a></h2>
			</div>
		</div>
		<div class="row">
			
			<!-- 강사의 레슨 리스트 -->
			<c:if test="${sessionScope.loginMember.m_lesson eq 'lesson'}">
				<table class="table table-hover oe_font_bold_18">
					<tr>
						<th class="oe_center">번호</th>
						<th class="oe_center">신청자 아이디</th>
						<th class="oe_center">신청일</th>
						<th class="oe_center">레슨 상태</th>
					</tr>
					<c:if test="${empty studentList}">
						<tr>
							<td colspan="5" align="center"><b>레슨을 신청한 회원이 없습니다.</b></td>
						</tr>
					</c:if>
					<c:forEach var="l" items="${studentList }" varStatus="status">
						<tr>
							<td class="oe_center oe_vcenter"><c:out value="${status.count}" /></td>
							<td class="oe_center oe_vcenter">${l.a_id }</td>
							<td class="oe_center oe_vcenter"><fmt:formatDate value="${l.a_date}" pattern="yyyy-MM-dd" /></td>
							<td class="oe_center oe_vcenter">
								<c:if test="${l.a_status == 0}">
									<button type="button" class="btn btn-primary oe_font_bold_18" onclick="applicationConfirm(${l.l_num }, '${l.a_id }');">대기</button>
								</c:if>
								<c:if test="${l.a_status == 1}">
									<button type="button" class="btn btn-success oe_font_bold_18" onclick="finishLesson(${l.l_num }, '${l.a_id }');">진행</button>
								</c:if>
								<c:if test="${l.a_status == 2}">
									<button type="button" class="btn btn-secondary oe_font_bold_18" onclick="">완료</button>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			
			<!-- paging -->
			<div class="pageCount">
				<c:forEach var="p" begin="1" end="${pageCount }">
					<a href="applicationDetail_paging?l_num=${lesson.l_num }&p=${p }">${p }</a>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>