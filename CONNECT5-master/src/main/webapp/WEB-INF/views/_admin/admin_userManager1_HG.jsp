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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/footerMain.PNG" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/img/footerMain.PNG" />

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


	<div class="container">
		<div class="top">
			<div class="col-md-12 top_login">
				<p id="connect">
					admin 님 접속중
					<button type="submit" class="btn btn-xs" onclick="location.href = '${pageContext.request.contextPath}'">Logout</button>
				</p>
			</div>
		</div>


		<div class="col-md-2 sidebar1">
			<a href="${pageContext.request.contextPath}/_admin/admin_main_SE.do"
				class="list-group-item">대시보드</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_userManager1_HG.do"
				class="list-group-item active">회원관리</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_userManagement_YH.do"
				class="list-group-item">게시판 관리</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_userApply_YH.do"
				class="list-group-item">신청현황</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_Question_SE.do"
				class="list-group-item">문의현황</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_Payment_GD.do"
				class="list-group-item">결제관리</a>

		</div>

		<div class="col-md-10 middle">
			<h2>회원관리</h2>
		</div>

		<form method="get"
			action="${pageContext.request.contextPath}/_admin/admin_userManager1_HG.do">
			<div class="col-md-4 searching_box">
				<ul id="key">
					<li><select name="selected">
							<option value="0">---선택---</option>
							<option value="bId"<c:if test="${selected eq 'bId'}">selected</c:if>>아이디</option>
							<option value="bName"<c:if test="${selected eq'bName'}">selected</c:if>>이름</option>
					</select> 
					<input type="search" name="keyword" value="${keyword}"/> <button type="submit"
						id="s_btn">검색</button>
				</ul>
			</div>
		</form>
		<div class="col-md-10 content">
			<div class="table-responsive">

				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr class="text-center">
							<th id="num">번호</th>
							<th id="id">아이디</th>
							<th id="name">이름</th>
							<th id="birthdate">생년월일</th>
							<th id="height">신장</th>
							<th id="academicBackground">학력</th>
							<th id="job">직업</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${output == null || fn:length(output) == 0}">
								<tr>
									<td colspan="9" align="center">회원들의 정보가 없습니다.</td>
								</tr>
							</c:when>

							<%-- 조회결과가 있는  경우 --%>
							<c:otherwise>
								<%-- 조회 결과에 따른 반복 처리 --%>
								<c:set var="num" value="${pageData.totalCount - ((pageData.nowPage-1) * pageData.listCount) -1}"/>
								<c:forEach var="item" items="${output}" varStatus="status">
									<c:set var="UserId" value="${item.getUserId()}" />
									<c:set var="MemberId" value="${item.getMemberId()}" />
									<c:set var="UserName" value="${item.getUserName()}" />
									<c:set var="birthDate" value="${item.getBirthDate()}" />
									<c:set var="height" value="${item.getHeight()}" />
									<c:set var="edu_Lv" value="${item.getEdu_Lv()}" />
									<c:set var="job" value="${item.getJob()}" />

									<%-- 검색어가 있다면? --%>
									<c:if test="${keyword != ''}">
										<%-- 검색어에 <mark> 태그를 적용하여 형광팬 효과 준비 --%>
										<c:set var="mark" value="<mark>${keyword}</mark>" />
										<%-- 출력을 위해 준비한 학과이름과 위치에서 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
										<c:set var="UserName"
											value="${fn:replace(UserName, keyword, mark)}" />
											<c:set var="UserId"
											value="${fn:replace(UserId, keyword, mark)}" />

									</c:if>

									<%-- 상세페이지로 이동하기 위한 URL --%>
									<c:url value="/_admin/admin_userManager2_HG.do" var="viewUrl">
										<c:param name="MemberId" value="${item.getMemberId()}" />
									</c:url>

									<tr>
										<td>${num}</td>
										<td>${item.getUserId()}</td>
										<td><a href="${viewUrl}">${item.getUserName()}</a></td>
										<td>${item.getBirthDate()}</td>
										<td>${item.getHeight()}</td>
										<td>${item.getEdu_Lv()}</td>
										<td>${item.getJob()}</td>
									</tr>
										<c:set var="num" value="${num-1}" ></c:set>
								</c:forEach>
								
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/_admin/admin_userManager1_HG.do"
							var="prevPageUrl">
							<c:param name="page" value="${pageData.prevPage}" />
							<c:param name="keyword" value="${keyword}" />
						</c:url>
						<a href="${prevPageUrl}">&laquo;</a>
					</c:when>
					<c:otherwise>
						<ul class="pagination pagination-sm">
							<li><a href="${prevPageUrl}">&laquo;</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pageData.startPage}"
					end="${pageData.endPage}" varStatus="status">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/_admin/admin_userManager1_HG.do" var="pageUrl">
						<c:param name="page" value="${i}" />
						<c:param name="keyword" value="${keyword}" />
					</c:url>

					<%-- 페이지 번호 출력 --%>
					<c:choose>
						<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
						<c:when test="${pageData.nowPage == i}">
							<ul class="pagination pagination-sm">
								<li class="active"><a href="${pageUrl}">${i}</a></li>
							</ul>
						</c:when>
						<%-- 나머지 페이지의 경우 링크 적용함 --%>
						<c:otherwise>
							<ul class="pagination pagination-sm">
								<li><a href="${pageUrl}">${i}</a></li>
							</ul>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<%-- 다음 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.nextPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/_admin/admin_userManager1_HG.do"
							var="nextPageUrl">
							<c:param name="page" value="${pageData.nextPage}" />
							<c:param name="keyword" value="${keyword}" />
						</c:url>
						<a href="${nextPageUrl}">&raquo;</a>
					</c:when>
					<c:otherwise>
						<ul class="pagination pagination-sm">
							<li><a href="${pageUrl}">&raquo;</a></li>
						</ul>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>


	<!-- Javascript -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>

</body>
</html>