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
							<a href="noticeList" id="oe_white">NOTICE</a>
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
				<h2 class="oe_font primary-color">공지사항</h2>
			</div>
		</div>
		<div class="row oe_font_bold_fs25">
			<input type="hidden" id="n_no" name="n_no" value="<c:out value='${notice.n_no}'/>">
			<table class="table">
					<tr>
						<th colspan="2" class="oe_font_bold_25">[공지]&nbsp;${notice.n_title}</th>
						<th style="text-align: right;" class="oe_vcenter">
							작성일 : ${notice.n_regdate}&nbsp;
							<c:if test="${notice.n_updatedate != null}">
							수정일 : ${notice.n_updatedate}</c:if>
						</th>
					</tr>
					<tr>
						<td colspan="3" class="oe_vcenter"><pre class="mt10 fs18 oe_b_white">${notice.n_content }</pre></td>
					</tr>
				</table>
		</div>
	</div>
</div>

<div class="getBtnTwins" style="display: flex; justify-content: center; margin-top: 30px; margin-bottom: 30px;">
	<c:if test="${sessionScope.loginMember != null && sessionScope.loginMember.m_id == 'admin'}">
		<button type="button" class="btn btn-secondary" onclick="location.href='updateNotice?n_no=${notice.n_no }'">수정</button>
		<button type="button" class="btn btn-danger" onclick="deleteNotice(${notice.n_no});">삭제</button>
	</c:if>
	<button type="button" class="btn btn-primary oe_font_bold_18" onclick="location.href='noticeList'">목록</button>
</div>



<%@ include file="../footer.jsp"%>