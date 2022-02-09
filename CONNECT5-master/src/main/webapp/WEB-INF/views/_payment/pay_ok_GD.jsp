<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/GD/Payment/payok.css">

<script>

function move(){
	 
	document.location.href="${pageContext.request.contextPath}/home.do";
 }
	
</script>

<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/question1.png" alt="연-결"
			class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<!-- 가운데 영역 -->
	<div class="center">
		<div class="col-md-2">
			<!-- 패널 타이틀1 -->
			<div class="left_sidebar">
				          <h3 class="title">유료 결제</h3>
                  <!-- 사이드바 메뉴목록1 -->
                  <div class="list-group">
                     <a href="#" class="list-group-item">필수 입력 항목</a>
                     <a href="#" class="list-group-item">결제 수단 선택</a>
                     <a href="#" class="list-group-item btncolor">결제 완료</a>
				</div>
			</div>
		</div>


		<div class="col-md-9 content">
			<img src="${pageContext.request.contextPath}/assets/img/wait.PNG">
			<div class="aaaa" >

				<br> <br>
				<div class="b1">
				<br />
					<strong>결제가 완료되었습니다.</strong>
					<br />
					<br />
					
					<p>
						자체 심의를 진행하는 동안 기다려주세요. <br>심의가 진행된 후 등급이 부여되고 연-결을 찾으실 수 있습니다.
					</p>
					<br> <button class="btn btn-default" onclick='move()'>확인 </button>
				</div>
			</div>
		</div>
	</div>

	<!-- 가운데 영역 끝 -->

	<!-- 변경 사항 -->

<jsp:include page="../assets/inc/footer.jsp" />
	<script>
	
	</script>
</body>
</html>