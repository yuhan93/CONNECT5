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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/YH/Mypage/1_1question_replyWaiting_YH.css">
<script>
	function add() {
		if (confirm("재문의 하시겠습니까?") == true) {
		} else {
			return;
		}
		location.href = "${pageContext.request.contextPath}/_mypage/1_1question_ok_YH.do";
	}
</script>

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
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th class="text-center" id="num">제목</th>
						<th class="text-left">${output.getTitle()}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="context" colspan="3">${output.getContent()}</td>
					</tr>
				</tbody>
			</table>
			<c:choose>
				<c:when test="${fn:length(output1) gt 0}">
					<c:forEach var="item" items="${output1}" varStatus="status">
						<c:set var="Re_content" value="${item.getRe_Content()}" />
						<table class="table table-bordered">
							<thead>
								<tr>
									<th id="num">제목</th>
									<th class="text-left">${item.getRe_Title() }</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th id="context" colspan="3">${item.getRe_Content()}</th>
								</tr>
							</tbody>
						</table>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th class="text-center" id="num">제목</th>
								<th class="text-left">안녕하세요. 연-결 담당자 입니다.</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td id="context" colspan="3">관리자 답변 대기중 입니다.</td>
							</tr>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="pull-right">
			<button class="btn btn-default" onclick="location.href = '${pageContext.request.contextPath}/_mypage/1_1questionedit.do?BoardId=${output.getBoardId() }'">재문의</button>
			<button class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/_mypage/1_1questionEmpty_YH.do'">확인</button>
		</div>
	</div>
	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>