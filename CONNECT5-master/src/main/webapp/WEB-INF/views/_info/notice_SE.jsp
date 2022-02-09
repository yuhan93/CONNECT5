<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/SE/Info/notice.css">

<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />

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

	<div class="search">
		<form method="get" action="${pageContext.request.contextPath}/_info/notice_SE.do">
			<ul id="key">
					<li>
						<select name="selected">
							<option value="">---선택---</option>
							<option value="bTitle" <c:if test="${selected eq 'bTitle'}">selected</c:if>>제목</option>
							<option value="bName" <c:if test="${selected eq 'bName'}">selected</c:if>>작성자</option>
						</select> 
							<input type="search" name="keyword" value="${keyword}" />
						<button type="submit" id="btn">검색</button>
					</li>
				</ul>
		</form>
	</div>

	<div class="col-md-10 content">

		<div class="table-responsive">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th id="num">번호</th>
						<th>제목</th>
						<th id="date">작성자</th>
						<th id="date">등록일</th>
					</tr>
				</thead>
				<tbody>	
					<c:choose>
                <%-- 조회결과가 없는 경우 --%>
                <c:when test="${output == null || fn:length(output) == 0}">
                    <tr>
                        <td colspan="4" align="center">게시글이 없습니다.</td>
                    </tr>
                </c:when>
                <%-- 조회결과가 있는  경우 --%>
                <c:otherwise>
                    <%-- 조회 결과에 따른 반복 처리 --%>
                    <c:set var="num" value="${pageData.totalCount - ((pageData.nowPage - 1) * pageData.listCount)}"/>
                    <c:forEach var="item" items="${output}" varStatus="status">
                        <c:set var="BoardId" value="${item.getBoardId()}" />
						<c:set var="Title" value="${item.getTitle()}" />
						<c:set var="UserName" value="${item.getUserName()}" />
						<c:set var="CreationDate" value="${item.getCreationDate()}" />
                       
                        
                        <%-- 검색어가 있다면? --%>
                        <c:if test="${keyword != ''}">
                            <%-- 검색어에 <mark> 태그를 적용하여 형광팬 효과 준비 --%>
                            <c:set var="mark" value="<mark>${keyword}</mark>" />
                            <%-- 출력을 위해 준비한 학과이름과 위치에서 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
                            <c:set var="title" value="${fn:replace(title, keyword, mark)}" />
                           
                        </c:if>
                        
                        <%-- 상세페이지로 이동하기 위한 URL --%>
                        <c:url value="/_info/noticeRead_SE.do" var="viewUrl">
                            <c:param name="BoardId" value="${item.getBoardId()}" />
                        </c:url>
                        
                        <tr>
							<td>${num}</td>
							<td><a href="${viewUrl}">${Title}</a></td>
							<td>${UserName}</td>
							<td>${CreationDate}</td>
						</tr>
                        <c:set var="num" value="${num-1}" ></c:set>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
				</tbody>
			</table>
		</div>
		<!-- 페이지 번호 구현 -->
    <%-- 이전 그룹에 대한 링크 --%>
     <c:choose>
				<%-- 이전 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.prevPage > 0}">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/_info/notice_SE.do" var="prevPageUrl">
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
				<c:url value="/_info/notice_SE.do" var="pageUrl">
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
					<c:url value="/_info/notice_SE.do" var="nextPageUrl">
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

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>