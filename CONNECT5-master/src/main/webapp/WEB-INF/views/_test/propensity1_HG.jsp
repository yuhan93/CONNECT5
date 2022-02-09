<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Test/propensity1_HGok.css">
<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img
			src="${pageContext.request.contextPath}/assets/img/propensityimg.PNG"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">연-결 테스트</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
				<a href="${pageContext.request.contextPath}/_test/propensity1_HG.do"
					class="list-group-item btncolor">연애성향 테스트</a> <a
					href="${pageContext.request.contextPath}/_test/idealtype_HG.do"
					class="list-group-item ">이상형 찾기</a> <a
					href="${pageContext.request.contextPath}/_test/lovescore1_HG.do"
					class="list-group-item ">나의 연애 매력</a>
			</div>
		</div>
	</div>


	<h3 class="col-md-10">연애성향 테스트</h3>
	<div class="col-md-10 text1">
		<h5>나의 연애성향을 알아봅시다.</h5>
	</div>

	<div class="col-md-9 content">
		<div class="all">
			<img src="${pageContext.request.contextPath}/assets/img/test1img.PNG">
			<div class="media">
				<p class="text10">
					<strong>나의 성향에 맞는 것을 선택하세요.</strong>
				</p>
				<br />
				<p class="text11">
					<strong>손가락 길이에 따른 성향 테스트</strong>
				</p>
				<p class="text12">다섯 손가락을 바르게 펼쳤을 때, 검지와 약지 중 더 긴 손가락은 어느 손가락이 더
					긴가요?</p>

			</div>
			<br />

			<div class="media1">
				<table class="boxtext1 table-bordered">

					<tr class="boximg1">
						<td><a
							href="${pageContext.request.contextPath}/_test/propensity2_HG.do?TestQ1=0">
								<img
								src="${pageContext.request.contextPath}/assets/img/test1.PNG"><br />
								<span class="text2">검지 손가락이 더 길다</span>
						</a></td>
					</tr>

					<tr class="boximg2">
						<td><a
							href="${pageContext.request.contextPath}/_test/propensity2_HG.do?TestQ1=1">
								<img
								src="${pageContext.request.contextPath}/assets/img/test2.PNG">
								<span class="text2">약지 손가락이 더 길다</span>
						</a></td>
					</tr>

				</table>
				<br /> <br /> <br /> <br />
				<p class="text11">
					<strong>사진을 선택해주세요!!!</strong>
				</p>




			</div>
		</div>
	</div>

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>