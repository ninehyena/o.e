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
							<a href="noticeList" id="oe_white">NOTICE</a>
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
				<h2 class="cursive-font primary-color">Register Notice</h2>
			</div>
		</div>
		<div class="row">

			<form action="updateNotice.do" method="POST">
				<input type="hidden" id="n_no" name="n_no" value="<c:out value='${notice.n_no}'/>">
				<div class="form-group">
					<label for="n_title">공지 제목</label> 
					<input type="text" class="form-control" id="n_title" name="n_title" value='<c:out value="${notice.n_title}" />'>
				</div>
				<div class="form-group">
					<label for="n_content">공지 내용</label> 
					<textarea class="form-control" id="n_content" name="n_content" rows="10"><c:out value="${notice.n_content}" /></textarea>
				</div>
				<div class="oe_center">
					<button type="submit" class="btn btn-primary mt10">수정 완료</button>
				</div>
			</form>

		</div>
	</div>
</div>


<%@ include file="../footer.jsp"%>