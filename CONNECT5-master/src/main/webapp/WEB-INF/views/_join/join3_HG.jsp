<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Join/join3.css">


<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/joinimg1.PNG"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<!-- 가운데 영역 -->
	<div class="center">
		<div class="col-md-2">
			<!-- 패널 타이틀1 -->
			<div class="left_sidebar">
				<h3 class="title">회원가입</h3>
				<!-- 사이드바 메뉴목록1 -->
				<div class="list-group">
					<a href="${pageContext.request.contextPath}/_join/join1_HG.do"
						class="list-group-item btncolor">회원가입</a> <a
						href="${pageContext.request.contextPath}/_login/login_HG.do"
						class="list-group-item">로그인</a> <a
						href="${pageContext.request.contextPath}/_findAccount/FindId_GD.do"
						class="list-group-item">ID/PW 찾기</a>
				</div>
			</div>
		</div>


		<div class="col-md-9 content">
			<img src="${pageContext.request.contextPath}/assets/img/abcimg.PNG">
			<div class="aaaa">

				<br> <br>
				<div class="b1">
					<strong>환영합니다!!!</strong><br />
					<p>
						연-결 회원가입이 완료 되었습니다.<br>진심으로 연-결 회원이 되신것을 축하드립니다.
					</p>
					<div class="buttom">
						<br>
						<button class="btn btn-default"
							onclick="location.href ='${pageContext.request.contextPath}'"
							style="height: 30px; width: 80px;">완료</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 가운데 영역 끝 -->

	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>