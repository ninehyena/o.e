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
						<h1 class="cursive-font">VEGETABLES</h1>
					</div>
				</div>

			</div>
		</div>
	</div>
</header>



<div class="gtco-section-v">
	<div class="gtco-container">
		<div class="row">
			  <form class="form-inline oe_float_right">
			    <input class="form-control mr-sm-2" type="search" placeholder="채소 찾기">
			    <button class="btn btn-primary" type="submit">Search</button>
			  </form>
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
				<h2 class="cursive-font primary-color">Popular Vegetables</h2>
				<p>Dignissimos asperiores vitae velit veniam totam fuga
					molestias accusamus alias autem provident. Odit ab aliquam dolor
					eius.</p>
			</div>
		</div>
		<div class="row">
		
			<c:forEach var="l" items="${List }">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="detail" class="fh5co-card-item ">
						<figure>
							<div class="overlay">
								<i class="ti-plus"></i>
							</div>
							<img src="images/img_1.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text-v">
							<h2>${l.v_name }</h2>
							<p>1회 제공량: ${l.v_gram }g / ${l.v_kcal }kcal</p>
							<p>탄수화물: ${l.v_carbohydrate}g / 나트륨: ${l.v_natrium }mg <br> 당류: ${l.v_sugar }g</p>
							
							
						</div>
					</a>
				</div>
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