<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<!--
	Aesthetic by gettemplates.co
	Twitter: http://twitter.com/gettemplateco
	URL: http://gettemplates.co
-->
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>o.e &mdash; 오늘 이런 수업 어때요?</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by GetTemplates.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="GetTemplates.co" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
	<!-- 구글 폰트 추가 2023-07-13 LJ -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="resources/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="resources/css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="resources/css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="resources/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="resources/css/magnific-popup.css">

	<!-- Bootstrap DateTimePicker -->
	<link rel="stylesheet" href="resources/css/bootstrap-datetimepicker.min.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="resources/css/style.css">
	<link rel="stylesheet" href="resources/oe_css/lesson/oe_style.css">
	<link rel="stylesheet" href="resources/oe_css/user/registerAgree.css">

	<!-- Modernizr JS -->
	<script src="resources/js/modernizr-2.6.2.min.js"></script>
	
	<!-- jQuery, sweetalert 추가 2023-07-13 LJ -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>	
	<script src="https://unpkg.com/sweetalert2@7.1.2/dist/sweetalert2.all.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css">

	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	<!-- oe_js 시작 -->
	<!-- 레슨 JS -->
	<script type="text/javascript" src="resources/oe_js/lesson/oe_lesson.js"></script>
	
	<!-- 회원가입 JS 시작 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="resources/oe_js/signup/jQuery.js"></script>
	<script type="text/javascript" src="resources/oe_js/signup/signup.js"></script>
	<script type="text/javascript" src="resources/oe_js/signup/addressCheck.js"></script>
	<!-- 회원가입 JS 끝 -->
	
	<!-- 공지사항 JS 시작 -->
	<script type="text/javascript" src="resources/oe_js/notice/oe_notice.js"></script>
	
	<!-- oe_js 끝 -->

	</head>
	<body>
		
	<div class="gtco-loader"></div>
	
	<div id="page">

	
	<!-- <div class="page-inner"> -->
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div id="gtco-logo"><a href="/e">o <em>.</em> e</a></div>
				</div>
				<div class="col-xs-8 text-right menu-1">
					<ul>
						<li><a href="lesson">Lessons</a></li>
						<!-- 
						<li class="has-dropdown">
							<a href="services.html">Information</a>
							<ul class="dropdown">
								<li><a href="#">Food Catering</a></li>
								<li><a href="#">Wedding Celebration</a></li>
								<li><a href="#">Birthday's Celebration</a></li>
							</ul>
						</li>
						-->
						<li><a href="boardList">Information</a></li>
						<li><a href="noticeList">Notice</a></li>
						<li class="btn-cta">
							<!-- 비로그인 상태 -->
							<c:if test="${sessionScope.loginMember.m_id == null}">
								<a href="registerAgree"><span>Sign Up</span></a>
							</c:if>
							<!-- 로그인 상태 -->
							<c:if test="${sessionScope.loginMember.m_id != null}">
								<c:if test="${sessionScope.loginMember.m_id != 'admin'}">
									<a href="myLesson"><span>My Lesson</span></a>
								</c:if>
							</c:if>
						</li>
					</ul>	
				</div>
			</div>
			
		</div>
	</nav>