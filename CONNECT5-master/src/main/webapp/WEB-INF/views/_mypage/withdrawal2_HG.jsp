<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Mypage/withdrawal2.css">
<script>
$(document).ready(function() {
	$("#btn1").click(function() {
		
		var contentarea = $("#contentarea").val();
		if (contentarea.length == 0) {
			alert("탈퇴사유 내용을 적어주세요.");
			$("#contentarea").focus();
			return false;
		}
	});
});

</script>


<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>

	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img
			src="${pageContext.request.contextPath}/assets/img/withdrawalimg.PNG"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="center">
		<div class="col-md-2">
			<!-- 패널 타이틀1 -->
			<div class="left_sidebar">
				<h3 class="title">My 연-결</h3>
				<!-- 사이드바 메뉴목록1 -->
				<div class="list-group">
					<a href="${pageContext.request.contextPath}/_mypage/myInfo_GD.do"
						class="list-group-item ">My현황</a> <a
						href="${pageContext.request.contextPath}/_mypage/search_SE.do"
						class="list-group-item">인연 찾기</a> <a
						href="${pageContext.request.contextPath}/_mypage/1_1questionEmpty_YH.do"
						class="list-group-item">1:1 문의</a> <a
						href="${pageContext.request.contextPath}/_mypage/Ex-MatchingRecord_YB.do"
						class="list-group-item">매칭 기록 보기 </a><a
						href="${pageContext.request.contextPath}/_mypage/personal_information1_HG.do"
						class="list-group-item ">개인정보수정</a> <a
						href="${pageContext.request.contextPath}/_mypage/withdrawal1_HG.do"
						class="list-group-item btncolor">회원탈퇴</a>
				</div>
			</div>
		</div>

		<h3 class="col-md-10">회원탈퇴</h3>
		<div class="col-md-9 content">
			<form method="post"
				action="${pageContext.request.contextPath}/_mypage/withdrawal2ok_HG.do">
				<input type="hidden" name="MemberId" value="${output.getMemberId()}" />
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead class="thead1">
							<tr>
								<th class="text-center" id="num">이름</th>
								<th class="text-center" id="name1">${output.getUserName()}</th>
								<th class="text-center" id="num">아이디</th>
								<th class="text-center"><input type="text"
									placeholder="아이디입력란" id="textarea2"
									value="${output.getUserId()}" /></th>
								<th class="text-center" id="num">비밀번호</th>
								<th class="text-center"><input type="password"
									placeholder="비밀번호입력란" id="textarea1"
									value="${output.getUserPw()}" /></th>
							</tr>
							<tr>
								<th class="text-center" colspan="6">탈퇴사유</th>

							</tr>
							<tr>
								<th class="text-center" colspan="6"><input class="text4"
									type="radio" name="ex" checked />이용이 불편하고 장애가
									많음&nbsp;&nbsp;&nbsp;&nbsp; <input class="text4" type="radio"
									name="ex" checked />사용빈도가 낮아서&nbsp;&nbsp;&nbsp;&nbsp; <input
									class="text4" type="radio" name="ex" checked />서비스
									불만&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="ex" />기타</th>
							</tr>

						</thead>
						<tbody>
							<tr>
								<td id="context" colspan="3" align="center"><textarea
										placeholder="탈퇴사유" class="form-control" id="contentarea" /></textarea></td>
							</tr>

						</tbody>
					</table>

					<div class="b1">
						<button class="btn btn-default" type="reset"
							style="height: 30px; width: 80px;">취소</button>
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						<button class="btn btn-default" type="submit"
							style="height: 30px; width: 80px;" id="btn1">탈퇴하기</button>
					</div>
				</div>
			</form>
		</div>

	</div>
	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>