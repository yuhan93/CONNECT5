<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />

<!-- 시각적 확인을 위한 CSS 적용 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/YB/Mypage/Ex-MatchingRecord.css">
<meta charset="utf-8" />

<title>my연-결_이전 매칭기록(MyPage_Ex-MatchingRecord)</title>

<!-- 스크립트 추가 작성란 --> 
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />

	<!-- 변경사항 -->
	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/매칭기록보기_상단.jfif" alt="연-결"
			class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	 <!-- 가운데 영역 -->
     <div class="col-md-2">
     	
     	<!-- 패널 타이틀1 -->
      	<div class="left_sidebar">
      		<h3 class="title">My 연-결</h3>
      		
      		<!-- 사이드바 메뉴목록1 -->
      		<div class="list-group">
	            <a href="${pageContext.request.contextPath}/_mypage/myInfo_GD.do" class="list-group-item">My현황</a> 
				<a href="${pageContext.request.contextPath}/_mypage/search_SE.do" class="list-group-item">인연 찾기</a> 
				<a href="${pageContext.request.contextPath}/_mypage/1_1questionEmpty_YH.do" class="list-group-item">1:1 문의</a>
				<a href="${pageContext.request.contextPath}/_mypage/Ex-MatchingRecord_YB.do" class="list-group-item btncolor">매칭 기록 보기</a> 
				<a href="${pageContext.request.contextPath}/_mypage/personal_information1_HG.do" class="list-group-item">개인정보수정</a> 
				<a href="${pageContext.request.contextPath}/_mypage/withdrawal1_HG.do" class="list-group-item">회원탈퇴</a>
            </div> 
        </div>
      </div>

		<!-- 내용 작성  -->
        <h3 class="col-md-10">매칭 기록 보기</h3><br />
        	<div class="col-md-10 text1">
				<h5>회원님의 성사된 매칭의 상대방회원님 정보입니다.</h5>
			</div>

			<div class="search" >
				<!-- 검색폼 -->
				<form method="get" action="${pageContext.request.contextPath}/_mypage/Ex-MatchingRecord_YB.do">
					<ul id="key">
						<li>
							<select name="selected">
								<option value="">---선택---</option>
								<option value="partnerN" <c:if test="${selected eq 'partnerN'}">selected</c:if>>상대방 이름</option>
								<option value="partnerJ" <c:if test="${selected eq 'partnerJ'}">selected</c:if>>직업</option>
							</select> 
								<input type="search" name="keyword" placeholder="상대방 이름 및 직업 검색" value="${keyword}"/>
							<button type="submit" id="s_btn">검색</button>
						</li>
					</ul>
				</form>
			</div>
			
			<div class="col-md-10 content">	
				<div class="table-responsive" style="text-align:center;">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr class="text-center">
								<th>번호</th>
								<th id="partnerName">상대방 이름</th>
								<th id="birthdate">생년월일</th>
								<th id="height">신장(cm)</th>
								<th id="academicBackground">학력</th>
								<th id="job">직업</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<%-- 조회결과가 없는 경우 --%>
							<c:when test="${output == null || fn:length(output) == 0}">
								<tr>
									<td colspan="9" align="center">찾는 상대방 이름의 조회결과가 없습니다.</td>
								</tr>
							</c:when>
	
							<%-- 조회결과가 있는  경우 --%>
							<c:otherwise>
								<%-- 조회 결과에 따른 반복 처리 --%>
								<c:set var="num" value="${pageData.totalCount - ((pageData.nowPage - 1) * pageData.listCount)}"/>
								<c:forEach var="item" items="${output}" varStatus="status">
									<c:set var="partnerName" value="${item.userName}" />
									<c:set var="birthDate" value="${item.birthDate}" />
									<c:set var="height" value="${item.height}" />
									<c:set var="academicBackground" value="${item.edu_Lv}" />
									<c:set var="job" value="${item.job}" />

								<%-- 검색어가 있다면? --%>
								<c:if test="${keyword != ''}">
									<%-- 검색어에 <mark> 태그를 적용하여 형광팬 효과 준비 --%>
									<c:set var="mark" value="<mark>${keyword}</mark>" />
									<%-- 출력을 위해 준비한 게시글 제목 또는 작성자에서 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
									<c:set var="userName" value="${fn:replace(userName, keyword, mark)}" />
									<c:set var="job" value="${fn:replace(job, keyword, mark)}" />
								</c:if>	
									
									<%-- 상세페이지로 이동하기 위한 URL --%>
									<c:url value="/_mypage/Ex-MatchingRecordView_YB.do" var="viewUrl">
										<c:param name="MemberId" value="${item.memberId}" />
									</c:url>
	
									<tr>
										<td>${num}</td>
										<td>${item.userName}</td>
										<td>${item.birthDate}</td>
										<td>${item.height}</td>
										<td>${item.edu_Lv}</td>
										<td>${item.job}</td>
									</tr>
									<c:set var="num" value="${num-1}"></c:set>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					
			<!-- 페이지 번호 구현 -->
    		<%-- 이전 그룹에 대한 링크 --%>
			<c:choose>
				<%-- 이전 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.prevPage > 0}">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/_mypage/Ex-MatchingRecord_YB.do" var="prevPageUrl">
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
				<c:url value="/_mypage/Ex-MatchingRecord_YB.do" var="pageUrl">
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
					<c:url value="/_mypage/Ex-MatchingRecord_YB.do" var="nextPageUrl">
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
	
	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>