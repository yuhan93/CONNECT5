<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${loginInfo == null}">
	<script>
		alert("로그인 후에 이용해주세요.");
		location.href="${pageContext.request.contextPath}/_login/login_HG.do";
	</script>
</c:if>

<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/SE/Coach/QnAWrite1.css">

<script>
	function add() {
		if (confirm("게시물을 등록하시겠습니까?") == true) {
			alert("등록이 완료되었습니다.");
		} else {
			return;
		}
		location.href = "${pageContext.request.contextPath}/_coach/reviewRead_SE.do;
	}

	function cancel() {
		if (confirm("정말 취소하시겠습니까?") == true) {
			alert("취소되었습니다.");
		} else {
			return;
		}
		location.href = "${pageContext.request.contextPath}/_coach/review_SE.do";
	}
</script>

<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />

	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/QnA.jpg" alt="연-결"
			class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">연-결 코치</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
				<a href="${pageContext.request.contextPath}/_coach/meetingTip_GD.do" class="list-group-item">미팅성공전략TIP</a> <a href="${pageContext.request.contextPath}/_coach/loveColumn_GD.do"
					class="list-group-item">LOVE 컬럼</a> <a href="${pageContext.request.contextPath}/_coach/DatingCourse_YB.do"
					class="list-group-item">데이트 코스</a> <a href="${pageContext.request.contextPath}/_coach/review_SE.do"
					class="list-group-item btncolor">연-결 만남 후기</a> <a href="${pageContext.request.contextPath}/_coach/QnA_SE.do"
					class="list-group-item ">연-결 Q &amp; A</a>
			</div>
		</div>
	</div>


	<h3 class="col-md-10">연-결 만남 후기</h3>
	<div class="col-md-10 text1">
		<h5>연-결 회원님들의 만남 후기 이야기를 들어보세요.</h5>
	</div>
	
	<div class="col-md-10 content">
		<form method="post" action="${pageContext.request.contextPath}/_coach/reviewWrite_ok_SE.do">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<tbody>
					<tr>
						<th id="num">제목</th>
						<th><input type="text"
							placeholder="제목을 입력하세요." id="textarea" name="Title" /></th>
					</tr>
				</tbody>					
			</table>
			<input placeholder="내용을 입력하세요." class="form-control" id="contentarea" name="Content" />
		
		</div>

		<br />
		<div class="pull-right">
			<button type="submit" class="btn btn-default" onclick="add()">글쓰기</button>
			<button type="reset" class="btn btn-default" onclick="cancel()">취소</button>
		</div>
		</form>
	</div>
	
	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>