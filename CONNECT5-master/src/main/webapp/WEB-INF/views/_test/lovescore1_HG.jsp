<%@page import="study.spring.simplespring.helper.WebHelper"%>
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
	href="${pageContext.request.contextPath}/assets/css/HG/Test/lovescore1HG.css">

<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img
			src="${pageContext.request.contextPath}/assets/img/lovescoreimg.PNG"
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
					class="list-group-item">연애성향 테스트</a> <a
					href="${pageContext.request.contextPath}/_test/idealtype_HG.do"
					class="list-group-item ">이상형 찾기</a> <a
					href="${pageContext.request.contextPath}/_test/lovescore1_HG.do"
					class="list-group-item btncolor">나의 연애 매력</a>
			</div>
		</div>
	</div>


	<h3 class="col-md-10">나의 연애 매력</h3>
	<div class="col-md-10 text1">
		<h5>나의 연애 매력을 알아봅시다.</h5>
	</div>

	<div class="col-md-9 content">
		<div class="all">
			<img src="${pageContext.request.contextPath}/assets/img/test1img.PNG">
			<br /> <br /> <br />
			<div class="media">
				<p class="text10">
					<strong>문장에 집착하지말고 가벼운 마음으로 선택해주세요~</strong>
				</p>
			</div>
			<br />

			<div class="media1">
				<table class="boxtext1 table-bordered">
					<tr>
						<td id="qa" colspan="3">나는 가까운 슈퍼를 가더라도 갖춰서 입고 나가는 편이다.</td>
					</tr>
				</table>
				<div class="box2">
					<div class="text2">
						<a
							href="${pageContext.request.contextPath}/_test/lovescore2_HG.do?TestQ3=0">그렇다</a>
					</div>
				</div>

				<div class="box2">
					<div class="text2">

						<a
							href="${pageContext.request.contextPath}/_test/lovescore2_HG.do?TestQ3=1">아니다</a>

					</div>
				</div>
			</div>
		</div>
	</div>









	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>