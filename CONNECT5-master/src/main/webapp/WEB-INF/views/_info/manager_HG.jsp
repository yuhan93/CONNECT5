<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Info/manager.css">
<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img
			src="${pageContext.request.contextPath}/assets/img/managerimg1.PNG"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<!-- 가운데 영역 -->
	<div class="center">
	
		<div class="col-md-2">
			<!-- 패널 타이틀1 -->
			<div class="left_sidebar">
				<h3 class="title">연-결 소개</h3>
				<!-- 사이드바 메뉴목록1 -->
				<div class="list-group">
					<a href="${pageContext.request.contextPath}/_info/IntroWebsite_YB.do"
						class="list-group-item">사이트 소개</a> <a
						href="${pageContext.request.contextPath}/_info/Greetings_YB.do"
						class="list-group-item">연-결 인사말</a> <a href="${pageContext.request.contextPath}/_info/manager_HG.do"
						class="list-group-item btncolor">커플 매니저</a> <a href="${pageContext.request.contextPath}/_info/story_SE.do"
						class="list-group-item">연-결 성혼스토리</a> <a href="${pageContext.request.contextPath}/_info/notice_SE.do"
						class="list-group-item">공지사항</a> <a href="${pageContext.request.contextPath}/_info/partner_HG.do"
						class="list-group-item">연-결 파트너</a> <a href="${pageContext.request.contextPath}/_info/map_GD.do"
						class="list-group-item">오시는 길</a>
				</div>
			</div>
		</div>


		<h3 class="col-md-10">커플 매니저</h3>
		<div class="col-md-10 text1">
			<h5>연-결의 커플 매니저를 소개합니다.</h5>
			<br />
		</div>
		<br />
		<div class="col-md-9 content">
			<div class="media">
			
				<div class="box2">
					<div class="box1">
						<img src="${pageContext.request.contextPath}/assets/img/se.gif">
					</div>
				</div>
				<br />
				<div class="text2">
					<p class="text5" name="m_name">
						<strong>${output1.m_name}</strong>
					</p>
					<br />
					<p>
						<img src="${pageContext.request.contextPath}/assets/img/call.PNG"
							style="border-radius: 20px 20px 20px 20px;" name="m_tel">&nbsp;&nbsp;
						${output1.m_tel}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="${pageContext.request.contextPath}/assets/img/email.PNG"
							style="width: 25px; height: 25px;" name="m_email">
						&nbsp;&nbsp;${output1.m_email}
					</p>

					<br />
					<p class="text6" name="m_content">
						${output1.m_content}
					</p>
				</div>
			</div>
			<br /> <br />
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-9 content">
			<div class="media">
				<div class="box2">
					<div class="box1">
						<img src="${pageContext.request.contextPath}/assets/img/yh.gif">
					</div>
				</div>
				<br />
				<div class="text2">
					<p class="text5" name="m_name">
						<strong>${output2.m_name}</strong>
					</p>
					<br />
					<p>
						<img src="${pageContext.request.contextPath}/assets/img/call.PNG"
							style="border-radius: 20px 20px 20px 20px;" name="m_tel">&nbsp;&nbsp;
						${output2.m_tel}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="${pageContext.request.contextPath}/assets/img/email.PNG"
							style="width: 25px; height: 25px;" name="m_email">
						&nbsp;&nbsp;${output2.m_email}
					</p>

					<br />
					<p class="text6" name="m_content">
						${output2.m_content}
					</p>
				</div>
			</div>
			<br /> <br />
		</div>


		<div class="col-md-2"></div>

		<div class="col-md-9 content">
			<div class="media">
				<div class="box2">
					<div class="box1">
						<img src="${pageContext.request.contextPath}/assets/img/yb.gif">
					</div>
				</div>
				<br />
				<div class="text2">
					<p class="text5" name="m_name">
						<strong>${output3.m_name}</strong>
					</p>
					<br />
					<p>
						<img src="${pageContext.request.contextPath}/assets/img/call.PNG"
							style="border-radius: 20px 20px 20px 20px;" name="m_tel">&nbsp;&nbsp;
						${output3.m_tel}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="${pageContext.request.contextPath}/assets/img/email.PNG"
							style="width: 25px; height: 25px;" name="m_email">
						&nbsp;&nbsp;${output3.m_email}
					</p>

					<br />
					<p class="text6" name="m_content">
						${output3.m_content}
					</p>
				</div>
			</div>
			<br /> <br />
		</div>

		<div class="col-md-2"></div>
		<div class="col-md-9 content">
			<div class="media">
				<div class="box2">
					<div class="box1">
						<img src="${pageContext.request.contextPath}/assets/img/gd.gif">
					</div>
				</div>
				<br />
				<div class="text2">
					<p class="text5" name="m_name">
						<strong>${output4.m_name}</strong>
					</p>
					<br />
					<p>
						<img src="${pageContext.request.contextPath}/assets/img/call.PNG"
							style="border-radius: 20px 20px 20px 20px;" name="m_tel">&nbsp;&nbsp;
						${output4.m_tel}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="${pageContext.request.contextPath}/assets/img/email.PNG"
							style="width: 25px; height: 25px;" name="m_email">
						&nbsp;&nbsp;${output4.m_email}
					</p>

					<br />
					<p class="text6" name="m_content">
						${output4.m_content}
					</p>
				</div>
			</div>
			<br /> <br />
		</div>

		<div class="col-md-2"></div>
		<div class="col-md-9 content">
			<div class="media">
				<div class="box2">
					<div class="box1">
						<img src="${pageContext.request.contextPath}/assets/img/hg.gif">
					</div>
				</div>
				<br />
				<div class="text2">
					<p class="text5" name="m_name">
						<strong >${output5.m_name}</strong>
					</p>
					<br />
					<p>
						<img src="${pageContext.request.contextPath}/assets/img/call.PNG"
							style="border-radius: 20px 20px 20px 20px;" name="m_tel">&nbsp;&nbsp;
						${output5.m_tel}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
							src="${pageContext.request.contextPath}/assets/img/email.PNG"
							style="width: 25px; height: 25px;" name="m_email">
						&nbsp;&nbsp;${output5.m_email}
					</p>

					<br />
					<p class="text6" name="m_content">
						${output5.m_content}
					</p>
				</div>
			</div>
		</div>

	</div>






	<!-- 가운데 영역 끝 -->

	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>