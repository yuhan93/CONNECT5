<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />

<!-- 시각적 확인을 위한 CSS 적용 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/YB/Service/ServiceProcedures_YB.css">

<title>서비스 안내_서비스 이용 절차(ServiceProcedures)</title>



</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />

	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/서비스이용절차_상단.png" alt="연-결"
			class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">서비스 안내</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
            	<a href="${pageContext.request.contextPath}/_service/ServiceProcedures_YB.do" class="list-group-item btncolor">서비스 이용절차</a>
                <a href="${pageContext.request.contextPath}/_service/MembershipRegisGuide_YB.do" class="list-group-item">회원가입안내</a>
                <a href="${pageContext.request.contextPath}/_service/MemberLevel_YH.do" class="list-group-item">회원등급안내</a>
                <a href="${pageContext.request.contextPath}/_service/SpecialService_YH.do" class="list-group-item">연-결 스페셜 서비스</a>
                <a href="${pageContext.request.contextPath}/_service/MemberStatus_YB.do" class="list-group-item">회원 현황</a>
            </div> 
		</div>
	</div>


	<h3 class="col-md-10">서비스 이용 절차</h3>
	<div class="col-md-10 text1">
		<h5>연-결의 서비스 이용 절차를 확인하세요.</h5>
	</div>
	

	<div class="col-md-9 content">
		<div class="box"><br />
			<img src="${pageContext.request.contextPath}/assets/img/서비스이용절차01.png" alt="서비스이용절차" />
		</div>
		
		<div class="box"><br /><br />
			<img src="${pageContext.request.contextPath}/assets/img/시스템프로세스1.png" alt="시스템프로세스1" />
		</div>
		
		<div class="box"><br />
			<img src="${pageContext.request.contextPath}/assets/img/시스템프로세스2.png" alt="시스템프로세스2" />
		</div>
		
		<div class="box"><br />
			<img src="${pageContext.request.contextPath}/assets/img/시스템프로세스3.png" alt="시스템프로세스3" />
		</div>
		
		<div class="box1"><br />
			<img src="${pageContext.request.contextPath}/assets/img/시스템프로세스4.png" alt="시스템프로세스4" />
		</div>
	</div>
	<!-- 가운데(내용) 영역 끝 -->
		
	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>