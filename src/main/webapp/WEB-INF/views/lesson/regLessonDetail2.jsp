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
				<h2 class="cursive-font primary-color">Register more information of lesson</h2>
				<p>레슨에 대한 상세한 정보를 작성해 주세요.</p>
				<p>(<span class="notnull">*</span>) 표시는 필수 입력 항목입니다.</p>
			</div>
		</div>
		<div class="row">

			<form action="regLessonDetail" method="post" onsubmit="return detailCheck();"  enctype="multipart/form-data">
				<input type="hidden" name="l_num" value="${l_num }">
				<div class="form-group">
					<span class="notnull">*</span><label for="l_location">레슨 지역</label> 
					<input type="text" class="form-control" id="l_location" name="l_location">
				</div>
				<div class="form-group">
					<span class="notnull">*</span><label for="l_room">레슨 장소</label> 
					<select class="form-control" id="l_room" name="l_room">
						<option>개인 연습실</option>
						<option>연습실 대관</option>
						<option>협의</option>
				 	</select>
				</div>
				<div class="form-group">
					<span class="notnull">*</span><label for="l_photo">프로필 사진</label> 
					<input type="file" class="form-control" id="l_photo" name="l_photo">
				</div>
				<div class="form-group">
					<label for="l_level_of_education1">학력</label> 
					<input type="text" class="form-control" name="l_level_of_education1" placeholder="고등학교">
					<input type="text" class="form-control w49" name="l_level_of_education2" placeholder="대학교">
					<input type="text" class="form-control w49 oe_float_right" name="l_major" placeholder="전공">
				</div>
				<div class="form-group">
					<label for="l_career1">이력</label> 
					<input type="text" class="form-control" name="l_career1">
					<input type="text" class="form-control mt10" name="l_career2">
					<input type="text" class="form-control mt10" name="l_career3">
				</div>
				<div class="form-group">
					<span class="notnull">*</span><label for="l_content">레슨 소개</label> 
					<textarea class="form-control txtarea" id="l_content" name="l_content" placeholder="간단한 자기 소개와 레슨 진행 계획, 내용 등을 작성해 주세요." rows="10"></textarea>
					
				</div>
				<div class="form-group">
					<span class="notnull">*</span><label for="l_pay">레슨 비용(시간 당)</label> 
					<input type="number" class="form-control" id="l_pay" name="l_pay">
				</div>
				<div class="form-group">
					<span class="notnull">*</span><label for="l_day">레슨 가능 요일</label><br>
					<div class="oe_center fs18">
						<input type="checkbox" class="l_day" name="l_day" value="월요일">월요일
						<input type="checkbox" class="l_day" name="l_day" value="화요일">화요일
						<input type="checkbox" class="l_day" name="l_day" value="수요일">수요일
						<input type="checkbox" class="l_day" name="l_day" value="목요일">목요일
						<input type="checkbox" class="l_day" name="l_day" value="금요일">금요일
						<input type="checkbox" class="l_day" name="l_day" value="토요일">토요일
						<input type="checkbox" class="l_day" name="l_day" value="일요일">일요일
						<span class="l_day"> | </span>
						<input type="checkbox" class="l_day" name="l_day" value="조율 가능">조율 가능
					</div>
				</div>
				<div class="oe_center">
					<button type="submit" class="btn btn-primary mt10">등록</button>
				</div>
			</form>

		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>