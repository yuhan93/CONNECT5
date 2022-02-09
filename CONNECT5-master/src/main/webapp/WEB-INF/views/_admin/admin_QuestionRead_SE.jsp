<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Grid</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/footerMain.PNG" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/img/footerMain.PNG" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="../assets/css/nanumfont.css" />

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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/SE/Admin/questionRead.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
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
			<a href="${pageContext.request.contextPath}/_admin/admin_main_SE.do" class="list-group-item">대시보드</a> 
			<a href="${pageContext.request.contextPath}/_admin/admin_userManager1_HG.do" class="list-group-item">회원관리</a> 
			<a href="${pageContext.request.contextPath}/_admin/admin_userManagement_YH.do" class="list-group-item">게시판 관리</a> 
			<a href="${pageContext.request.contextPath}/_admin/admin_userApply_YH.do" class="list-group-item">신청현황</a> 
			<a href="${pageContext.request.contextPath}/_admin/admin_Question_SE.do" class="list-group-item active">문의현황</a> 
			<a href="${pageContext.request.contextPath}/_admin/admin_Payment_GD.do" class="list-group-item">결제관리</a>
		</div>

		<div class="col-md-10 middle">
			<h2>문의현황</h2>
			<br />
		</div>
		<div class="col-md-10 text_box">
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th id="title">제목</th>
							<th id="textarea">${output.getTitle()}</th>
							<th id="title">작성자</th>
							<th id="userid">${output.getUserName()}</th>
							<th id="title">문의일</th>
							<th id="date">${output.getCreationDate()}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="Question" colspan="6">${output.getContent()}</th>
						</tr>
					</tbody>
				</table>

				<c:choose>
					<c:when test="${fn:length(output1) gt 0}">
						<c:forEach var="item" items="${output1}" varStatus="status">
							<c:set var="Re_content" value="${item.getRe_Content()}" />
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th id="title">제목</th>
											<th id="textarea">안녕하세요. 연-결 운영진 입니다.<input type="hidden" name="Re_Title" value="안녕하세요. 연-결 운영진 입니다." /></th>
											<th id="title">작성자</th>
											<th id="userid">운영진</th>
											<th id="title">문의일</th>
											<th id="date">${item.getRe_CreationDate() }</th>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<th class="Question" colspan="6">${item.getRe_Content()}</th>
										</tr>
									</tbody>
								</table>
						</c:forEach>
						<button type="submit" class="btn btn-default">답변쓰기</button>
						<button class="btn btn-default" onclick="location.href = '${pageContext.request.contextPath}/_admin/admin_Question_SE.do'">목록</button>

					</c:when>
					<c:otherwise>
						<form action="${pageContext.request.contextPath}/_admin/admin_QuestionRead_SEaddOk.do?BoardId=${output.getBoardId()}" method="POST">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th id="title">제목</th>
										<th id="textarea">안녕하세요. 연-결 운영진 입니다.<input type="hidden" name="Re_Title" value="안녕하세요. 연-결 운영진 입니다." /></th>
										<th id="title">작성자</th>
										<th id="userid">운영진</th>
										<th id="title">문의일</th>
										<th id="date">${item.getRe_CreationDate() }</th>
									</tr>
								</tbody>
								<tbody>
									<tr>
										<td class="Question" colspan="6" align="center" id="Content">
											<input class="form-control" class="contentarea" id="contentarea" name="Re_Content" /> 
										</td>
									</tr>
								</tbody>
							</table>
							<button type="submit" class="btn btn-default">답변쓰기</button>
						<button class="btn btn-default" onclick="location.href = '${pageContext.request.contextPath}/_admin/admin_Question_SE.do'">목록</button>
						</form>
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