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
	href="${pageContext.request.contextPath}/assets/css/SE/Mypage/searchRequestConfirm.css">
<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />

	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/img1_SE.jpg" alt="연-결"
			class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">My 연-결</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
				<a href="${pageContext.request.contextPath}/_mypage/myInfo_GD.do" class="list-group-item ">My현황</a> <a
					href="${pageContext.request.contextPath}/_mypage/search_SE.do" class="list-group-item btncolor">인연 찾기</a> <a
					href="${pageContext.request.contextPath}/_mypage/1_1questionEmpty_YH.do" class="list-group-item">1:1 문의</a> <a
					href="${pageContext.request.contextPath}/_mypage/Ex-MatchingRecord_YB.do" class="list-group-item">매칭 기록
					보기 </a><a href="${pageContext.request.contextPath}/_mypage/personal_information1_HG.do" class="list-group-item">개인정보수정</a>
				<a href="${pageContext.request.contextPath}/_mypage/withdrawal1_HG.do" class="list-group-item">회원탈퇴</a>
			</div>
		</div>
	</div>



	<h3 class="col-md-10">인연 찾기</h3>
	<div class="col-md-10 text1">
		<h5>나의 인연을 찾아봅시다.</h5>
	</div>
	
	<div class="col-md-9 content">
	<br />
		<div class="col-md-2">
			<img src="${pageContext.request.contextPath}/assets/upload/${output.getUser_Img()}" style="border: 1px solid black; width: 150px; height: 150px;">
		</div>
		<div class="col-md-9">
			<table class="table table-bordered" id="info">
				<tr>
					<th>이름</th>
					<td style="width:130px;">${output.getUserName()}</td>
					<th>성별</th>
					<c:choose>
					<c:when test="${output.getGender() == 0 }">
						<td>남성</td>
					</c:when>
					<c:otherwise>
						<td>여성</td>
					</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<th>연봉</th>
					<td>${output.getSal_Annual()}</td>
					<th>선호성격</th>
					<td>${output.getPersonality()}</td>
				</tr>
				<tr>
					<th>선호스타일</th>
					<td>${output.getStyle()}</td>
					<th>생년월일</th>
					<td>${output.getBirthDate()}</td>
				</tr>
			</table>
		</div>

		<div class="pull-right">
			<button class="btn btn-default" onclick="location.href = '${pageContext.request.contextPath}/_mypage/search_SE.do'">이전</button>
			<button class="btn btn-default" onclick="apply();">신청하기</button>
		</div>
	</div>

<jsp:include page="../assets/inc/footer.jsp" />
<script>
	var apply = function() {
		location.href = '${pageContext.request.contextPath}/_mypage/search_SE.do?MemberId=${output.getMemberId()}';
	}
</script>
</body>
</html>