<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<header id="gtco-header" class="gtco-cover gtco-cover-sm-v"
	role="banner" data-stellar-background-ratio="0.5">
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

<div id="gtco-header" class="gtco-section-v">
	<div class="gtco-container">
		<div class="row w100">

			<div class="mt-text animate-box" data-animate-effect="fadeInRight">
				<div class="form-wrap">
					<div class="tab">
						<div class="tab-content">
							<div class="tab-content-inner active">
								<p class="primary-color text-center oe_font_bold_25">
									<b>${sessionScope.loginMember.m_nickname }님께 맞는 레슨을 찾아드릴게요!</b>
								</p>
								<br><br>
								<form action="recommend" method="POST">
									<div class="form-group">
										<label for="l_location" class="primary-color fs18"><b>레슨을 희망하는 지역은 어디인가요?</b></label> 
										<input type="text" class="form-control" id="l_location" name="l_location">
									</div>
									<div class="form-group">
										<label for="l_type" class="primary-color fs18"><b>레슨 목적이 어떻게 되나요?</b></label> 
										<select class="form-control" id="l_type" name="l_type">
											<option style="color:black;">취미</option>
											<option style="color:black;">준비</option>
									 	</select>
									 </div>
									 <div class="form-group">
										<label for="l_type" class="primary-color fs18"><b>어느 정도의 레슨 수준을 원하나요?</b></label> 
										<select class="form-control" id="l_level" name="l_level">
											<option style="color:black;">초급</option>
											<option style="color:black;">중급</option>
											<option style="color:black;">고급</option>
									 	</select>
									 </div>
									 <div class="form-group">
										<label for="l_category" class="primary-color fs18"><b>무엇을 배우고 싶나요?</b></label> 
										<input type="text" class="form-control" id="l_category" name="l_category" placeholder="피아노, 작곡 등">
									</div>
									<div class="form-group">
										<label for="l_pay" class="primary-color fs18"><b>레슨 비용(시간 당)</b></label><br> 
										<div class="w49_2 oe_center">
											<input type="number" name="l_pay_min" class="form-control" placeholder="최소">
										</div>
										~
										<div class="w49_2 oe_center">
											<input type="number" name="l_pay_max" class="form-control" placeholder="최대">
										</div>
									</div>
									<div class="form-group">
										<label for="l_day" class="primary-color fs18"><b>레슨이 가능한 요일을 선택해 주세요.</b></label><br>
										<div class="oe_center primary-color fs18">
											<input type="checkbox" class="l_day" name="l_day" value="월요일">월요일
											<input type="checkbox" class="l_day" name="l_day" value="화요일">화요일
											<input type="checkbox" class="l_day" name="l_day" value="수요일">수요일
											<input type="checkbox" class="l_day" name="l_day" value="목요일">목요일
											<input type="checkbox" class="l_day" name="l_day" value="금요일">금요일
											<input type="checkbox" class="l_day" name="l_day" value="토요일">토요일
											<input type="checkbox" class="l_day" name="l_day" value="일요일">일요일
											<span class="l_day">|</span> 
											<input type="checkbox" class="l_day" name="l_day" value="조율">조율
										</div>
									</div>
									<div class="oe_center">
										<button type="submit" class="btn btn-primary mt10">찾기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<%@ include file="../footer.jsp"%>