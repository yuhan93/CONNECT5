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
	href="${pageContext.request.contextPath}/assets/css/HG/Test/lovescore3.css">

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
					class="list-group-item btncolor">연애성향 테스트</a> <a
					href="${pageContext.request.contextPath}/_test/idealtype_HG.do"
					class="list-group-item ">이상형 찾기</a> <a
					href="${pageContext.request.contextPath}/_test/lovescore1_HG.do"
					class="list-group-item ">나의 연애 매력</a>
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
			<div class="table-responsive">
				<br /> <br />

				<table class="table table-bordered">

					<tbody>
						<c:forEach var="item" items="${output}" varStatus="status">
							<c:set var="resultTitle" value="${item.resultTitle}" />
							<c:set var="resultContent" value="${item.resultContent}" />

							<c:if test="${TestQ1 == 0 and TestQ2 == 0}">
								<tr>
									<th class="text-center" id="num">타입</th>
									<th class="title1">${resultTitle}</th>
								</tr>
								<tr>
									<td id="context" colspan="3" align="left">${resultContent}</td>
								</tr>
							</c:if>

							<c:if test="${TestQ1 == 0 and TestQ2 == 1}">
								<tr>
									<th class="text-center" id="num">타입</th>
									<th class="title1">${resultTitle}</th>
								</tr>
								<tr>
									<td id="context" colspan="3" align="left">${resultContent}</td>
								</tr>
							</c:if>

							<c:if test="${TestQ1 == 1 and TestQ2 == 0}">
								<tr>
									<th class="text-center" id="num">타입</th>
									<th class="title1">${resultTitle}</th>
								</tr>
								<tr>
									<td id="context" colspan="3" align="left">${resultContent}</td>
								</tr>
							</c:if>

							<c:if test="${TestQ1 == 1 and TestQ2 == 1}">
								<tr>
									<th class="text-center" id="num">타입</th>
									<th class="title1">${resultTitle}</th>
								</tr>
								<tr>
									<td id="context" colspan="3" align="left">${resultContent}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
		<div class="back1">
			<img src="${pageContext.request.contextPath}/assets/img/backimg1.PNG">

		</div>
	</div>


	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />

</body>
</html>