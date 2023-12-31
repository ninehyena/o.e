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
			<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
				<h2 class="cursive-font primary-color">Find the lesson you want!</h2>
			</div>
		</div>
		<div class="row mb40">
			<c:if test="${sessionScope.loginMember.m_id != null && sessionScope.loginMember.m_lesson eq 'lesson'}">
				<button class="btn btn-primary oe_font_bold_18" onclick="regLesson();">레슨 등록</button>
			</c:if>
			<form action="lesson_search" class="form-inline oe_float_right">
				<select class="form-control" id="type" name="type">
						<option selected>지역</option>
						<option>음악 카테고리</option>
						<option>레슨 타입</option>
				</select>
		  		<input class="form-control" type="search" name="search" placeholder="find lesson">
		  		<button class="btn btn-primary oe_font_bold_18 mt4" type="submit">Search</button>
			</form>
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
							<h2>${l.l_category }
								<c:if test="${l.lessonDetail.l_student >= 4}">
									<img alt="officialMark" src="resources/images/officialMark.png"  class="officialMark">
								</c:if>
							</h2>
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

<script type="text/javascript">
	$(".officialMark").hover(function() {
		Swal.fire({
	        icon: 'success',                         
	        title: '해당 마크는 o.e에서 부여한 인증 뱃지예요!',
	        html: '<b>o.e의 기준에 맞는 강사에게만 부여한 인증 뱃지예요.<br>레슨을 신청하는데 참고해 보세요.</b>',
	        showConFirmButton: true,
	        showCancelButton: false,
	        confirmButtonColor: '#3085d6',
	        confirmButtonText: '확인',
	    });
	});
</script>
<%@ include file="../footer.jsp"%>