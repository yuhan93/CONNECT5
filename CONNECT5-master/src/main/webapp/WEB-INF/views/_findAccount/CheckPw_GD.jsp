<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />



<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/GD/Find/CheckPw.css">





<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />

	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/question1.png"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">회원가입</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
				<a href="${pageContext.request.contextPath}/_join/join1_HG.do"
					class="list-group-item ">회원가입</a> <a
					href="${pageContext.request.contextPath}/_login/login_HG.do"
					class="list-group-item">로그인</a> <a
					href="${pageContext.request.contextPath}/_findAccount/FindId_GD.do"
					class="list-group-item btncolor">ID/PW 찾기</a>
			</div>
		</div>
	</div>


	<h3 class="col-md-10">비밀번호 찾기</h3>
	<div class="col-md-10 text1">
		<h5>새로운 비밀번호를 설정해주세요.</h5>
	</div>

	<div class="col-md-9 content">







		<!-- 내용 작성  -->

		<hr />
		<div id="show_id">

			<%
				request.setCharacterEncoding("utf-8");
				String id = request.getParameter("user_id");
			%>
			<%=id%>
			계정의 비밀번호를 새롭게 설정해 주세요.


		</div>

		<form method="post" name="changepw" id="changepw"
			action="${pageContext.request.contextPath}/_findAccount/FindPw_GD_Success.do">
			<input type="hidden" name="userid" value="<%=id%>">
			<div class="new_pwd">
				<label for="new_pwd">변경할 비밀번호 </label> <input type="password"
					id="new_pwd" name="new_pwd" size="20" />
			</div>
			<div class="check_pwd">
				<label for="text">비밀번호 재입력 </label> <input type="password"
					id="check_pwd" name="check_pwd" size="20" /> <br /> <br>
				<button type="button" class="btn btn-default" id=ok>확인</button>
				<br />
			</div>
		</form>
	</div>

	<script type="text/javascript">
		$(function(e) {

			$("#ok").click(function(e) {
				e.preventDefault();
				if ($("#new_pwd").val() == $("#check_pwd").val()) {

					$("#changepw").submit();

				} else {
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}

			});

		});
	</script>









	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>