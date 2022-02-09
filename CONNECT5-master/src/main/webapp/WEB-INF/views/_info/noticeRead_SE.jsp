<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/SE/Info/noticeRead.css">

<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />
	
	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/img3_SE.jpg" alt="연-결"
			class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">연-결 소개</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
				<a href="${pageContext.request.contextPath}/_info/IntroWebsite_YB.do" class="list-group-item">사이트 소개</a>
	            <a href="${pageContext.request.contextPath}/_info/Greetings_YB.do" class="list-group-item">연-결 인사말</a>
	            <a href="${pageContext.request.contextPath}/_info/manager_HG.do" class="list-group-item">커플 매니저</a>
	            <a href="${pageContext.request.contextPath}/_info/story_SE.do" class="list-group-item">연-결 성혼스토리</a>
	            <a href="${pageContext.request.contextPath}/_info/notice_SE.do" class="list-group-item btncolor">공지사항</a>
	            <a href="${pageContext.request.contextPath}/_info/partner_HG.do" class="list-group-item">연-결 파트너</a>
	            <a href="${pageContext.request.contextPath}/_info/map_GD.do" class="list-group-item">오시는 길</a>
			</div>
		</div>
	</div>


	<h3 class="col-md-10">공지사항</h3>
	<div class="col-md-10 text1">
		<h5>연-결의 소식을 알려드립니다.</h5>
	</div>

	<div class="col-md-10 content">
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
						<c:choose>
								<c:when test="${output.getContentImg() != '' }">
									<c:url value="/upload/download.do" var="download_url">
									
									<c:param name="file" value="${output.getContentImg()}" />
									<c:param name="size" value="250x150" />
            						<c:param name="crop" value="true" />
									</c:url>
									<td id="context" colspan="3"><img style="width:900px;" src="${download_url}">${output.content }</td>
								</c:when>
								<c:otherwise>
									<td id="context" colspan="3">${output.content}</td>
								</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>이전글</td>
							<th class="text_select" colspan="2">
								<c:choose>
									<c:when test="${nextBoard != null}">
										<c:url var="nextUrl" value="/_info/noticeRead_SE.do">
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
										<c:url var="prevUrl" value="/_info/noticeRead_SE.do">
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

		<button class="btn btn-default pull-right" onclick="location.href = '${pageContext.request.contextPath}/_info/notice_SE.do'">목록</button>

	</div>

<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>