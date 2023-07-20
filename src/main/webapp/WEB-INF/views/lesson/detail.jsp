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
<<<<<<< HEAD
				<h2 class="oe_font primary-color">${lesson.l_teacher_id }님의 ${lesson.l_category }레슨을 소개할게요 !</h2>
			</div>
		</div>
		<div class="row">
			<!-- Tab을 구성할 영역 설정-->
		  	<div>
			    <!-- Tab 영역 태그는 ul이고 클래스는 nav와 nav-tabs를 설정한다. -->
			    <ul class="nav nav-tabs nav-justified oe_font_bold_18">
					<!-- Tab 아이템이다. 태그는 li과 li > a이다. li태그에 active는 현재 선택되어 있는 탭 메뉴이다. -->
					<li class="active"><a href="#info" data-toggle="tab">수업 소개</a></li>
					<!-- a 태그의 href는 아래의 tab-content 영역의 id를 설정하고 data-toggle 속성을 tab으로 설정한다. -->
					<li><a href="#profile" data-toggle="tab">강사 학력 / 이력</a></li>
			    </ul>
		    
			    <!-- Tab이 선택되면 내용이 보여지는 영역이다. -->
			    <!-- 태그는 div이고 class는 tab-content로 설정한다. -->
			    <div class="tab-content lesson">
					<!-- 각 탭이 선택되면 보여지는 내용이다. 태그는 div이고 클래스는 tab-pane이다. -->
					<!-- active 클래스는 현재 선택되어 있는 탭 영역이다. -->
					<!-- 수업 소개 탭 -->
					<div class="tab-pane fade in active" id="info">
						<img src="images/checkbox.png" class="checkbox">
						<span class="checkbox_text">${lesson.l_teacher_id }님이 수업을 진행해요!</span>
						<br>
						<img src="images/checkbox.png" class="checkbox">
						<span class="checkbox_text">제 수업은 ${detail.l_location }에서 진행할 예정이에요!</span>
						<br>
						<img src="images/checkbox.png" class="checkbox">
						<c:if test="${detail.l_room == '개인 연습실'}">
							<span class="checkbox_text">${detail.l_room }이 있어요!</span>
						</c:if>
						<c:if test="${detail.l_room == '연습실 대관'}">
							<span class="checkbox_text">연습실을 대관해야 해요!</span>
						</c:if>
						<c:if test="${detail.l_room == '기타'}">
							<span class="checkbox_text">레슨 장소는 편한 곳으로 서로 협의해요!</span>
						</c:if>
						<br>
						<img src="images/checkbox.png" class="checkbox">
						<c:if test="${lesson.l_type == '취미'}">
							<span class="checkbox_text">${lesson.l_category }를 ${lesson.l_type}로 배우고 싶은 분께 맞는 수업이에요!</span>
						</c:if>
						<c:if test="${lesson.l_type == '준비'}">
							<span class="checkbox_text">${lesson.l_category }를 전문적으로 배우고 싶은 분께 맞는 수업이에요!</span>
						</c:if>
						<br>
						<img src="images/checkbox.png" class="checkbox">
						<span class="checkbox_text">제 수업은 ${lesson.l_level } 레벨의 수강생분이 함께 하기 적합해요!</span>
						<br>
						<img src="images/checkbox.png" class="checkbox">
						<c:if test="${detail.l_day == '조율 가능'}">
							<span class="checkbox_text">수업 요일은 조율이 가능해요!</span>
						</c:if>
						<c:if test="${not fn:contains(detail.l_day, '조율 가능')}">
						<span class="checkbox_text">${detail.l_day }에 수업이 가능해요!</span>
						</c:if>
						<br>
						<img src="images/won.png" class="checkbox">
						<span class="checkbox_text">레슨 비용은 시간 당  <fmt:formatNumber value="${detail.l_pay}" pattern="#,###"/>원이에요!</span>
						<br>
						<pre class="mt10 fs18"><c:out value="${detail.l_content }"/></pre>
					</div>
					
					<!-- id는 고유한 이름으로 설정하고 tab의 href와 연결되어야 한다. -->
					<!-- 강사 학력 / 이력 탭 -->
					<div class="tab-pane fade" id="profile">
					<h2 class="oe_font2 primary-color">학력</h2>
						<c:if test="${detail.l_level_of_education1 == null || (detail.l_level_of_education2 == null && detail.l_major == null)}">
							<img src="images/graduation.png" class="checkbox">
							<span class="checkbox_text">작성된 내용이 없습니다.</span>
							<br>
						</c:if>
						<c:if test="${detail.l_level_of_education1 != null}">
							<img src="images/graduation.png" class="checkbox">
							<span class="checkbox_text">${detail.l_level_of_education1} 졸업</span>
							<br>
						</c:if>
						<c:if test="${detail.l_level_of_education2 != null && detail.l_major != null}">
							<img src="images/graduation.png" class="checkbox">
							<span class="checkbox_text">${detail.l_level_of_education2} ${detail.l_major } 전공</span>
							<br>
						</c:if>
						<br><br>
						
						<h2 class="oe_font2 primary-color">이력</h2>
						<c:if test="${detail.l_career1 == null && detail.l_career2 == null && detail.l_career3 == null}">
							<img src="images/paper.png" class="checkbox">
							<span class="checkbox_text">작성된 내용이 없습니다.</span>
							<br>
						</c:if>
						<c:if test="${detail.l_career1 != null}">
							<img src="images/paper.png" class="checkbox">
							<span class="checkbox_text">${detail.l_career1}</span>
							<br>
						</c:if><c:if test="${detail.l_career2 != null}">
							<img src="images/paper.png" class="checkbox">
							<span class="checkbox_text">${detail.l_career2}</span>
							<br>
						</c:if>
						<c:if test="${detail.l_career3 != null}">
							<img src="images/paper.png" class="checkbox">
							<span class="checkbox_text">${detail.l_career3}</span>
							<br>
						</c:if>
					</div>
					
					<!-- fade 클래스는 선택적인 사항으로 트랜지션(transition)효과가 있다.
					<!-- in 클래스는 fade 클래스를 선언하여 트랜지션효과를 사용할 때 in은 active와 선택되어 있는 탭 영역의 설정이다. -->
			    </div>
			</div>
			<form>
				<input type="hidden" name="l_num" value="${lesson.l_num }">
				<c:if test="${sessionScope.loginMember.m_id != null && sessionScope.loginMember.m_id eq lesson.l_teacher_id}">
					<div class="row">
						<button type="button" class="btn btn-danger oe_font_bold_18 oe_float_right" onclick="deleteL(${lesson.l_num });">삭제</button>
						<button type="button" class="btn btn-secondary oe_font_bold_18 oe_float_right" onclick="updateL(${lesson.l_num });">수정</button>
					</div>
				</c:if>
				<c:if test="${sessionScope.loginMember.m_id != null && sessionScope.loginMember.m_lesson eq 'not_lesson'}">
					<div class="row oe_center">
						<c:if test="${list == null }">
							<button type="button" class="btn btn-primary oe_font_bold_18" onclick="apply(${lesson.l_num });">신청하기</button>
						</c:if>
						<c:if test="${list.a_status == 0 }">
							<button type="button" class="btn btn-primary oe_font_bold_18" onclick="cancel(${lesson.l_num});">신청 취소</button>
						</c:if>
						<c:if test="${list.a_status == 1 }">
							<p>회원님께서 진행 중인 수업이에요.</p>
							<!-- <button type="button" class="btn btn-primary oe_font_bold_18" onclick="cancel(${lesson.l_num});">신청 취소</button> -->
						</c:if>
						<c:if test="${list.a_status == 2 }">
							<p>회원님께서 수강을 완료하신 수업이에요.</p>
							<c:if test="${check == 0 }">
								<button type="button" class="btn btn-primary oe_font_bold_18" onclick="writeReview(${lesson.l_num});">리뷰 작성</button>
							</c:if>
							<c:if test="${check == 1 }">
								<button type="button" class="btn btn-secondary oe_font_bold_18">리뷰 작성 완료</button>
							</c:if>
						</c:if>
					</div>
				</c:if>
			</form>
		</div>
	</div>
</div>

<div id="gtco-features">
	<div class="gtco-container">
		<div class="row">
			<div
				class="col-md-8 col-md-offset-2 text-center gtco-heading animate-box">
				<h2 class="cursive-font">Review</h2>
				<p>수강생분들이 남겨주신 후기를 확인해 보세요</p>
				<a><p>→ 더보기</p></a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-sm-6">
				<div class="feature-center animate-box" data-animate-effect="fadeIn">
					<span class="icon"> <i class="ti-star"></i>
					</span>
					<h2 class="cursive-font oe_white">${avg } / 5.0</h2>
					<p>${lesson.l_teacher_id }님의 수업을 들은 수강생분들이<br>남겨주신 평점이에요.</p>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="feature-center animate-box" data-animate-effect="fadeIn">
					<span class="icon"> <i class="ti-thumb-up"></i>
					</span>
					<h2 class="oe_white">Creative Culinary</h2>
					<p>Dignissimos asperiores vitae velit veniam totam fuga
						molestias accusamus alias autem provident. Odit ab aliquam dolor
						eius.</p>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div class="feature-center animate-box" data-animate-effect="fadeIn">
					<span class="icon"> <i class="ti-face-smile"></i>
					</span>
					<h2 class="oe_white">뭘 넣을까</h2>
					<p>Dignissimos asperiores vitae velit veniam totam fuga
						molestias accusamus alias autem provident. Odit ab aliquam dolor
						eius.</p>
				</div>
			</div>

			
=======
				<h2 class="cursive-font primary-color">Popular Vegetables</h2>
				<p>Dignissimos asperiores vitae velit veniam totam fuga
					molestias accusamus alias autem provident. Odit ab aliquam dolor
					eius.</p>
			</div>
		</div>
		<div class="row">
			채소 상세보기 내용
			
		</div>
	</div>
</div>

<div id="gtco-features">
	<div class="gtco-container">
		<div class="row">
			<div
				class="col-md-8 col-md-offset-2 text-center gtco-heading animate-box">
				<h2 class="cursive-font">Recipe</h2>
				<p>~~를 활용한 대표적인 레시피를 추천드려요!</p>
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

>>>>>>> refs/remotes/origin/LJ

		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>