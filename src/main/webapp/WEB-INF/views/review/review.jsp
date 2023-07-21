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
						<h1 class="cursive-font">REVIEW</h1>
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
				<h2 class="oe_font primary-color"></h2>
			</div>
		</div>
		<div class="row">
			<c:if test="${empty reviews}">
				<h2 class="oe_font primary-color oe_center">등록된 리뷰가 없습니다.</h2>
			</c:if>
			<c:forEach var="r" items="${reviews }">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="javascript:reviewDetail(${r.r_num})" class="fh5co-card-item-r">
						<figure>
							<div class="overlay">
								<i class="ti-plus"></i>
							</div>
							
						</figure>
						<div class="fh5co-text-v">
							<div class="form-group oe_center" id="review" >
								<fieldset>
									<input type="radio" name="r_star" value="5" id="rate1"
										<c:if test="${r.r_star == 5 }">checked</c:if>>
									<label for="rate1">★</label>
									<input type="radio" name="r_star" value="4" id="rate2"
										<c:if test="${r.r_star == 4 }">checked</c:if>>
									<label for="rate2">★</label>
									<input type="radio" name="r_star" value="3" id="rate3"
										<c:if test="${r.r_star == 3 }">checked</c:if>>
									<label for="rate3">★</label>
									<input type="radio" name="r_star" value="2" id="rate4"
										<c:if test="${r.r_star == 2 }">checked</c:if>>
									<label for="rate4">★</label>
									<input type="radio" name="r_star" value="1" id="rate5"
										<c:if test="${r.r_star == 1 }">checked</c:if>>
									<label for="rate5">★</label>
								</fieldset>
							</div>
							
							<c:set var="t" value="
							"/>
							<h2 class="oe_font">${fn:split(r.r_content, t)[0] }</h2>
							<p><fmt:formatDate value="${r.r_regdate }" pattern="yyyy-MM-dd" /></p>
						</div>
					</a>
				</div>
			</c:forEach>

		</div>
		
		<!-- paging -->
		<div class="pageCount">
			<c:forEach var="p" begin="1" end="${pageCount }">
				<a href="review_paging?l_num=${l_num }&p=${p }">${p }</a>
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