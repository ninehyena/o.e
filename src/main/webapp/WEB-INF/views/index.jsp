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
					<c:if test="${sessionScope.kakaoLoginMember.m_id == null}">
						<div class="col-md-4 mt-text2 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">
									<div class="tab-content">
										<div class="tab-content-inner active" data-content="signup">
											<h2 class="primary-color"><b>로그인</b></h2>
											<form action="login" method="POST">
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
														<a href="idFind">ID 찾기</a> <a href="pwFind">PW 찾기</a>
														<!-- <input type="button" class="btn btn-primary btn-block" id="goSignupBtn" value="회원가입"> -->
                            							
                            							<hr>
                            							<!-- 카카오 로그인 -->
														<a href="https://kauth.kakao.com/oauth/authorize?response_type=code
														&client_id=da627de1500bad51608594d4556e9751
														&redirect_uri=http://localhost/e/kakaoLogin">
														<img src="resources/images/kakao_login_medium_narrow.png"
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
					</c:if>
				
					<!-- 로그인 상태 -->
					<c:if test="${sessionScope.loginMember.m_id != null}">
						<div class="col-md-4 mt-text col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">
									<div class="tab-content">
										<div class="tab-content-inner active" data-content="memberInfo">
											<h2 class="primary-color">
												<b>
													<c:if test="${sessionScope.memberBadgeCheck >= 3}">
														<img alt="bronze_badge" src="resources/images/officialMark.png">
													</c:if>
													${sessionScope.loginMember.m_nickname }님!
												</b>
											</h2>
											
											<form action="mypage" method="POST">
												<div class="row form-group">
													<div class="col-md-12">
														<c:if test="${sessionScope.loginMember.m_lesson == 'not_lesson'}">
															<c:if test="${cnt == 1 }">
																<label>현재 수강 중인 레슨이 없네요.</label><br>
																<a href="recommend">레슨을 추천해 드릴까요?</a>
															</c:if>
															<c:if test="${cnt == 0 }">
																<label>현재 레슨을 수강하고 있어요.</label><br>
															</c:if>
														</c:if>
														<c:if test="${sessionScope.loginMember.m_lesson == 'lesson'}">
															<c:if test="${notRegLesson == 1 }">
																<label>아직 등록한 레슨이 없네요.</label><br>
																<a href="regLesson">레슨을 등록해 보세요!</a>
															</c:if>
															<c:if test="${notRegLesson == 0 }">
																<c:if test="${cnt != 0 }">
																	<label>신규 신청이 존재하는 레슨이 있어요.</label><br>
																	<a href="myLesson">신청을 수락해 주세요.</a>
																</c:if>
																<c:if test="${cnt == 0 }">
																	<label>신규 신청이 존재하는 레슨이 없어요.</label>
																</c:if>
															</c:if>
														</c:if>
													</div>
												</div>
	
												<div class="row form-group">
													<div class="col-md-12">
														<c:if test="${sessionScope.loginMember.m_id != 'admin'}">
															<input type="submit" class="btn btn-primary btn-block" value="마이페이지"> 
														</c:if>
														<input type="button" class="btn btn-primary btn-block" id="kakaoLogoutBtn" value="로그아웃">
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
		
		<div class="row mb40">
			<input type="hidden" id="popular" value="${popular }">
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
							<h2><c:if test="${p.lessonDetail.l_student >= 3}">
									<img alt="officialMark" src="resources/images/officialMark.png">
								</c:if>${p.l_teacher_id }님의 ${p.l_category }수업</h2>
							<p>레슨 타입 : ${p.l_type } / 레슨 레벨 : ${p.l_level }
							<br>레슨 비용 : ${p.lessonDetail.l_pay }원 / 시간당
							</p>
							<p>이번 주에 <span class="primary-color">${p.applicationList.cnt }명</span>이 신청했어요.</p>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
		
		<div class="row gtco-heading">
			<h2 class="primary-color oe_center oe_font">카테고리별 수강생 비율</h2>
			<div id="chartContainer2" style="height: 370px; width: 100%;"></div>
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
				<h2 class="cursive-font primary-color">Statistics</h2>
				<p>o.e 사용자 기반의 데이터 통계를 확인해 보세요.</p>
			</div>
		</div>
		
		<div class="row">
			<div id="chartContainer" style="height: 370px; width: 100%;"></div>
		</div>

		<div class="row" style="margin-left: 10px; margin-right: 10px; width: 100%;">

		
			<div class="col-md-3 col-sm-3 animate-box"
				data-animate-effect="fadeInUp">
				<div class="feature-center">
					<span class="counter-label">총</span>
					<span class="counter js-counter" data-from="0" data-to="${allLessonCount }"
						data-speed="2000" data-refresh-interval="50">1</span> 
					<span class="counter-label">개의 레슨</span>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 animate-box"
				data-animate-effect="fadeInUp">
				<div class="feature-center">
				<span class="counter-label">총</span>
					<span class="counter js-counter" data-from="0" data-to="${countA }"
						data-speed="2000" data-refresh-interval="50">1</span> 
					<span class="counter-label">번의 레슨 진행</span>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 animate-box"
				data-animate-effect="fadeInUp">
				<div class="feature-center">
					<span class="counter-label">총</span>
					<span class="counter js-counter" data-from="0" data-to="${countR }"
						data-speed="2000" data-refresh-interval="50">1</span> 
						<span class="counter-label">개의 리뷰</span>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 animate-box"
				data-animate-effect="fadeInUp">
				<div class="feature-center">
					<span class="counter-label">총</span>
					<span class="counter js-counter" data-from="0" data-to="${countR }"
						data-speed="2000" data-refresh-interval="50">1</span> 
						<span class="counter-label">번의 추천</span>
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
					{ y: ${allLessonCount } },
					{ y: ${countA } },
					{ y: ${countR } },
					{ y: ${countRec } }
				]
			}]
	
		});
		chart.render();

		
    	$.ajax({
			url : "popularLesson",
			type : 'GET',
    		success: function(data) {
    			let ar = [];
    			let l = [];
				let d = [];
				
    			for (var key in data) {
    				ar[key] = {
    					label: data[key].l_category,
    					y : data[key].applicationList.cnt
    				}
    				
    				d[key] = data[key].applicationList.cnt
    			}
    			
    			CanvasJS.addColorSet("customColors1", ["#ff6384", "#36a2eb", "#ffce56", "#37ED54", "#DB51ED", "#09E1F0"]);
    			var chart2 = new CanvasJS.Chart("chartContainer2", {
    				colorSet: "customColors1",
    				animationEnabled: true,
    				
    				  legend: {
    				  	verticalAlign: "top"
    				  },
    				data: [{
    					type: "doughnut",
    					startAngle: 60,
    					innerRadius: 60,
    					indexLabelFontSize: 17,
    					indexLabel: "{label} - #percent%",
    					toolTipContent: "<b>{label}:</b> {y}명 (#percent%)",
    					dataPoints: ar,
    					margin: 30
    				}]
    			});
    			chart2.render();
    		}
    	});
    	
		

	}
</script>
<%@ include file="footer.jsp"%>