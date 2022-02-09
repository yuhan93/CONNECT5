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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/./assets/css/YH/Mypage/1_1questionEmpty_YH.css">
<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />

	<!-- 변경사항  -->
	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/question1.png" alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->
	<div>
		<div class="col-md-2">
			<!-- 패널 타이틀1 -->
			<div class="left sidebar1">
				<h3 class="title">My 연-결</h3>
				<!-- 사이드바 메뉴목록1 -->
				<div class="list-group">
					<a href="${pageContext.request.contextPath}/_mypage/myInfo_GD.do" class="list-group-item">My현황</a> 
					<a href="${pageContext.request.contextPath}/_mypage/search_SE.do" class="list-group-item">인연 찾기</a> 
					<a href="${pageContext.request.contextPath}/_mypage/1_1questionEmpty_YH.do" class="list-group-item btncolor">1:1 문의</a> 
					<a href="${pageContext.request.contextPath}/_mypage/Ex-MatchingRecord_YB.do" class="list-group-item">매칭 기록 보기 </a>
					<a href="${pageContext.request.contextPath}/_mypage/personal_information1_HG.do" class="list-group-item">개인정보수정</a> 
					<a href="${pageContext.request.contextPath}/_mypage/withdrawal1_HG.do" class="list-group-item">회원탈퇴</a>
				</div>
			</div>
		</div>

		<h3 class="col-md-10">1:1 문의</h3>
		<div class="col-md-10 text1">
			<h5>1:1 문의 상담</h5>
		</div>

		<div class="col-md-10 content">
			<hr>
			<div class="table-responsive">
				<c:choose>
					<%-- 조회결과가 없는 경우 --%>
					<c:when test="${output == null || fn:length(output) == 0}">
						<tr>
							<td colspan="9" align="center" id="question1">문의 내역이 없습니다.</td>
						</tr>
					</c:when>
					<%-- 조회결과가 있는  경우 --%>
					<c:otherwise>
						<table class="table table-striped table-bordered table-hover">
							<tr>
								<td class="num">번호</td>
								<td>제목</td>
								<td class="name">이름</td>
								<td class="date">등록일</td>
								<td class="reply">답변여부</td>
							</tr>
							<tr>
								<%-- 조회 결과에 따른 반복 처리 --%>
								<c:set var="num" value="${pageData.totalCount - ((pageData.nowPage - 1) * pageData.listCount)}"/>
								<c:forEach var="item" items="${output}" varStatus="status">
									<c:set var="Title" value="${item.getTitle()}" />
									<c:set var="Username" value="${item.getUserName()}" />
									<c:set var="CreationDate" value="${item.getCreationDate()}" />
									<c:set var="Reply_Ok" value="${item.getReply_Ok()}" />

									<c:url value="1_1questionview.do" var="viewUrl">
										<c:param name="BoardId" value="${item.getBoardId()}" />
									</c:url>

									<tr>
										<td>${num}</td>
										<td><a href="${viewUrl}">${item.getTitle()}</a></td>
										<td>${item.getUserName()}</td>
										<td>${item.getCreationDate()}</td>
										<c:if test="${Reply_Ok == 0 }">
										<td><span class="label label-default">완료</span></td>
										</c:if>
										<c:if test="${Reply_Ok == 1 }">
										<td><span class="label label-primary">완료</span></td>
										</c:if>
									</tr>
								<c:set var="num" value="${num-1}" ></c:set>
								</c:forEach>
							</tr>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
			
			<hr>
			
			<!-- 페이지 번호 구현 -->
			<%-- 이전 그룹에 대한 링크 --%>
			<c:choose>
				<%-- 이전 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.prevPage > 0}">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/_mypage/1_1questionEmpty_YH.do" var="prevPageUrl">
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

			<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
			<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
				<%-- 이동할 URL 생성 --%>
				<c:url value="/_mypage/1_1questionEmpty_YH.do" var="pageUrl">
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

			<%-- 다음 그룹에 대한 링크 --%>
			<c:choose>
				<%-- 다음 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.nextPage > 0}">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/_mypage/1_1questionEmpty_YH.do" var="nextPageUrl">
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
			<button class="btn btn-default" onclick="location.href = '${pageContext.request.contextPath}/_mypage/1_1questionadd.do'">문의하기</button>
		</div>
	</div>
	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>