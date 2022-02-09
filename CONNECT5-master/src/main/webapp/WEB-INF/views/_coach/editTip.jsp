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
	href="${pageContext.request.contextPath}/assets/css/GD/Board/meetingTip.css">




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
					class="list-group-item btncolor">미팅성공전략TIP</a> <a
					href="${pageContext.request.contextPath}/_coach/loveColumn_GD.do"
					class="list-group-item">LOVE 컬럼</a> <a
					href="${pageContext.request.contextPath}/_coach/DatingCourse_YB.do"
					class="list-group-item">데이트 코스</a> <a
					href="${pageContext.request.contextPath}/_coach/review_SE.do"
					class="list-group-item">연-결 만남 후기</a> <a
					href="${pageContext.request.contextPath}/_coach/QnA_SE.do"
					class="list-group-item">연-결 Q &amp; A</a>
			</div>
		</div>
	</div>


	<h3 class="col-md-10">미팅성공전략TIP</h3>
	<div class="col-md-10 text1">
		<h5>연-결에서 제안하는 미팅자리 훈남 훈녀 되기 노하우</h5>
	</div>

	<div class="col-md-9 content">







		<!-- 내용 작성  -->

		<hr />
		<div class="table-responsive">

	

			<form method="post" id="ok" name="ok" enctype="multipart/form-data">
				<input type="hidden" name="boardid" value="${output.getBoardId()}">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center" id="title">제목</th>
							<th class="text-center"><input type="text"
								value="${output.getTitle()}" id="textarea" name="title" />
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="context" colspan="3" align="center"><textarea
									placeholder="${output.content }" class="form-control" id="contentarea"
									name="content" value="${output.getContent()}"/></textarea></td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input type="file"
								name="file">
								<br />
								<br />
								기존 이미지
								<br />
								<img
									src="${pageContext.request.contextPath}/assets/upload${output.getContentImg()}"
									width="250" height="150"></td>
						</tr>

					</tbody>
				</table>


				<div class="pull-right">
					<button type="button" class="btn btn-default" id="btn1">수정</button>
					<button class="btn btn-default"
						onclick="history.back();">취소</button>
				</div>
			</form>

		</div>
		<script>
			$(function() {

				$("#btn1")
						.click(
								function(e) {
									e.preventDefault();
									if ($("#profile_img").val() == "") {
										alert("사진을 선택해주세요");
									} else if ($("#textarea").val() == "") {
										alert("제목을 입력해주세요");
									} else if ($("#contentarea").val() == "") {
										alert("본문 내용을 입력해주세요");
									} else {
										console.log("AJAX");
										var form = new FormData(document
												.getElementById('ok'));
										console.log(form);

										$
												.ajax({
													url : "${pageContext.request.contextPath}/_coach/editTipok.do",
													type : "POST",
													data : form,
													dataType : 'text',
													processData : false,
													contentType : false,
													success : function(data) {
														alert("수정 저장되었습니다.");
														console.log(data);
													},
													error : function() {
														alert("오류발생");

													}
												});
										location.href = "${pageContext.request.contextPath}/_coach/meetingTip_GD.do";
									}

								});
			});
		</script>








		<!-- 변경 사항 -->

		<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>