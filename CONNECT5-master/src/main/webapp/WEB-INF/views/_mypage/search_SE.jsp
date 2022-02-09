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
<link href='${pageContext.request.contextPath}/assets/js/fullcalendar.min.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/assets/js/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='${pageContext.request.contextPath}/assets/js/moment.min.js'></script>
<script src='${pageContext.request.contextPath}/assets/js/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/assets/js/fullcalendar.min.js'></script>
<script src='${pageContext.request.contextPath}/assets/js/ko.js'></script>
<script src='${pageContext.request.contextPath}/assets/js/ajax_helper.js'></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/SE/Mypage/search.css">

<script type="text/javascript">
      $(document).ready(function () {
        $('#addBtn').click(function () {
        	var ReqSpService = $('input[name="ReqSpService"]:checked').val();
        	window.open('${pageContext.request.contextPath}/_mypage/searchDateOpen_SE.do?ReqSpService='+ReqSpService,'mywin','width=700, height=450, scrollbars=yes');
        });
      });
</script>

<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}
	
	#calendar {
		max-width: 800px;
		margin: 0 auto; 
	}
	.fc-scroller {
  	overflow: visible !important;
	}
	
</style>
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

	<div class="col-md-10 content">
		

	<div id='calendar'>
	</div>
		
	</div>
	<div class="pull-right">
		<br />

		<p><span
				style="font-weight: bold; font-size: 1.3em; margin-left: 40px;"
				id="name">${username} </span> <span> 님의 잔여 매칭 횟수 </span> <span
				style="font-weight: bold; font-size: 1.3em;" id="count"> 
				<c:if test="${member_lv == 1}">
					${date_rest}
				</c:if> 
				<c:if test="${member_lv == 2}">
					${date_rest} 
				</c:if> 
				<c:if test="${member_lv == 3}">
					${date_rest} 
				</c:if> 
				<c:if test="${member_lv == 4}">
					Free
				</c:if>
			</span> <span> 회 </span><br/><input type="checkbox" name="ReqSpService" value="1" style="margin-left: 40px;" /> 스페셜 서비스 사용</p>
		<button id="addBtn" type="submit" class="btn btn-default pull-right">등록하기</button>
		
	</div>
	
	<div class="modal fade" id="listModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">현황</h4>
					</div>
					<div class="modal-body">
						<table class="table-bordered" id="modaltable1">
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>성별</th>
									<th>나이</th>
									<th>직업</th>
								</tr>
							</thead>
							<tbody id="tbody">
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

	<jsp:include page="../assets/inc/footer.jsp" />
<script>
	$(function(){
		$('#calendar').fullCalendar({
		      defaultDate: moment().format('YYYY-MM-DD'),
		      editable: false,
		      eventLimit: 2,
		      eventLimitText:"명",
		      eventClick: function(calEvent, jsEvent, view){
		    	  var start = moment(calEvent.start).format('YYYY-MM-DD');
					$.ajax({
					url : "${pageContext.request.contextPath}/_mypage/search_ok.do",
					type : "GET",
					data : {start:start},
					dataType : 'json',
					success : function(start) {
						console.log(start);
						$("#tbody").html("");
						$.each(start, function(index) {
							if (start[index].Gender == 0) {
								start[index].Gender = "남자"
							} else {
								start[index].Gender = "여자";
							}
							$('#tbody').append("<tr><td>" + (index+1) + "</td><td><a href='${pageContext.request.contextPath}/_mypage/searchRequestConfirm_SE.do?MemberId=" + start[index].MemberId + "'>" + start[index].UserName + "</a></td><td>" + start[index].Gender + "</td><td>" + start[index].BirthDate + "</td><td>" + start[index].Job + "</td></tr>");
						});
					},
					error : function() {
						alert("오류발생");
						console.log(data);
					}
				});
					$('#listModal').modal('show');
		     },
		      events: ${jsonList}	     
	    });		
	});
</script>
</body>
</html>