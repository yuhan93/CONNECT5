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


<script src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ckeditor.js"></script>
	

<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/question1.png" alt="연-결"
			class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
				<h3 class="title">연-결 코치</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
					<a href="${pageContext.request.contextPath}/_coach/meetingTip_GD.do"
					class="list-group-item ">미팅성공전략TIP</a> <a
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



<form method="post" id="ok" name="ok"  enctype="multipart/form-data">

			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th class="text-center" id="title">제목</th>
						<th class="text-center"><input type="text"
							placeholder="제목을 입력하세요." id="textarea" name="title" /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="context" colspan="3" align="center"><textarea
								placeholder="내용을 입력하세요." class="form-control" id="contentarea"
								name="content" /></textarea></td>
					</tr>
					<tr>
						<td colspan="3" align="center">
						<input type="file" name="file"></td>
					</tr>

				</tbody>
			</table>


	<div class="pull-right">
		<button class="btn btn-default" id="btn1">글쓰기</button>
		<button class="btn btn-default"
			onclick="location='${pageContext.request.contextPath}/_coach/loveColumn_GD.do'">취소</button>
	</div>
	</form>
		





		
		

			
				
	</div>
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
												url : "${pageContext.request.contextPath}/_coach/ColumnWriteOk.do",
												type : "POST",
												data : form,
												dataType : 'text',
												processData : false,
												contentType : false,
												success : function(data) {
													alert("게시글이 등록 되었습니다.");
													console.log(data);
												},
												error : function() {
													alert("오류발생");

												}
											});
									location.href = "${pageContext.request.contextPath}/_coach/loveColumn_GD.do";
								}
							
							});
		});
	</script>








	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>