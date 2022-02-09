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

<title>연-결</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/footerMain.PNG" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/img/footerMain.PNG" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/nanumfont.css" />

<!-- 반응형 웹을 지원하지 않을 경우 -->
<!-- <link rel="stylesheet" href="assets/css/non-responsive.css" /> -->

<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
      <script type="text/javascript" src="assets/js/html5shiv.js"></script>
      <script type="text/javascript" src="assets/js/respond.min.js"></script>
   <![endif]-->

<!-- IE10 반응형 웹 버그 보완 -->
<!--[if gt IE 9]>
      <link rel="stylesheet" type="text/css" href="assets/css/ie10.css" />
      <script type="text/javascript" src="assets/js/ie10.js"></script>
   <![endif]-->


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/GD/Admin/qnaread.css">

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
				class="list-group-item">회원관리</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_userManagement_YH.do"
				class="list-group-item active">게시판 관리</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_userApply_YH.do"
				class="list-group-item">신청현황</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_Question_SE.do"
				class="list-group-item">문의현황</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_Payment_GD.do"
				class="list-group-item">결제관리</a>

		</div>

		<div class="col-md-10 middle">
			<h2>게시판 관리</h2>
		</div>
		<div class="col-md-10 middle_box">
			<button
				onclick="location='${pageContext.request.contextPath}/_admin/admin_userManagement_YH.do'"
				class="btn">공지사항</button>
			<button
				onclick="location='${pageContext.request.contextPath}/_admin/admin_MngBoard_WeddingStory_YB.do'"
				class="btn">연-결 성혼스토리</button>
			<button
				onclick="location='${pageContext.request.contextPath}/_admin/admin_QnA_GD.do'"
				class="btn btn-info">연-결 Q &amp; A</button>
			<button
				onclick="location='${pageContext.request.contextPath}/_admin/admin_userEx_GD.do'"
				class="btn">연-결 만남 후기</button>
		</div>


		<div class="col-md-10 text_box">
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center" id="num">제목</th>
							<th class="text-left">${output.getTitle()}</th>
							<th id="date">${output.creationDate}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="context" colspan="3">${output.content}</td>
						</tr>
						<tr>
							<td>이전글</td>
							<th class="text_select" colspan="2">
								<c:choose>
									<c:when test="${nextBoard != null}">
										<c:url var="nextUrl" value="/_admin/admin_QnARead_GD.do">
											<c:param name="BoardId" value="${nextBoard.getBoardId()}" />
										</c:url>
											<a href="${nextUrl}">${nextBoard.getTitle()}</a>
									</c:when>
									<c:otherwise>
										이전글이 없습니다.
									</c:otherwise>
								</c:choose>
							</th>
						</tr>
						<tr>
							<td>다음글</td>
							<th class="text_select" colspan="2">
								<c:choose>
									<c:when test="${prevBoard != null}">
										<c:url var="prevUrl" value="/_admin/admin_QnARead_GD.do">
											<c:param name="BoardId" value="${prevBoard.getBoardId()}" />
										</c:url>
											<a href="${prevUrl}">${prevBoard.getTitle()}</a>
									</c:when>
									<c:otherwise>
										다음글이 없습니다.
									</c:otherwise>
								</c:choose>
							</th>
						</tr>
					</tbody>
				</table>
			</div>
			<button class="btn btn-default"
				onclick="location.href = '${pageContext.request.contextPath}/_admin/admin_QnA_GDdeleteOk_GD.do?BoardId=${output.getBoardId() }'">삭제하기</button>
			<button class="btn btn-default"
				onclick="location='${pageContext.request.contextPath}/_admin/admin_QnA_GD.do'">목록</button>
		</div>
	</div>


	<!-- Javascript -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>

</body>
</html>