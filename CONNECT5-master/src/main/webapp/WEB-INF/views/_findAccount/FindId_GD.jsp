<%@page import="study.spring.simplespring.helper.MailHelper"%>
<%@page import="study.spring.simplespring.helper.WebHelper"%>
<%@page import="java.util.Random"%>
<%@page import="study.spring.simplespring.model.Email"%>
<%@page import="org.springframework.mail.MailSender"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
<html lang="ko">
<head>
<jsp:include page="../assets/inc/css.jsp" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/GD/Find/FindId.css">




<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>


<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Hello JSP</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img
			src="${pageContext.request.contextPath}/assets//img/question1.png"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->


	<!-- 변경사항  -->


	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">회원가입</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
				<a href="${pageContext.request.contextPath}/_join/join1_HG.do"
					class="list-group-item">회원가입</a> <a
					href="${pageContext.request.contextPath}/_login/login_HG.do"
					class="list-group-item">로그인</a> <a
					href="${pageContext.request.contextPath}/_findAccount/FindId_GD.do"
					class="list-group-item btncolor">ID/PW 찾기</a>
			</div>
		</div>
	</div>



	<h3 class="col-md-10">아이디 찾기</h3>
	<div class="col-md-10 text1">
		<h5>e-mail 을 통해 아이디를 찾으실 수 있습니다.</h5>
	</div>



	<!-- 변경 사항 -->



	<div class="col-md-9 content">
		<hr />

		<!-- 내용 작성  -->
		<fieldset>
			<form id="verify" name="verify" action="${pageContext.request.contextPath}/_findAccount/CheckId_GD.do" method="post">

				<div class="user_name">
					<label for="user_name" style="width: 100px">이름</label> <input
						type="text" id="user_name" name="user_name" size="20"
						value="${memberid}" />
				</div>
				<div class="user_email">
					<label for="user_email" style="width: 100px">e-mail</label> <input
						type="email" id="user_email" name="user_email" size="20"
						value="${UserEmail}" />


					<button type="button" id="get_Num">인증번호발송</button>
				</div>
				<div id="verify_num"></div>
				<br /> <br />
				<div id="verify_ok"></div>
				<br /> <br />
			</form>



			<div id="changeForm">
				<a
					href="${pageContext.request.contextPath}/_findAccount/FindPw_GD.do"
					id="changeForm">비밀번호 찾기</a>
			</div>
		</fieldset>


		<!-- 메인 내용 끝 -->
	</div>

	<script
		src="${pageContext.request.contextPath}/assets/plugins/regex/regex.js"></script>
	<script type="text/javascript">
		$(function() {

			$("#get_Num")
					.click(
							function(e) {
								e.preventDefault();
								if (!regex.value('#user_name', '이름을 입력하세요.')) {
									return false;
								}
								if (!regex.min_length('#user_name', 2,
										'이름은 최소 2자 이상 입력 가능합니다.')) {
									return false;
								}
								if (!regex.value('#user_email', '이메일을 입력하세요.')) {
									return false;
								}
								if (!regex.email('#user_email',
										'이메일 주소가 잘못되었습니다.')) {
									return false;
								}

								var param = $("form[name=verify]").serialize();
								$.ajax({
										url : "FindId_GD_ok.do",
										type : "POST",
										data : param,
										dataType : 'json',
										success : function(data) {
										console.log(data);
												if (data != null) {
													$("#get_Num").attr(
															"disabled", true);
													swal("인증번호가 발송되었습니다.");
													$("#verify_num").append("<div class='verify_num'><label for='number'>인증번호 　 </label><input type='text' size='20px' id='authnum' /><span class='count'></span></div>");
													$("#verify_ok").append(" <button type='button' id='v_ok'>확인</button>");
													count();
													$("#v_ok").on("click", function(e) {
														if (!regex.value('#authnum', '인증번호를 입력하세요.')) {
															return false;
														}
														if (!regex.eng_num('#authnum','인증번호는 숫자 만 입력 가능합니다.')) {
															return false;
														}
														if (!regex.min_length('#authnum', 6, '인증번호는 6자 입니다.')) {
															return false;
														}if(data.result == $("#authnum").val()){
															document.getElementById("verify").submit();
															alert("인증이 완료되었습니다.");
														}else{
															 $('#authnum').focus();
															alert("인증번호가 일치하지 않습니다.");
															return false;
														}
													});
												} 
											},
											error : function() {
												alert("아이디와 이메일이 일치하지 않습니다.");
											}
										});

							});
		});
	
		
		
		
		$("#a").click(function(e) {
					e.preventDefault();
					
					if(result1.result == number.val()){
						document.location.href = '${pageContext.request.contextPath}/_findAccount/CheckId_GD.do';
						alert("인증이 완료되었습니다.");
					}else{
						alert("인증번호가 일치하지 않습니다.");
						return false;
					}
					
				});

		function count() {

			var timer2 = "5:01";
			var interval = setInterval(function() {
				var timer = timer2.split(':');
				var minutes = parseInt(timer[0], 10);
				var seconds = parseInt(timer[1], 10);
				--seconds;
				minutes = (seconds < 0) ? --minutes : minutes;
				if (minutes < 0 && seconds == 0)
					clearInterval(interval);
				seconds = (seconds < 0) ? 59 : seconds;
				seconds = (seconds < 10) ? '0' + seconds : seconds;
				// minutes 와 seconds 에 대한 값을 계속 count 위치에 초기화
				if (minutes == -1) {
					clearInterval(interval);
					minutes = 0;
					seconds = 0 + "0";
					swal("인증 시간이 초과하셨습니다.");
					$("#number").attr("disabled", true);
					//$("#user_id").attr("disabled", true);
					//$("#user_email").attr("disabled", true);
					$(".count").attr("시간초과");
					$("#verify_ok").html(
							"<button type='button' id='a'><a href='${pageContext.request.contextPath}/_findAccount/FindId_GD.do'>재발송</a></button>");
				}

				$('.count').html(minutes + ':' + seconds);
				timer2 = minutes + ':' + seconds;
			}, 1000);

		}
	</script>




	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>