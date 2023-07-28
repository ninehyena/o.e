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
							<a href="board" id="oe_white">INFORMATION</a>
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
				<h2 class="oe_font primary-color">정보 게시판</h2>
			</div>
		</div>
		<div class="row oe_font_bold_fs25">
			<input type="hidden" id="b_no" name="b_no" value="<c:out value='${board.b_no}'/>">
			<table class="table">
					<tr>
						<th class="oe_font_bold_25">[${board.b_category}]&nbsp;${board.b_title}</th>
					</tr>
					<tr>	
						<th style="text-align: right;" class="oe_vcenter">
							작성일 : ${board.b_regdate}&nbsp;
							<c:if test="${board.b_updatedate != null}">
							수정일 : ${board.b_updatedate}</c:if>
						</th>
					</tr>
					<tr>
						<td class="oe_vcenter">
							<div class="w100 oe_center">
								<img src="storage/${board.b_poster }" class="photo">
							</div>
							<pre class="mt10 fs18 oe_b_white w100">${board.b_content }</pre>
						</td>
					</tr>
				</table>
		</div>
	</div>
</div>

<div class="getBtnTwins" style="display: flex; justify-content: center; margin-top: 30px; margin-bottom: 30px;">
	<c:if test="${sessionScope.loginMember != null && sessionScope.loginMember.m_id == 'admin'}">
		<button type="button" class="btn btn-secondary" onclick="location.href='updateBoard?b_no=${board.b_no }'">수정</button>
		<button type="button" class="btn btn-danger" onclick="deleteBoard(${board.b_no});">삭제</button>
	</c:if>
	<button type="button" class="btn btn-primary" onclick="location.href='board'">목록</button>
</div>

<%@ include file="../footer.jsp"%>