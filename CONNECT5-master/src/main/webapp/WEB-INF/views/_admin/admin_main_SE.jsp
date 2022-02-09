<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Grid</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/footerMain.PNG" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/img/footerMain.PNG" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nanumfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/SE/Admin/main.css">
<link href='${pageContext.request.contextPath}/assets/js/fullcalendar.min.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/assets/js/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='${pageContext.request.contextPath}/assets/js/moment.min.js'></script>
<script src='${pageContext.request.contextPath}/assets/js/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/assets/js/fullcalendar.min.js'></script>
<script src='${pageContext.request.contextPath}/assets/js/ko.js'></script>
<script src='${pageContext.request.contextPath}/assets/js/ajax_helper.js'></script>

<script type="text/javascript">
function cancel() {
if (confirm("취소하시겠습니까?") == true) {
alert("취소 되었습니다.");
} else {
return;
}
location.href = "${pageContext.request.contextPath}/_admin/deleteOk.do?MemberId=" + start[index].MemberId;
}
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
	
	.modal-footer {
	border-top: 1px solid #e5e5e5;
}
	
</style>

</head>
<body>
	<div class="container">
		<div class="top">
			<div class="col-md-12 top_login">
				<p id="connect">
					admin 님 접속중
					<button type="submit" class="btn btn-xs" onclick="location.href = '${pageContext.request.contextPath}'">Logout</button>
				</p>
			</div>
		</div>


		<div class="col-md-2 sidebar1">
			<a href="${pageContext.request.contextPath}/_admin/admin_main_SE.do" class="list-group-item active">대시보드</a> <a href="${pageContext.request.contextPath}/_admin/admin_userManager1_HG.do"
				class="list-group-item">회원관리</a> <a href="${pageContext.request.contextPath}/_admin/admin_userManagement_YH.do"
				class="list-group-item">게시판 관리</a> <a href="${pageContext.request.contextPath}/_admin/admin_userApply_YH.do"
				class="list-group-item">신청현황</a> <a href="${pageContext.request.contextPath}/_admin/admin_Question_SE.do" class="list-group-item">문의현황</a>
			<a href="${pageContext.request.contextPath}/_admin/admin_Payment_GD.do" class="list-group-item">결제관리</a>

		</div>
		<div class="col-md-10 middle">
			<div class="col-md-12 text_box">
				<br />
				<div id="calendar">
				</div>
				
				<br />
				<p>연-결 등급별 현황</p>
				<table class="table table-bordered" id="foot">
					<thead>
						<tr>
							<th>성별</th>
							<th>준회원</th>
							<th>브론즈</th>
							<th>실버</th>
							<th>골드</th>
							<th>VIP</th>
							<th>총 회원 수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>남성</td>
							<td>${countM_N}</td>
							<td>${countM_B}</td>
							<td>${countM_S}</td>
							<td>${countM_G}</td>
							<td>${countM_V}</td>
							<td>${countM_All}</td>
						</tr>
						<tr>
							<td>여성</td>
							<td>${countW_N}</td>
							<td>${countW_B}</td>
							<td>${countW_S}</td>
							<td>${countW_G}</td>
							<td>${countW_V}</td>
							<td>${countW_All}</td>
						</tr>
					</tbody>
				</table>

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
							<table class="table-bordered" id="modaltable1">
								<thead>
									<tr>
										<th>번호</th>
										<th>신청자이름</th>
										<th>성별</th>
										<th>상대이름</th>
										<th>성별</th>
										<th>취소</th>
									</tr>
								</thead>
								<tbody id="tbody2">
								</tbody>
							</table>
							<br />
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
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
					url : "${pageContext.request.contextPath}/_admin/searchAdmin_ok.do",
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
						console.log("오류1");
						console.log(start);
					}
				});
					$.ajax({
						url : "${pageContext.request.contextPath}/_admin/sucModal_ok.do",
						type : "GET",
						data : {start:start},
						dataType : 'json',
						
						success : function(start) {
							console.log(start);
							$("#tbody2").html("");
							$.each(start, function(index) {
								if (start[index].Gender == 0) {
									start[index].Gender = "남자"
								} else {
									start[index].Gender = "여자";
								}
								if (start[index].Gender1 == 0) {
									start[index].Gender1 = "남자"
								} else {
									start[index].Gender1 = "여자";
								}
								$('#tbody2').append("<tr><td>" + (index+1) + "</td><td>" + start[index].UserName1 + "</td><td>" + start[index].Gender1+ "</td><td>" + start[index].UserName + "</td><td>" + start[index].Gender + "</td><td><a href='${pageContext.request.contextPath}/_admin/deleteOk.do?SucMatchId=" + start[index].SucMatchId + "'><button type='submit' class='btn btn-xs'>" + "취소" + "</button></a></td></tr>");
							});
						
					},
					error : function() {
						alert("오류발생");
						console.log("오류2");
						console.log(start);
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