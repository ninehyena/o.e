<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="background-image: url(resources/images/img_bg_1.jpg)"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12 col-md-offset-0 text-center">

				<div class="row row-mt-15em">
					<div class="col-md-12 mt-text animate-box"
						data-animate-effect="fadeInUp">
						<span class="intro-text-small">Hand-crafted by <a
							href="http://gettemplates.co" target="_blank">GetTemplates.co</a></span>
						<h1 class="cursive-font">VEGETABLES</h1>
					</div>
				</div>

			</div>
		</div>
	</div>
</header>

<div class="gtco-section">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
				<h2 class="cursive-font primary-color">Register vegetables</h2>
			</div>
		</div>
		<div class="row">

			<form action="" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="v_name">채소 이름</label> 
					<input type="text" class="form-control" id="v_name" name="v_name"> 
				</div>
				<div class="form-group">
					<label for="v_gram">1회 제공량(g)</label> 
					<input type="number" class="form-control" id="v_gram" name="v_gram">
				</div>
				<div class="form-group">
					<label for="v_kcal">열량(kcal)</label> 
					<input type="number" class="form-control" id="v_kcal" name="kcal">
				</div>
				<div class="form-group">
					<label for="v_carbohydrate">탄수화물(g)</label> 
					<input type="number" class="form-control" id="v_carbohydrate" name="v_carbohydrate">
				</div>
				<div class="form-group">
					<label for="v_natrium">나트륨(mg)</label> 
					<input type="number" class="form-control" id="v_natrium" name="v_natrium">
				</div>
				<div class="form-group">
					<label for="v_sugar">당류(g)</label> 
					<input type="number" class="form-control" id="v_sugar" name="v_sugar">
				</div>
				<div class="form-group">
				    <label for="v_img">채소 사진</label>
				    <input type="file" class="form-control-file" id="v_photo" name="v_photo">
				  </div>
				<button type="submit" class="btn btn-primary">등록</button>
			</form>

		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>