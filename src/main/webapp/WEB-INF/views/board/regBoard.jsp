<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<header id="gtco-header" class="gtco-cover gtco-cover-sm-v"
	role="banner"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12 col-md-offset-0 text-center">

				<div class="row">
					<div class="col-md-12 mt-text animate-box"
						data-animate-effect="fadeInUp">
						<h1 class="cursive-font">
							<a href="boardList"  id="oe_white">INFORMATION</a>
						</h1>
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
				<h2 class="cursive-font primary-color">Register Information</h2>
			</div>
		</div>
		<div class="row">

			<form action="regBoard.do" method="POST" enctype="multipart/form-data">
				<div class="form-group">
					<label for="b_category">정보글 카테고리</label> 
					<select class="form-control" id="b_category" name="b_category">
						<option value="공연 정보">공연 정보</option>
						<option value="악기 정보">악기 정보</option>
						<option value="연습실 정보">연습실 정보</option>
						<option value="기타">기타</option>
				 	</select>
				</div>
				<div class="form-group">
					<label for="b_title">정보글 제목</label> 
					<input type="text" class="form-control" id="b_title" name="b_title">
				</div>
				<div class="form-group">
					<label for="b_content">정보글 내용</label> 
					<textarea class="form-control" id="b_content" name="b_content" rows="10"></textarea>
				</div>
				<div class="form-group">
					<label for="b_poster">포스터 사진</label> 
					<input type="file" class="form-control" id="b_poster" name="b_poster">
				</div>
				<div class="oe_center">
					<button type="submit" class="btn btn-primary mt10">등록하기</button>
				</div>
			</form>

		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>