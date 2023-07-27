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
					<div class="col-md-12 mt-text animate-box"
						data-animate-effect="fadeInUp">
						<h1 class="cursive-font">Review</h1>
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
				<h2 class="oe_font primary-color">${lesson.l_teacher_id }님의 ${lesson.l_category }레슨에 대한 경험을 공유해 주세요!</h2>
			</div>
		</div>
		<div class="row">
			<form action="writeReview" method="post">
				<input type="hidden" name="l_num" value="${lesson.l_num }">
				<div class="form-group gtco-heading">
					<h2 class="oe_font primary-color">▷ 별점을 선택해주세요</h2>
					<div class="form-group oe_center" id="myform" >
						<fieldset>
							<input type="radio" name="r_star" value="5" id="rate1">
							<label for="rate1">★</label>
							<input type="radio" name="r_star" value="4" id="rate2">
							<label for="rate2">★</label>
							<input type="radio" name="r_star" value="3" id="rate3">
							<label for="rate3">★</label>
							<input type="radio" name="r_star" value="2" id="rate4">
							<label for="rate4">★</label>
							<input type="radio" name="r_star" value="1" id="rate5">
							<label for="rate5">★</label>
						</fieldset>
					</div>
				</div>
				<div class="form-group gtco-heading">
					<h2 class="oe_font primary-color">▷ 수업은 ${lesson.l_level } 레벨에 맞게 진행됐나요?</h2>
					<div class="oe_center oe_font_bold_25">
						<input type="radio" class="l_day" name="r_level" value="0">쉬웠어요
						<input type="radio" class="l_day" name="r_level" value="1">레벨에 딱 맞았어요
						<input type="radio" class="l_day" name="r_level" value="2">어려웠어요
					</div>
				</div>
				<div class="form-group gtco-heading">
					<h2 class="oe_font primary-color">▷ 다른 회원들에게 레슨을 추천하시겠어요?</h2>
					<div class="oe_center oe_font_bold_25">
						<input type="radio" class="l_day" name="r_recommend" value="1">추천해요
						<input type="radio" class="l_day" name="r_recommend" value="0">비추천해요
					</div>
				</div>
				<div class="form-group">
					<textarea class="form-control txtarea" id="r_content" name="r_content" rows="10" placeholder="수업을 진행하며 느꼈던 점을 자유롭게 적어주세요."></textarea>
				</div>
				<div class="oe_center">
					<button type="submit" class="btn btn-primary mt10 oe_font_bold_18">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>


<%@ include file="../footer.jsp"%>