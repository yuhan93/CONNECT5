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
	href="${pageContext.request.contextPath}/assets/css/GD/Board/loveColumn.css">





<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/question1.png"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">연-결 코치</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
				<a href="${pageContext.request.contextPath}/_coach/meetingTip_GD.do"
					class="list-group-item">미팅성공전략TIP</a> <a
					href="${pageContext.request.contextPath}/_coach/loveColumn_GD.do"
					class="list-group-item btncolor">LOVE 컬럼</a> <a
					href="${pageContext.request.contextPath}/_coach/DatingCourse_YB.do"
					class="list-group-item">데이트 코스</a> <a
					href="${pageContext.request.contextPath}/_coach/review_SE.do"
					class="list-group-item">연-결 만남 후기</a> <a
					href="${pageContext.request.contextPath}/_coach/QnA_SE.do"
					class="list-group-item">연-결 Q &amp; A</a>
			</div>
		</div>
	</div>


	<h3 class="col-md-10">LOVE 칼럼</h3>
	<div class="col-md-10 text1">
		<h5>연애와 결혼에 관한 솔직 담백한 이야기를 들려 드립니다.</h5>
	</div>

	<div class="col-md-9 content">







		<!-- 내용 작성  -->

		<hr />
		<div class="table-responsive">
			<table width="850" align="center" class="bottom">
				<c:choose>
					<c:when test="${output == null || fn:length(output) == 0}">
						<tr>
							<td colspan="9" align="center">조회결과가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>


						<c:forEach var="item" items="${output}" varStatus="status">
							<%--출력을 위해 준비한 학과이름과 위치 --%>
							<c:url value="/_coach/readColumn_GD.do" var="viewUrl">
								<c:param name="BoardId" value="${item.boardId}" />
							</c:url>

							<tr style="cursor: pointer;">

								<td><img
									src="${pageContext.request.contextPath}/assets/upload${item.getContentImg()}"
									width="250" height="150"></td>
								<td width="500" height="200"><a href="${viewUrl}"><h4>${item.title}</a>
									<br /> <span class="sub_text">${item.content }</span></td>


							</tr>


							<c:set var="num" value="${num-1 }">
							</c:set>
						</c:forEach>
					</c:otherwise>


				</c:choose>



			</table>

			<div align="center">
				<!-- 페이지 번호 구현 -->
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/_coach/loveColumn_GD.do" var="prevPageUrl">
							<c:param name="page" value="${pageData.prevPage}" />
							<c:param name="keyword" value="${keyword}" />
						</c:url>
						<a href="${prevPageUrl}">[이전]</a>
					</c:when>
					<c:otherwise>
						<ul class="pagination pagination-sm">
							<li><a href="${prevPageUrl}">&laquo;</a></li>
						</ul>
					</c:otherwise>
				</c:choose>

				<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
				<c:forEach var="i" begin="${pageData.startPage}"
					end="${pageData.endPage}" varStatus="status">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/_coach/loveColumn_GD.do" var="pageUrl">
						<c:param name="page" value="${i}" />
						<c:param name="keyword" value="${keyword}" />
					</c:url>

					<%-- 페이지 번호 출력 --%>
					<c:choose>
						<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
						<c:when test="${pageData.nowPage == i}">
							<ul class="pagination pagination-sm">
								<li><a href="${pageUrl}">${i}</a></li>
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
						<c:url value="/_coach/loveColumn_GD.do" var="nextPageUrl">
							<c:param name="page" value="${pageData.nextPage}" />
						</c:url>
						<a href="${nextPageUrl}">[다음]</a>
					</c:when>
					<c:otherwise>
						<ul class="pagination pagination-sm">
							<li><a href="${pageUrl}">&raquo;</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
			<c:if test="${isadmin==1}">

				<button class="btn btn-default" type="button" id="write"
					onclick="location='${pageContext.request.contextPath}/_coach/ColumnWrite.do'">글쓰기</button>

			</c:if>

		</div>


	</div>
	<script type="text/javascript">
		
	</script>







	<script type="text/javascript">

	
			
	
		
    </script>









	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>