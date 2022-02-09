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
	href="${pageContext.request.contextPath}/assets/css/GD/Board/readTip.css">





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







	<hr />
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th class="text-center" id="num">제목</th>
						<th class="title">${output.title}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="context" colspan="2" align="center"><img
							src="${pageContext.request.contextPath}/assets/upload${output.getContentImg()}"
							width="250" height="150"> <br /> <br />
							<p>${output.content}</p></td>

					</tr>

				</tbody>
			</table>
		</div>

		<div class="pull-right">
			<button class="btn btn-default">
				<a href="${pageContext.request.contextPath}/_coach/loveColumn_GD.do">목록</a>
			</button>

			<c:if test="${isadmin==1 }">

				<button class="btn btn-default">
					<a
						href="${pageContext.request.contextPath}/_coach/editColumn.do?BoardId=${output.getBoardId()}">수정</a>
				</button>

				<button class="btn btn-default">
					<a
						href="${pageContext.request.contextPath}/_coach/deleteColumn.do?BoardId=${output.getBoardId()}">삭제</a>
				</button>


			</c:if>
		</div>




	</div>
	<script type="text/javascript">
		
	</script>









	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>