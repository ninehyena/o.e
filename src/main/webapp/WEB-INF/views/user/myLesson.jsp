<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<header id="gtco-header" class="gtco-cover gtco-cover-sm-v" role="banner"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12 col-md-offset-0 text-center">

				<div class="row">
					<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
						<h1 class="cursive-font">My LESSON</h1>
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
				<h2 class="cursive-font primary-color">My Lesson Lists</h2>
			</div>
		</div>
		<div class="row">
			<!-- 수강생의 레슨 리스트 -->
			<c:if test="${sessionScope.loginMember.m_lesson eq 'not_lesson'}">
				<table class="table table-hover oe_font_bold_18">
					<tr>
						<th class="oe_center">번호</th>
						<th class="oe_center">레슨 타입</th>
						<th class="oe_center">음악 카테고리</th>
						<th class="oe_center">레슨 레벨</th>
						<th class="oe_center">강사 아이디</th>
						<th class="oe_center">강사 연락처</th>
						<th class="oe_center">상태</th>
						<th class="oe_center">신청일</th>
					</tr>
					<c:if test="${empty myList}">
						<tr>
							<td colspan="5" align="center"><b>신청한 레슨이 없습니다.</b></td>
						</tr>
					</c:if>
					<c:forEach var="l" items="${myList }" varStatus="status">
						<tr onclick="lessonDetail(${l.l_num});" class="mouse">
							<td class="oe_center oe_vcenter">${status.count }</td>
							<td class="oe_center oe_vcenter">${l.l_type }</td>
							<td class="oe_center oe_vcenter">${l.l_category }</td>
							<td class="oe_center oe_vcenter">${l.l_level }</td>
							<td class="oe_center oe_vcenter">${l.l_teacher_id }</td>
							<td class="oe_center oe_vcenter">${l.member.m_phone }</td>
							<td class="oe_center oe_vcenter">
								<c:if test="${l.applicationList.a_status == 0}">
									<button class="btn btn-primary oe_font_bold_18">대기</button>
								</c:if>
								<c:if test="${l.applicationList.a_status == 1}">
									<button class="btn btn-success oe_font_bold_18">진행</button>
								</c:if>
								<c:if test="${l.applicationList.a_status == 2}">
									<button class="btn btn-secondary oe_font_bold_18">완료</button>
								</c:if>
								
							</td>
							<td class="oe_center oe_vcenter"><fmt:formatDate value="${l.applicationList.a_date}" pattern="yyyy-MM-dd" /></td>
							
						</tr>
					</c:forEach>
				</table>
			</c:if>
			
			<!-- 강사의 레슨 리스트 -->
			<c:if test="${sessionScope.loginMember.m_lesson eq 'lesson'}">
				<table class="table table-hover oe_font_bold_18">
					<tr>
						<th class="oe_center">번호</th>
						<th class="oe_center">레슨 타입</th>
						<th class="oe_center">음악 카테고리</th>
						<th class="oe_center">레슨 레벨</th>
						<th class="oe_center">수강생 수</th>
						<th class="oe_center">신규 신청 건수</th>
						<th class="oe_center">등록일</th>
					</tr>
					<c:if test="${empty myList}">
						<tr>
							<td colspan="5" align="center"><b>등록한 레슨이 없습니다.</b></td>
						</tr>
					</c:if>
					<c:forEach var="l" items="${myList }" varStatus="status">
						<tr onclick="lessonDetail(${l.l_num});" class="mouse">
							<td class="oe_center oe_vcenter">${status.count }</td>
							<td class="oe_center oe_vcenter">${l.l_type }</td>
							<td class="oe_center oe_vcenter">${l.l_category }</td>
							<td class="oe_center oe_vcenter">${l.l_level }</td>
							<td class="oe_center oe_vcenter">${l.lessonDetail.l_student }</td>
							<td class="oe_center oe_vcenter">${l.applicationList.cnt }</td>
							<td class="oe_center oe_vcenter"><fmt:formatDate value="${l.l_regdate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
		
		<!-- paging -->
		<div class="pageCount">
			<c:forEach var="p" begin="1" end="${pageCount }">
				<a href="applicationDetail_paging?p=${p }">${p }</a>
			</c:forEach>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>