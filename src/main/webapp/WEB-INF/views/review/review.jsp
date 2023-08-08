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
					<div class="col-md-12 mt-text animate-box"
						data-animate-effect="fadeInUp">
						<h1 class="cursive-font">REVIEW</h1>
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
				<h2 class="oe_font primary-color">${lesson.member.m_nickname }님 ${lesson.l_category } 수업의 리뷰를 확인하세요!</h2>
			</div>
		</div>
		<div class="row">
			<c:if test="${empty reviews}">
				<h2 class="oe_font primary-color oe_center">등록된 리뷰가 없습니다.</h2>
			</c:if>
			<c:forEach var="r" items="${reviews }">
				<div class="col-lg-4 col-md-4 col-sm-6" style="height: 200px; margin-bottom: 60px;">
					<a href="javascript:reviewDetail(${r.r_num})" class="fh5co-card-item-r">
						<figure>
							<div class="overlay">
								<i class="ti-plus"></i>
							</div>
							
						</figure>
						<div class="fh5co-text-v">
							<div class="form-group oe_center">
								<div class="star-ratings" style="text-align: center;">
									<div class="star-ratings-fill space-x-2 text-lg"
										style="width: ${r.r_star*20}%;">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
									<div class="star-ratings-base space-x-2 text-lg">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
								</div>
							</div>
								
							<c:set var="t" value="
							"/>
							<h2 class="oe_font">${fn:split(r.r_content, t)[0] }</h2>
							<p><fmt:formatDate value="${r.r_regdate }" pattern="yyyy-MM-dd" /></p>
						</div>
					</a>
				</div>
			</c:forEach>

		</div>
		
		<!-- paging -->
		<div class="pageCount">
			<c:forEach var="p" begin="1" end="${pageCount }">
				<a href="review_paging?l_num=${l_num }&p=${p }">${p }</a>
			</c:forEach>
		</div>
	</div>
</div>

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