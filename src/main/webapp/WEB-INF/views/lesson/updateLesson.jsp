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
				<h2 class="cursive-font primary-color">Update information of lesson</h2>
				<p>레슨에 대해 수정할 정보를 입력해 주세요.</p>
				<p>(<span class="notnull">*</span>) 표시는 필수 입력 항목입니다.</p>
			</div>
		</div>
		<div class="row">

			<form action="updateLesson" method="post" onsubmit="return updateCheck();" enctype="multipart/form-data">
				<input type="hidden" name="l_num" value="${lesson.l_num }">
				<div class="form-group">
					<span class="notnull">*</span><label for="l_type">레슨 타입</label> 
					<select class="form-control" id="l_type" name="l_type">
						<option <c:if test="${lesson.l_type eq '취미' }">selected</c:if>>취미</option>
						<option <c:if test="${lesson.l_type eq '준비' }">selected</c:if>>준비</option>
				 	</select>
				</div>
				<div class="form-group">
					<span class="notnull">*</span><label for="l_category">음악 카테고리</label> 
					<input type="text" class="form-control" id="l_category" name="l_category" value="${lesson.l_category }">
				</div>
				<div class="form-group">
					<span class="notnull">*</span><label for="l_level">레슨 레벨</label><br> 
					<select class="form-control" id="l_level" name="l_level">
						<option <c:if test="${lesson.l_level eq '초급' }">selected</c:if>>초급</option>
						<option <c:if test="${lesson.l_level eq '충급' }">selected</c:if>>중급</option>
						<option <c:if test="${lesson.l_level eq '고급' }">selected</c:if>>고급</option>
				 	</select>
				</div>
				
				<div class="form-group">
					<span class="notnull">*</span><label for="l_location">레슨 지역</label> 
					<input type="text" class="form-control" id="l_location" name="l_location" value="${detail.l_location }">
				</div>
				<div class="form-group">
					<span class="notnull">*</span><label for="l_room">레슨 장소</label> 
					<select class="form-control" name="l_room">
						<option <c:if test="${detail.l_room eq '개인 연습실' }">selected</c:if>>개인 연습실</option>
						<option <c:if test="${detail.l_room eq '연습실 대관' }">selected</c:if>>연습실 대관</option>
						<option <c:if test="${detail.l_room eq '협의' }">selected</c:if>>협의</option>
				 	</select>
				</div>
				<div class="form-group">
					<label for="l_photo">프로필 사진</label> 
					<input type="file" class="form-control" id="l_photo" name="l_photo">
				</div>
				<div class="form-group">
					<label for="l_level_of_education1">학력</label> 
					<input type="text" class="form-control" name="l_level_of_education1" value="${detail.l_level_of_education1 }"
						<c:if test="${detail.l_level_of_education1 == null }">placeholder="고등학교"</c:if>>
					<input type="text" class="form-control w49" name="l_level_of_education2" value="${detail.l_level_of_education2 }"
						<c:if test="${detail.l_level_of_education2 == null }">placeholder="대학교"</c:if>>
					<input type="text" class="form-control w49 oe_float_right" name="l_major" value="${detail.l_major }"
						<c:if test="${detail.l_major == null }">placeholder="전공"</c:if>>
				</div>
				<div class="form-group">
					<label for="l_career1">이력</label> 
					<input type="text" class="form-control" name="l_career1" value="${detail.l_career1 }">
					<input type="text" class="form-control mt10" name="l_career2" value="${detail.l_career2 }">
					<input type="text" class="form-control mt10" name="l_career3" value="${detail.l_career3 }">
				</div>
				<div class="form-group">
					<span class="notnull">*</span><label for="l_content">레슨 소개</label> 
					<textarea class="form-control txtarea" id="l_content" name="l_content" rows="10">${detail.l_content }</textarea>
					
				</div>
				<div class="form-group">
					<span class="notnull">*</span><label for="l_pay">레슨 비용(시간 당)</label> 
					<input type="number" class="form-control" id="l_pay" name="l_pay" value="${detail.l_pay }">
				</div>
				<div class="form-group">
					<span class="notnull">*</span><label for="l_day">레슨 가능 요일</label><br>
					<div class="oe_center fs18">
						<input type="checkbox" class="l_day" name="l_day" value="월요일"
							<c:if test="${fn:contains(detail.l_day, '월요일') }">checked</c:if>>월요일
						<input type="checkbox" class="l_day" name="l_day" value="화요일"
							<c:if test="${fn:contains(detail.l_day, '화요일') }">checked</c:if>>화요일
						<input type="checkbox" class="l_day" name="l_day" value="수요일"
							<c:if test="${fn:contains(detail.l_day, '수요일') }">checked</c:if>>수요일
						<input type="checkbox" class="l_day" name="l_day" value="목요일"
							<c:if test="${fn:contains(detail.l_day, '목요일') }">checked</c:if>>목요일
						<input type="checkbox" class="l_day" name="l_day" value="금요일"
							<c:if test="${fn:contains(detail.l_day, '금요일') }">checked</c:if>>금요일
						<input type="checkbox" class="l_day" name="l_day" value="토요일"
							<c:if test="${fn:contains(detail.l_day, '토요일') }">checked</c:if>>토요일
						<input type="checkbox" class="l_day" name="l_day" value="일요일"
							<c:if test="${fn:contains(detail.l_day, '일요일') }">checked</c:if>>일요일
						<span class="l_day"> | </span>
						<input type="checkbox" class="l_day" name="l_day" value="조율 가능"
							<c:if test="${fn:contains(detail.l_day, '조율 가능') }">checked</c:if>>조율 가능
					</div>
				</div>
				<div class="oe_center">
					<button type="submit" class="btn btn-primary mt10">수정</button>
				</div>
			</form>

		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>