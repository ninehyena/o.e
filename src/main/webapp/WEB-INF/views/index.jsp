<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12 col-md-offset-0 text-left">

				<div class="row row-mt-15em">
					<div class="col-md-7 mt-text animate-box"
						data-animate-effect="fadeInUp">
						<span class="intro-text-small">음악을 배우고 싶은 당신을 위한 레슨 추천, <a href="/e">오늘 이런 레슨 어때요?</a></span>
						<h1 class="cursive-font">How about these lessons today?</h1>
					</div>
					
					<!-- 비로그인 상태 -->
					<c:if test="${sessionScope.loginMember.m_id == null}">
						<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">
									<div class="tab-content">
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
													<div class="col-md-12 oe_center">
														<input type="submit" class="btn btn-primary btn-block" value="로그인"> 
														<!-- <input type="button" class="btn btn-primary btn-block" id="goSignupBtn" value="회원가입"> -->
                            							
                            							<hr>
                            							<!-- 카카오 로그인 -->
														<a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=da627de1500bad51608594d4556e9751
														&redirect_uri=http://localhost/e/kakaoLogin&response_type=code">
														  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" 
														    alt="카카오 로그인 버튼" />
														</a>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				
					<!-- 로그인 상태 -->
					<c:if test="${sessionScope.loginMember.m_id != null}">
						<div class="col-md-4 mt-text col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">
									<div class="tab-content">
										<div class="tab-content-inner active" data-content="memberInfo">
											<h2 class="primary-color"><b>${sessionScope.loginMember.m_nickname }님!</b></h2>
											
											<form action="mypage" method="POST">
												<div class="row form-group">
													<div class="col-md-12">
														<label>${sessionScope.loginMember.m_nickname }님</label> 
														<label>어서오세요.</label>
														<c:if test="${cnt == 1 }">
															<label>현재 수강 중인 수업이 없네요.</label><br>
														
															<a href="recommend">레슨을 추천해 드릴까요?</a>
														</c:if>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<span>${sessionScope.loginMember.m_id }</span>
													</div>
												</div>
	
												<div class="row form-group">
													<div class="col-md-12">
														<c:if test="${sessionScope.loginMember.m_id != 'admin'}">
															<input type="submit" class="btn btn-primary btn-block" value="마이페이지"> 
														</c:if>
														<input type="button" class="btn btn-primary btn-block" id="logoutBtn" value="로그아웃">
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
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
				<p>이번 주에 신청한 회원이 가장 많은 레슨이에요.</p>
			</div>
		</div>
		<div class="row">
			<div id="chartContainer2" style="height: 370px; width: 100%;"></div>
		</div>
		<div class="row">

			<c:forEach var="p" items="${popular }">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="lessonDetail?l_num=${p.l_num}" class="fh5co-card-item">
						<figure>
							<div class="overlay">
								<i class="ti-plus"></i>
							</div>
							<img src="images/${p.l_category }.png" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text-i">
							<h2>${p.l_teacher_id }님의 ${p.l_category }수업</h2>
							<p>레슨 타입 : ${p.l_type } / 레슨 레벨 : ${p.l_level }
							<br>레슨 비용 : ${p.lessonDetail.l_pay }원 / 시간당
							</p>
							<p>이번 주에 <span class="primary-color">${p.applicationList.cnt }명</span>이 신청했어요.</p>
						</div>
					</a>
				</div>
			</c:forEach>

		</div>
	</div>
</div>

<div id="gtco-features">
	<div class="gtco-container">
		<div class="row">
			<div
				class="col-md-8 col-md-offset-2 text-center gtco-heading animate-box">
				<h2 class="cursive-font">Our Services</h2>
				<p>O.E에서는 이런 서비스를 제공하고 있어요.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-sm-6">
				<div class="feature-center animate-box" data-animate-effect="fadeIn">
					<span class="icon"> <i class="ti-link"></i>
					</span>
					<h3>Lesson Matching</h3>
					<p>회원님께서 원하는 레슨을 진행할 수 있도록 저희가 매칭을 도와드릴게요.</p>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="feature-center animate-box" data-animate-effect="fadeIn">
					<span class="icon"> <i class="ti-thought"></i>
					</span>
					<h3>Share Experience</h3>
					<p>레슨에 대한 경험을<br>리뷰를 통해 나누어 보세요.</p>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="feature-center animate-box" data-animate-effect="fadeIn">
					<span class="icon"> <i class="ti-info"></i>
					</span>
					<h3>A Variety Of Information</h3>
					<p>Information 메뉴에서<br>공연, 악기, 연주회 등의<br>다양한 정보를 확인해 보세요.</p>
				</div>
			</div>


		</div>
	</div>
</div>


<div class="gtco-cover gtco-cover-sm"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="gtco-container text-center">
		<div class="display-t">
			<div class="display-tc">
				<h1>&ldquo; Our high quality of service makes you back over
					and over again!&rdquo;</h1>
				<p>&mdash; Team sobakee </p>
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
			<div id="chartContainer" style="height: 370px; width: 100%;"></div>
		</div>

		<div class="row">

			<div class="col-md-3 col-sm-6 animate-box"
				data-animate-effect="fadeInUp">
				<div class="feature-center">
					<span class="counter js-counter" data-from="0" data-to="5"
						data-speed="2000" data-refresh-interval="50">100</span> <span
						class="counter-label">Avg. Rating</span>

				</div>
			</div>
			<div class="col-md-3 col-sm-6 animate-box"
				data-animate-effect="fadeInUp">
				<div class="feature-center">
					<span class="counter-label">총</span>
					<span class="counter js-counter" data-from="0" data-to="${allLessonCount }"
						data-speed="2000" data-refresh-interval="50">1</span> 
					<span class="counter-label">개의 레슨</span>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 animate-box"
				data-animate-effect="fadeInUp">
				<div class="feature-center">
					<span class="counter-label">총</span>
					<span class="counter js-counter" data-from="0" data-to="${countR }"
						data-speed="2000" data-refresh-interval="50">1</span> 
						<span class="counter-label">개의 리뷰</span>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 animate-box"
				data-animate-effect="fadeInUp">
				<div class="feature-center">
				<span class="counter-label">총</span>
					<span class="counter js-counter" data-from="0" data-to="${countA }"
						data-speed="2000" data-refresh-interval="50">1</span> 
					<span class="counter-label">번의 레슨 진행</span>
				</div>
			</div>

		</div>
		
	</div>
</div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
	window.onload = function () {
	
		
		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled: true,
			exportEnabled: true,
			theme: "light1", // "light1", "light2", "dark1", "dark2"
		  	axisY: {
		      includeZero: true
		    },
			data: [{
				type: "column", //change type to bar, line, area, pie, etc
				//indexLabel: "{y}", //Shows y value on all Data Points
				indexLabelFontColor: "#5A5757",
		      	indexLabelFontSize: 16,
				indexLabelPlacement: "outside",
				color: "#FBB448",
				dataPoints: [
					{ label: '??', y: 100 },
					{ label: '총 레슨 갯수', y: ${allLessonCount } },
					{ label: '누적 리뷰 수', y: ${countR } },
					{ label: '레슨 진행 누적 횟수', y: ${countA } }
				]
			}]
	
		});
		chart.render();
		
		var chart2 = new CanvasJS.Chart("chartContainer2", {
			animationEnabled: true,
			title:{
				// text: "Email Categories",
				horizontalAlign: "left"
			},
			data: [{
				type: "doughnut",
				startAngle: 60,
				//innerRadius: 60,
				indexLabelFontSize: 17,
				indexLabel: "{label} - #percent%",
				toolTipContent: "<b>{label}:</b> {y} (#percent%)",
				dataPoints: [
					{ y: 67, label: "Inbox" },
					{ y: 28, label: "Archives" },
					{ y: 10, label: "Labels" },
					{ y: 7, label: "Drafts"},
					{ y: 15, label: "Trash"},
					{ y: 6, label: "Spam"}
				]
			}]
		});
		chart2.render();

	}
</script>
<%@ include file="footer.jsp"%>