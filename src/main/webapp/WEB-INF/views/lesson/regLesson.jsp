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
				<h2 class="cursive-font primary-color">Register Lesson</h2>
			</div>
		</div>
		<div class="row">

<<<<<<< HEAD
			<form action="regLesson" method="post" onsubmit="return lessonCheck();">
=======
			<form action="regLesson" method="post">
>>>>>>> refs/remotes/origin/LJ
				<div class="form-group">
					<label for="l_type">레슨 타입</label> 
					<select class="form-control" id="l_type" name="l_type">
						<option>취미</option>
						<option>준비</option>
				 	</select>
				</div>
				<div class="form-group">
					<label for="l_category">음악 카테고리</label> 
					<input type="text" class="form-control" id="l_category" name="l_category">
				</div>
				<div class="form-group">
					<label for="l_level">레슨 레벨</label><br> 
					<select class="form-control" id="l_level" name="l_level">
						<option>초급</option>
						<option>중급</option>
						<option>고급</option>
				 	</select>
				</div>
				<div class="oe_center">
					<button type="submit" class="btn btn-primary oe_center">다음</button>
				</div>
			</form>

		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>