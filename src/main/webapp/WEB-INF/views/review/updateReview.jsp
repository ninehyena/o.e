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
						<h1 class="cursive-font">Update Review</h1>
					</div>
				</div>

			</div>
		</div>
	</div>
</header>



<div class="gtco-section-v">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 text-center gtco-heading">
				<h2 class="oe_font primary-color">${lesson.l_teacher_id }님의 ${lesson.l_category }레슨에 대한 경험을 공유해 주세요!</h2>
			</div>
		</div>
		<div class="row">
			<form action="updateReview" method="post">
				<input type="hidden" name="l_num" value="${lesson.l_num }">
				<input type="hidden" name="r_num" value="${review.r_num }">
				<div class="form-group gtco-heading">
					<h2 class="oe_font primary-color">▷ 별점을 선택해주세요</h2>
					<div class="form-group oe_center" id="myform" >
						<fieldset>
							<input type="radio" name="r_star" value="5" id="rate1" <c:if test="${review.r_star == 5}">checked</c:if>>
							<label for="rate1">★</label>
							<input type="radio" name="r_star" value="4" id="rate2" <c:if test="${review.r_star == 4}">checked</c:if>>
							<label for="rate2">★</label>
							<input type="radio" name="r_star" value="3" id="rate3" <c:if test="${review.r_star == 3}">checked</c:if>>
							<label for="rate3">★</label>
							<input type="radio" name="r_star" value="2" id="rate4" <c:if test="${review.r_star == 2}">checked</c:if>>
							<label for="rate4">★</label>
							<input type="radio" name="r_star" value="1" id="rate5" <c:if test="${review.r_star == 1}">checked</c:if>>
							<label for="rate5">★</label>
						</fieldset>
						
					</div>
				</div>
				<div class="form-group gtco-heading">
					<h2 class="oe_font primary-color">▷ 수업은 ${lesson.l_level } 레벨에 맞게 진행됐나요?</h2>
					<div class="oe_center oe_font_bold_25">
						<input type="radio" class="l_day" name="r_level" value="0" <c:if test="${review.r_level == 0}">checked</c:if>>쉬웠어요
						<input type="radio" class="l_day" name="r_level" value="1" <c:if test="${review.r_level == 1}">checked</c:if>>레벨에 딱 맞았어요
						<input type="radio" class="l_day" name="r_level" value="2" <c:if test="${review.r_level == 2}">checked</c:if>>어려웠어요
					</div>
				</div>
				<div class="form-group gtco-heading">
					<h2 class="oe_font primary-color">▷ 다른 회원들에게 레슨을 추천하시겠어요?</h2>
					<div class="oe_center oe_font_bold_25">
						<input type="radio" class="l_day" name="r_recommend" value="1" <c:if test="${review.r_recommend == 1}">checked</c:if>>추천해요
						<input type="radio" class="l_day" name="r_recommend" value="0" <c:if test="${review.r_recommend == 0}">checked</c:if>>비추천해요
					</div>
				</div>
				<div class="form-group">
					<textarea class="form-control txtarea" id="r_content" name="r_content" rows="10">${review.r_content }</textarea>
				</div>
				<div class="oe_center">
					<button type="submit" class="btn btn-primary mt10 oe_font_bold_18">수정</button>
					<button type="button" class="btn btn-danger mt10 oe_font_bold_18" onclick="deleteReview(${lesson.l_num }, ${review.r_num});">삭제</button>
				</div>
			</form>
		</div>
	</div>
</div>


<%@ include file="../footer.jsp"%>