<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Grid</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/nanumfont.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Admin/admin_userManager1_HG.css">

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>


<script type="text/javascript">
	
</script>

</head>

<body>
	<div class="table-responsive">

		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr class="text-center">
					<th id="name">이름</th>
					<th id="gender">성별</th>
					<th id="ismarried">결혼여부</th>
					<th id="date_loc" style="width: 150px;">데이트 선호 지역</th>
					<th id="height">신장</th>
					<th id="style">스타일</th>
					<th id="prsonality">성격</th>
					<th id="bldtype">혈액형</th>
					<th id="sal_annual">연봉</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${output == null || fn:length(output) == 0}">
						<tr>
							<td colspan="11" align="center">회원들의 정보가 없습니다.</td>
						</tr>
					</c:when>
					<%-- 조회결과가 있는  경우 --%>
					<c:otherwise>
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item" items="${output}" varStatus="status">
							<c:set var="MemberId" value="${item.getMemberId()}" />
							<c:set var="UserName" value="${item.getUserName()}" />
							<c:set var="Gender" value="${item.getGender()}" />
							<c:set var="IsMarried" value="${item.getIsMarried()}" />
							<c:set var="Date_Loc" value="${item.getDate_Loc()}" />
							<c:set var="Height" value="${item.getHeight()}" />
							<c:set var="Style" value="${item.getStyle()}" />
							<c:set var="Personality" value="${item.getPersonality()}" />
							<c:set var="BldType" value="${item.getBldType()}" />
							<c:set var="Sal_Annual" value="${item.getSal_Annual()}" />

							<tr style="text-align: center;">
								<td>${item.getUserName()}</td>
								<td><c:if test="${Gender == 0}">남자
									</c:if> <c:if test="${Gender == 1}">여자
									</c:if></td>
								<td>
								<c:if test="${IsMarried == 0}"> 초혼</c:if> <c:if
										test="${IsMarried == 1}"> 재혼</c:if></td>
								<td>${item.getDate_Loc()}</td>
								<td>${item.getHeight()}</td>
								<td>${item.getStyle()}</td>
								<td>${item.getPersonality()}</td>
								<td>${item.getBldType()}</td>
								<td>${item.getSal_Annual()}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

	</div>


	<!-- Javascript -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>

</body>
</html>