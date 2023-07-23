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
						<h1 class="cursive-font">LESSONS</h1>
					</div>
				</div>

			</div>
		</div>
	</div>
</header>



<div class="gtco-section-v">
	<div class="gtco-container">
		<div class="row">
			<c:if test="${sessionScope.loginMember.m_id != null && sessionScope.loginMember.m_lesson eq 'lesson'}">
				<button class="btn btn-primary oe_font_bold_18" onclick="regLesson();">레슨 등록</button>
			</c:if>
			<form action="lesson_search" class="form-inline oe_float_right">
			  <input class="form-control mr-sm-2" type="search" name="search" placeholder="find lesson">
			  <button class="btn btn-primary oe_font_bold_18 mt4" type="submit">Search</button>
			</form>
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
				<h2 class="cursive-font primary-color">Find the lesson you want!</h2>
			</div>
		</div>
		<div class="row">
			<c:if test="${empty List}">
				<h2 class="oe_font primary-color">등록된 레슨이 없습니다.</h2>
			</c:if>
			<c:forEach var="l" items="${List }">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="lessonDetail?l_num=${l.l_num}" class="fh5co-card-item ">
						<figure>
							<div class="overlay">
								<i class="ti-plus"></i>
							</div>
							<!-- <img src="images/img_1.jpg" alt="Image" class="img-responsive"> -->
							<img src="images/${l.l_category }.png" alt="Image" class="img-responsive">
							
						</figure>
						<div class="fh5co-text-v">
							<h2>${l.l_category }</h2>
							<p>레슨 타입 : ${l.l_type } / 레슨 레벨 : ${l.l_level }
							<br>레슨 요일 : ${l.lessonDetail.l_day }
							<br>레슨 비용 : ${l.lessonDetail.l_pay }원 / 시간당
							</p>
						</div>
					</a>
				</div>
			</c:forEach>

		</div>
		
		<!-- paging -->
		<div class="pageCount">
			<c:forEach var="p" begin="1" end="${pageCount }">
				<a href="lesson_paging?p=${p }">${p }</a>
			</c:forEach>
		</div>
	</div>
</div>

<div class="gtco-cover gtco-cover-sm"
	style="background-image: url(images/img_bg_1.jpg)"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="gtco-container text-center">
		<div class="display-t">
			<div class="display-tc">
				<h1>&ldquo; Their high quality of service makes me back over
					and over again!&rdquo;</h1>
				<p>&mdash; John Doe, CEO of XYZ Co.</p>
			</div>
		</div>
	</div>
</div>

<div id="gtco-subscribe">
	<div class="gtco-container">
		<div class="row animate-box">
			<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
				<h2 class="cursive-font">Subscribe</h2>
				<p>Be the first to know about the new templates.</p>
			</div>
		</div>
		<div class="row animate-box">
			<div class="col-md-8 col-md-offset-2">
				<form class="form-inline">
					<div class="col-md-6 col-sm-6">
						<div class="form-group">
							<label for="email" class="sr-only">Email</label> <input
								type="email" class="form-control" id="email"
								placeholder="Your Email">
						</div>
					</div>
					<div class="col-md-6 col-sm-6">
						<button type="submit" class="btn btn-default btn-block">Subscribe</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>