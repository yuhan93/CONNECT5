<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/YH/Mypage/1_1questionWrite_YH.css">
<script>
function cancel() {
	if (confirm("정말 취소하시겠습니까?") == true) {
		alert("취소되었습니다.");
	} else {
		return;
	}
	location.href = "${pageContext.request.contextPath}/_mypage/1_1questionEmpty_YH.do";
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
		<form action="${pageContext.request.contextPath}/_mypage/1_1questionadd_Ok.do" method="POST">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th class="num" id="Title">제목</th>
						<th><input type="text" placeholder="제목을 입력하세요."
							class="textarea" id="textarea" name="Title"/></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="context" colspan="3" align="center" id="Content">
						<input placeholder="내용을 입력하세요." class="form-control" class="contentarea" id="contentarea" name="Content" /></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="pull-right">
			<button type="submit" class="btn btn-default">글쓰기</button>
			<button type="reset" class="btn btn-default" onclick="cancel()">취소</button>
		</div>
		</form>
	</div>

	<!-- 변경 사항 -->
	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>