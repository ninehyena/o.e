<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner"
	style="background-image: url(resources/images/img_bg_1.jpg)"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12 col-md-offset-0 text-left">


				<div class="row row-mt-15em">
					<div class="col-md-7 mt-text animate-box"
						data-animate-effect="fadeInUp">
						<span class="intro-text-small">음악을 배우고 싶은 당신을 위한 레슨 추천, <a href="/e">오늘 이런 레슨 어때요?</a></span>
						<h1 class="cursive-font oe_center">How about these lessons today?</h1>
					</div>
					<div class="col-md-4 col-md-push-1 animate-box"
						data-animate-effect="fadeInRight">
						<div class="form-wrap">
							<div class="tab">

								<div class="tab-content">
									<!-- 비로그인 상태 -->
									<c:if test="${sessionScope.loginMember.m_id == null}">
									<c:if test="${sessionScope.kakaoLoginMember.m_id == null}">
										<div class="tab-content-inner active" data-content="signup">
											<h2 class="primary-color"><b>로그인</b></h2>
											<form action="login" method="POST">
												<div class="row form-group">
													<div class="col-md-12">
														<label for="activities">User</label>
														<select name="#" id="activities" class="form-control">
															<option value="">User</option>
															<option value="">guest</option>
															<option value="">admin</option>
														</select>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="m_id">ID</label> 
														<input type="text" id="m_id" name="m_id" class="form-control">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="m_pw">Password</label> 
														<input type="password" id="m_pw" name="m_pw" class="form-control">
													</div>
												</div>

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary btn-block" value="로그인">
														<a href="idFind">ID 찾기</a> <a href="pwFind">PW 찾기</a>
														<!-- <input type="button" class="btn btn-primary btn-block" id="goRegisterBtn" value="회원가입"> -->
														<!-- 카카오 로그인 -->
														<a href="https://kauth.kakao.com/oauth/authorize?response_type=code
														&client_id=da627de1500bad51608594d4556e9751
														&redirect_uri=http://localhost/e/kakaoLogin">
														<img src="resources/images/kakao_login_medium_narrow.png" width="100%"
														    alt="카카오 로그인 버튼" /></a>
													</div>
												</div>
											</form>
										</div>
									</c:if>
									</c:if>
									
									<!-- 로그인 상태 -->
									<c:if test="${sessionScope.loginMember.m_id != null}">
										<div class="tab-content-inner active" data-content="memberInfo">
											<h2 class="primary-color">내정보</h2>
											
											<form action="mypage" method="POST">
												<div class="row form-group">
													<div class="col-md-12">
														<label>${sessionScope.loginMember.m_nickname }님</label> 
														<label>어서오세요.</label>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<span>${sessionScope.loginMember.m_id }</span>
													</div>
												</div>

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary btn-block" value="마이페이지"> 
														<input type="button" class="btn btn-primary btn-block" id="kakaoLogoutBtn" value="로그아웃">
													</div>
												</div>
											</form>
										</div>
									</c:if>
									
								</div>

							</div>
						</div>
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
				<h2 class="cursive-font primary-color">Popular Lessons</h2>
				<p>Dignissimos asperiores vitae velit veniam totam fuga
					molestias accusamus alias autem provident. Odit ab aliquam dolor
					eius.</p>
			</div>
		</div>
		<div class="row">

			<div class="col-lg-4 col-md-4 col-sm-6">
				<a href="images/img_1.jpg" class="fh5co-card-item image-popup">
					<figure>
						<div class="overlay">
							<i class="ti-plus"></i>
						</div>
						<img src="images/img_1.jpg" alt="Image" class="img-responsive">
					</figure>
					<div class="fh5co-text">
						<h2>Fresh Mushrooms</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia..</p>
						<p>
							<span class="price cursive-font">$19.15</span>
						</p>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<a href="images/img_2.jpg" class="fh5co-card-item image-popup">
					<figure>
						<div class="overlay">
							<i class="ti-plus"></i>
						</div>
						<img src="images/img_2.jpg" alt="Image" class="img-responsive">
					</figure>
					<div class="fh5co-text">
						<h2>Cheese and Garlic Toast</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia..</p>
						<p>
							<span class="price cursive-font">$20.99</span>
						</p>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<a href="images/img_3.jpg" class="fh5co-card-item image-popup">
					<figure>
						<div class="overlay">
							<i class="ti-plus"></i>
						</div>
						<img src="images/img_3.jpg" alt="Image" class="img-responsive">
					</figure>
					<div class="fh5co-text">
						<h2>Grilled Chiken Salad</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia..</p>
						<p>
							<span class="price cursive-font">$8.99</span>
						</p>

					</div>
				</a>
			</div>


			<div class="col-lg-4 col-md-4 col-sm-6">
				<a href="images/img_4.jpg" class="fh5co-card-item image-popup">
					<figure>
						<div class="overlay">
							<i class="ti-plus"></i>
						</div>
						<img src="images/img_4.jpg" alt="Image" class="img-responsive">
					</figure>
					<div class="fh5co-text">
						<h2>Organic Egg</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia..</p>
						<p>
							<span class="price cursive-font">$12.99</span>
						</p>
					</div>
				</a>
			</div>

			<div class="col-lg-4 col-md-4 col-sm-6">
				<a href="images/img_5.jpg" class="fh5co-card-item image-popup">
					<figure>
						<div class="overlay">
							<i class="ti-plus"></i>
						</div>
						<img src="images/img_5.jpg" alt="Image" class="img-responsive">
					</figure>
					<div class="fh5co-text">
						<h2>Tomato Soup with Chicken</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia..</p>
						<p>
							<span class="price cursive-font">$23.10</span>
						</p>
					</div>
				</a>
			</div>

			<div class="col-lg-4 col-md-4 col-sm-6">
				<a href="images/img_6.jpg" class="fh5co-card-item image-popup">
					<figure>
						<div class="overlay">
							<i class="ti-plus"></i>
						</div>
						<img src="images/img_6.jpg" alt="Image" class="img-responsive">
					</figure>
					<div class="fh5co-text">
						<h2>Salad with Crispy Chicken</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia..</p>
						<p>
							<span class="price cursive-font">$5.59</span>
						</p>
					</div>
				</a>
			</div>

		</div>
	</div>
</div>

<div id="gtco-features">
	<div class="gtco-container">
		<div class="row">
			<div
				class="col-md-8 col-md-offset-2 text-center gtco-heading animate-box">
				<h2 class="cursive-font">Our Services</h2>
				<p>Dignissimos asperiores vitae velit veniam totam fuga
					molestias accusamus alias autem provident. Odit ab aliquam dolor
					eius.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-sm-6">
				<div class="feature-center animate-box" data-animate-effect="fadeIn">
					<span class="icon"> <i class="ti-face-smile"></i>
					</span>
					<h3>Happy People</h3>
					<p>Dignissimos asperiores vitae velit veniam totam fuga
						molestias accusamus alias autem provident. Odit ab aliquam dolor
						eius.</p>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="feature-center animate-box" data-animate-effect="fadeIn">
					<span class="icon"> <i class="ti-thought"></i>
					</span>
					<h3>Creative Culinary</h3>
					<p>Dignissimos asperiores vitae velit veniam totam fuga
						molestias accusamus alias autem provident. Odit ab aliquam dolor
						eius.</p>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="feature-center animate-box" data-animate-effect="fadeIn">
					<span class="icon"> <i class="ti-truck"></i>
					</span>
					<h3>Food Delivery</h3>
					<p>Dignissimos asperiores vitae velit veniam totam fuga
						molestias accusamus alias autem provident. Odit ab aliquam dolor
						eius.</p>
				</div>
			</div>


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

<div id="gtco-counter" class="gtco-section">
	<div class="gtco-container">

		<div class="row">
			<div
				class="col-md-8 col-md-offset-2 text-center gtco-heading animate-box">
				<h2 class="cursive-font primary-color">Fun Facts</h2>
				<p>Dignissimos asperiores vitae velit veniam totam fuga
					molestias accusamus alias autem provident. Odit ab aliquam dolor
					eius.</p>
			</div>
		</div>

		<div class="row">

			<div class="col-md-3 col-sm-6 animate-box"
				data-animate-effect="fadeInUp">
				<div class="feature-center">
					<span class="counter js-counter" data-from="0" data-to="5"
						data-speed="5000" data-refresh-interval="50">1</span> <span
						class="counter-label">Avg. Rating</span>

				</div>
			</div>
			<div class="col-md-3 col-sm-6 animate-box"
				data-animate-effect="fadeInUp">
				<div class="feature-center">
					<span class="counter js-counter" data-from="0" data-to="43"
						data-speed="5000" data-refresh-interval="50">1</span> <span
						class="counter-label">Food Types</span>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 animate-box"
				data-animate-effect="fadeInUp">
				<div class="feature-center">
					<span class="counter js-counter" data-from="0" data-to="32"
						data-speed="5000" data-refresh-interval="50">1</span> <span
						class="counter-label">Chef Cook</span>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 animate-box"
				data-animate-effect="fadeInUp">
				<div class="feature-center">
					<span class="counter js-counter" data-from="0" data-to="1985"
						data-speed="5000" data-refresh-interval="50">1</span> <span
						class="counter-label">Year Started</span>

				</div>
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

<%@ include file="footer.jsp"%>