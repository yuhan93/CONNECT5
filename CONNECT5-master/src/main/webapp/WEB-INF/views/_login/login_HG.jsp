<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Login/login.css">
<script src='${pageContext.request.contextPath}/assets/js/regex.js'></script>
<meta charset="utf-8" />
<title>연-결</title>

</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/loginimg1.PNG"
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
						class="list-group-item ">회원가입</a> <a
						href="${pageContext.request.contextPath}/_login/login_HG.do"
						class="list-group-item btncolor">로그인</a> <a
						href="${pageContext.request.contextPath}/_findAccount/FindId_GD.do"
						class="list-group-item">ID/PW 찾기</a>
				</div>
			</div>
		</div>


		<h3 class="col-md-10">로그인</h3>
		<div class="col-md-10 text1">
			<h5>ID/PW를 입력해주세요.</h5>
		</div>
		<div class="col-md-9 content">
			<hr />
			<div class="login4">
				<p>Login</p>
			</div>
			<form action="loginOk.do" method="POST" id="myform">

				<fieldset>
					<div class="user_name">
						<label for="UserId" style="width: 75px">아이디 </label> <input
							type="text" id="UserId" name="UserId" size="20" />
					</div>
					<div class="user_pw">
						<label for="UserPw" style="width: 75px">비밀번호 </label> <input
							type="password" id="UserPw" name="UserPw" size="20" />
					</div>

					<div class="buttom">
						<br>
						<button type="submit" class="btn btn-default"
							style="height: 30px; width: 80px;" id="loginOk">로그인</button>
					</div>

				</fieldset>
			</form>
		</div>
	</div>

	<script>
		$(function() {
			$("#loginOk").click(function(e) {
				if (!regex.value('#UserId', '아이디를 입력하세요.')) {
					return false;
				}
				if (!regex.value('#UserPw', '비밀번호를 입력하세요.')) {
					return false;
				}
			});
		});
	</script>
	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>