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
										<label for="l_category" class="primary-color fs18"><b>무엇을 배우고 싶나요?</b></label> 
										<input type="text" class="form-control" id="l_category" name="l_category" placeholder="피아노, 작곡 등">
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
										<label for="l_pay" class="primary-color fs18"><b>레슨 비용(시간 당)</b></label><br> 
										<div class="w49_2 oe_center">
											<input type="number" id="l_pay_min" name="l_pay_min" class="form-control" placeholder="최소">
										</div>
										~
										<div class="w49_2 oe_center">
											<input type="number" id="l_pay_max" name="l_pay_max" class="form-control" placeholder="최대">
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
										<button type="button" class="btn btn-primary mt10" onclick="recommend('${sessionScope.loginMember.m_nickname }', '${sessionScope.loginMember.m_id }');">찾기</button>
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

<script type="text/javascript">
//레슨 추천
function recommend(m_nickname, m_id) {
	var l_location = $.trim($('#l_location').val());
	var l_type = $.trim($('#l_type').val());
	var l_category = $.trim($('#l_category').val());
	var l_level = $.trim($('#l_level').val());
	var l_pay_min = $.trim($('#l_pay_min').val());
	var l_pay_max = $.trim($('#l_pay_max').val());
	var l_day = "";
	var arr = [];
	$("input:checkbox[name='l_day']:checked").each(function(){
		l_day = $(this).val();
		arr.push(l_day);
	});
	
//	alert(l_location+l_type+l_category+l_level+l_pay_min+l_pay_max);
	l_day = arr.join(', ');
	let timerInterval
	Swal.fire({
	  title: m_nickname + '님께 맞는 레슨을 찾고 있어요.',
	  timer: 3000,
	  timerProgressBar: true,
	  didOpen: () => {
	    Swal.showLoading()
	    
	  },
	  willClose: () => {
	    clearInterval(timerInterval)
	  }
	}).then((result) => {
		$.ajax({
			url : "recommend",
			type : 'POST',
			data : {
				m_id : m_id,
				l_location : l_location,
				l_type : l_type,
				l_category : l_category,
				l_level : l_level,
				l_pay_min : l_pay_min,
				l_pay_max : l_pay_max,
				l_day : l_day
			},
    		success: function(data) {
    			let ar = [];

				for (var key in data) {
					//ar[key] = [data[key].l_teacher_id]
					//ar[key] = ['<a href="lessonDetail?l_num='+ data[key].l_num +'" style="display: inline-block">' 
					//		+ '<img src="storage/'+ data[key].lessonDetail.l_photo + '" style="width: 100px;">'
					//		+ data[key].l_teacher_id + '님</a>']
					
					ar[key] = [
						'<div class="w30"> <a href="lessonDetail?l_num=' + data[key].l_num + '" class="fh5co-card-item ">'
						
						+		'<img src="storage/' + data[key].lessonDetail.l_photo +'" alt="Image" class="w30">'
						
						+	'<div class="fh5co-text-r">'
						+		'<h2>' + data[key].member.m_nickname + '님</h2>'
						+	'</div>'
						+'</a>'
						+'</div>'
					]
				}
				
				let list = ar.join('&nbsp;');
    			
				if (ar.length != 0) {
    				Swal.fire({
   	                	title: m_nickname +'님!',
    	             	html: list +'<br>의 ' + l_category + ' 수업을 추천할게요!',
    	                showConfirmButton: false
    	            });
				} else {
					Swal.fire({
    	                title: '<span class="icon"> <i class="ti-face-sad"></i></span>',
    	                html : '현재 ' + m_id +'님에게 맞는 레슨이 아직 없어요:(',
    	                showConfirmButton: true,
    	                confirmButtonText: '닫기'
    	            });
				}
    		},
    		error : function(e) {
				Swal.fire({
	                icon: 'error',                         
	                title: '조회에 실패하였습니다.',
	                showConfirmButton: true,
	                confirmButtonText: '닫기'
	            });
    		}
    	});
	});
	
}

</script>

<%@ include file="../footer.jsp"%>