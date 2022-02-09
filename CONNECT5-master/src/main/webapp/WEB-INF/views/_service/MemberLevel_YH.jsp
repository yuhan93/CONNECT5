<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/YH/Service/Member.css">

<script>
	
</script>

<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/main1000.jpg"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">서비스 안내</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
				<a
					href="${pageContext.request.contextPath}/_service/ServiceProcedures_YB.do"
					class="list-group-item">서비스 이용절차</a> <a
					href="${pageContext.request.contextPath}/_service/MembershipRegisGuide_YB.do"
					class="list-group-item">회원가입안내</a> <a
					href="${pageContext.request.contextPath}/_service/MemberLevel_YH.do"
					class="list-group-item btncolor">회원등급안내</a> <a
					href="${pageContext.request.contextPath}/_service/SpecialService_YH.do"
					class="list-group-item">연-결 스페셜 서비스</a> <a
					href="${pageContext.request.contextPath}/_service/MemberStatus_YB.do"
					class="list-group-item">회원 현황</a>
			</div>
		</div>
	</div>


	<h3 class="col-md-10">회원등급안내</h3>
	<div class="col-md-10 text1">
		<h5>개인 스펙에 따라 등급이 나눠집니다.</h5>
	</div>

	<div class="col-md-10 content">
		<table class="table1">
			<tr>
				<th class="table2" style="height: 45px;">회원 등급</th>
				<th class="table2">가입비</th>
				<th class="table2">횟수 + 상품권</th>
				<th class="table2">비고</th>
			</tr>
			<tr>
				<td class="table3"><img
					src="${pageContext.request.contextPath}/assets/img/브론즈1.jpg"
					alt="브론즈"><br> <strong><span class="blink"
						style="text-align: center; color: #800000">브론즈</span><br /></strong></td>
				<td width="150" height="200" class="table1"><span
					style="text-align: center;">브론즈 회원 : 299 만원</span></td>
				<td width="150" height="200" class="table1"><span
					style="text-align: center;">매칭 연-결 횟수 : 3회</span></td>
				<td width="150" height="200" class="table1" rowspan="4"><span
					style="text-align: center;"></span> <a
					href="${pageContext.request.contextPath}/./_payment/mustInput_SE.do"
					type="button" class="btn btn-warning"> 결제하기 </a></td>

			</tr>
			<tr>
				<td class="table3"><img
					src="${pageContext.request.contextPath}/assets/img/실버1.jpg"
					alt="실버"><br> <strong><span
						style="text-align: center; color: #c0c0c0"><span
							class="blink">실버</span><br></span></strong></td>
				<td width="150" height="200" class="table1"><div
						style="text-align: center;">실버 회원 : 499 만원</div></td>
				<td width="150" height="200" class="table1"><div
						style="text-align: center;">
						매칭 연-결 횟수 : 5회 <br> + <br> 호텔 식사권 3회
					</div></td>
			<tr>
				<td class="table3"><img
					src="${pageContext.request.contextPath}/assets/img/골드1.jpg"
					alt="골드"><br> <strong><span
						style="text-align: center; color: #D7DF01"><span
							class="blink">골드</span><br></span></strong><br></td>
				<td width="150" height="200" class="table1" class="table1"><span
					style="text-align: center;">골드 회원 : 699 만원</span></td>
				<td width="150" height="200" class="table1" class="table1"><span
					style="text-align: center;"> 매칭 연-결 횟수 : 7회 <br> + <br>
						호텔식사권 5회 <br> + <br> 뮤지컬 관람 2회
				</span></td>

			</tr>
			<tr>
				<td class="table3"><img
					src="${pageContext.request.contextPath}/assets/img/VIP1.jpg"
					alt="VIP"><br> <strong><span
						style="text-align: center; color: #f00"><span class="blink">VIP</span><br></span></strong></td>
				<td width="150" height="200" class="table1"><span
					style="text-align: center;">VIP 회원 : 999 만원</span></td>
				<td width="150" height="200" class="table1"><span
					style="text-align: center;">매칭 연-결 횟수 : <br> 성혼 시까지
				</span></td>

			</tr>
		</table>
	</div>


	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>