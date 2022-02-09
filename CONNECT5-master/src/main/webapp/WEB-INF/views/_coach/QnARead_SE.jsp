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
	href="${pageContext.request.contextPath}/assets/css/SE/Coach/QnARead2.css">

<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />

	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/QnA.jpg"
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
					class="list-group-item">LOVE 컬럼</a> <a
					href="${pageContext.request.contextPath}/_coach/DatingCourse_YB.do"
					class="list-group-item">데이트 코스</a> <a
					href="${pageContext.request.contextPath}/_coach/review_SE.do"
					class="list-group-item">연-결 만남 후기</a> <a
					href="${pageContext.request.contextPath}/_coach/QnA_SE.do"
					class="list-group-item btncolor">연-결 Q &amp; A</a>
			</div>
		</div>
	</div>


	<h3 class="col-md-10">연-결 Q &amp; A</h3>
	<div class="col-md-10 text1">
		<h5>연-결 회원님들의 공유 게시판입니다.</h5>
	</div>

	<div class="col-md-10 content">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th class="text-center" id="num">제목</th>
						<th class="text-left">${output.getTitle()}</th>
						<th id="date">${output.creationDate}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="context" colspan="3">${output.content}</td>
					</tr>
					<tr>
						<td>이전글</td>
							<th class="text_select" colspan="2">
								<c:choose>
									<c:when test="${nextBoard != null}">
										<c:url var="nextUrl" value="/_coach/QnARead_SE.do">
											<c:param name="Title" value="${Title}" />
											<c:param name="BoardId" value="${nextBoard.getBoardId()}" />
										</c:url>
											<a href="${nextUrl}">${nextBoard.getTitle()}</a>
									</c:when>
									<c:otherwise>
										이전글이 없습니다.
									</c:otherwise>
								</c:choose>
							</th>
					</tr>
					<tr>
						<td>다음글</td>
							<th class="text_select" colspan="2">
								<c:choose>
									<c:when test="${prevBoard != null}">
										<c:url var="prevUrl" value="/_coach/QnARead_SE.do">
											<c:param name="Title" value="${Title}" />
											<c:param name="BoardId" value="${prevBoard.getBoardId()}" />
										</c:url>
											<a href="${prevUrl}">${prevBoard.getTitle()}</a>
									</c:when>
									<c:otherwise>
										다음글이 없습니다.
									</c:otherwise>
								</c:choose>
							</th>
					</tr>
				</tbody>
			</table>
			<br />

			<form method="post"
				action="${pageContext.request.contextPath}/_coach/replyWrite_ok_SE.do">
				<div class="form-group" id="inputreply">
				<input type="hidden" name="BoardId" value=${output.getBoardId() }>
					<input type="hidden" name="Re_Title" value="댓글달기" /> 댓글달기 &nbsp; <input type="text" id="Re_Content" name="Re_Content" class="form-control" placeholder="댓글을 입력하세요." />
					<button type="submit" class="btn btn-default pull-right"
						id="replybtn">등록</button>
				</div>
			</form>

			<br />

			<c:choose>
				<%-- 조회결과가 없는 경우 --%>
				<c:when test="${output1 == null || fn:length(output1) == 0}">

				</c:when>
				<%-- 조회결과가 있는  경우 --%>
				<c:otherwise>
					<%-- 조회 결과에 따른 반복 처리 --%>
					<c:forEach var="item" items="${output1}" varStatus="status">
						<c:set var="re_content" value="${item.re_Content}" />
						<c:set var="username" value="${item.userName}" />
						<c:set var="re_creationDate" value="${item.re_CreationDate}" />
						<span style='display: none' id="CIa${status.index}">${item.replyId}</span>
						<span style='display: none' id="Ca${status.index}">${item.memberId}</span>

						<div class="media-body">
							<!-- 제목영역의 float 처리를 위한 마감제 박스 -->
							<div class="clearfix">
								<!-- 제목에 float: left 적용 - pull-left -->
								<h4 class="media-heading pull-left">${username}
									&nbsp; <small>${re_creationDate}</small>
								</h4>
								<!-- 제목에 float: right 적용 - pull-right -->
								<div class="pull-right">
									<a href="a${status.index}" title="수정" class="pull-right bcd btn6"> <i class="glyphicon glyphicon-edit"></i></a>
									<a href="${pageContext.request.contextPath}/_coach/replyDelete_SE.do?ReplyId=${item.replyId}" title="삭제"><i class="glyphicon glyphicon-remove"></i></a>
								</div>
							</div>
							<p id="a${status.index}">${re_content}</p>
						</div>

					</c:forEach>
				</c:otherwise>
			</c:choose>

		</div>

		<br />
		<button class="btn btn-default pull-right"
			onclick="location.href = '${pageContext.request.contextPath}/_coach/QnA_SE.do'">목록</button>

	</div>

	<jsp:include page="../assets/inc/footer.jsp" />
	<script>
		$(".btn6").click(function(e) {
			e.preventDefault();
            var g;
            var h;
            var p;
            var f = $(this).attr("href");
            g = $("#"+f).html();
            h = $("#CI"+f).html();
            p = $("#C"+f).html();
            console.log(h);

							var repEdit;
							repEdit = "<form method='post' action='${pageContext.request.contextPath}/_coach/replyeditOk.do'>"
							repEdit += "<input type='hidden' name='replyId' value='"+h+"' />"
							repEdit += "<div class='form-group' id='inputreply'><input type='hidden' name='BoardId' value=${output.getBoardId()}><input type='hidden' name='MemberId' value='"+p+"' />"
							repEdit += "<input type='hidden' name='Re_Title' value='댓글달기' /> 댓글달기 &nbsp; <input type='text' id='Re_Content1' name='Re_Content' class='form-control' value='"+g+"'/>"
							repEdit += "<button type='submit' class='btn btn-default pull-right' id='replybtn'>등록</button>"
							repEdit += "<button type='reset' class='btn btn-default pull-right' id='cancelbtn'>취소</button></div></form>"
							$("#"+f).html(repEdit);
							
							$("#cancelbtn").click(function() {
								$("#"+f).html(g);
							});
							
						});
		
	</script>
</body>
</html>