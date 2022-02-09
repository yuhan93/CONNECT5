<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Test/idealtypeHG.css">
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#btn1")
								.click(
										function() {
											var Gender = $(
													"input[name=Gender]:checked")
													.val();
											var IsMarried = $(
													"input[name=IsMarried]:checked")
													.val();
											var Date_Loc = $(
													"input[name=Date_Loc]:checked")
													.val();
											var Height = $(
													"input[name=Height]:checked")
													.val();
											var Style = $(
													"input[name=Style]:checked")
													.val();
											var Personality = $(
													"input[name=Personality]:checked")
													.val();
											var BldType = $(
													"input[name=BldType]:checked")
													.val();
											var Sal_Annual = $(
													"input[name=Sal_Annual]:checked")
													.val();
											window
													.open(
															'${pageContext.request.contextPath}/_test/idealtype1_HG.do?Gender='
																	+ Gender
																	+ '&IsMarried='
																	+ IsMarried
																	+ '&Date_Loc='
																	+ Date_Loc
																	+ '&Height='
																	+ Height
																	+ '&Style='
																	+ Style
																	+ '&Personality='
																	+ Personality
																	+ '&BldType='
																	+ BldType
																	+ '&Sal_Annual='
																	+ Sal_Annual,
															'mywin',
															'width=800, height=300, scrollbars=yes');
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
			src="${pageContext.request.contextPath}/assets/img/idealtypeimg.PNG"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">연-결 테스트</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
				<a href="${pageContext.request.contextPath}/_test/propensity1_HG.do"
					class="list-group-item">연애성향 테스트</a> <a
					href="${pageContext.request.contextPath}/_test/idealtype_HG.do"
					class="list-group-item btncolor">이상형 찾기</a> <a
					href="${pageContext.request.contextPath}/_test/lovescore1_HG.do"
					class="list-group-item">나의 연애 매력</a>
			</div>
		</div>
	</div>

	<h3 class="col-md-10">이상형 찾기</h3>
	<div class="col-md-10 text1">
		<h5>연-결 회원님들 중에 이상형을 찾아보세요!!!</h5>
	</div>

	<div class="col-md-9 content">

		<div class="media">
			<div class="testimg">
				<img
					src="${pageContext.request.contextPath}/assets/img/testimg1.PNG">
			</div>
			<br /> <br />
			<table class="tabl">
				<tr id="test11">
					<td id="title">성별</td>
					<td>&nbsp; &nbsp;<input type="radio" name="Gender" value="0"
						id="Gender" checked>남자&nbsp;&nbsp; <input type="radio"
						name="Gender" id="Gender" value="1">여자
					</td>
				</tr>

				<tr id="test10">
					<td id="title">결혼 여부</td>
					<td>&nbsp; &nbsp;<input type="radio" name="IsMarried"
						value="0" id="IsMarried" checked>초혼&nbsp;&nbsp; <input
						type="radio" name="IsMarried" value="1" id="IsMarried">재혼
					</td>
				</tr>

				<tr id="test10">
					<td id="title">데이트 선호 <br />지역
					</td>
					<td>&nbsp; &nbsp;<input type="radio" name="Date_Loc"
						value="서울" id="Date_Loc" checked>서울
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="Date_Loc"
						value="경기도" id="Date_Loc">경기도 &nbsp;&nbsp;&nbsp;&nbsp; <input
						type="radio" name="Date_Loc" value="강원도" id="Date_Loc">강원도
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="Date_Loc"
						value="충청도" id="Date_Loc">충청도 &nbsp;&nbsp; <input
						type="radio" name="residence" value="전라도" id="Date_Loc">전라도
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="Date_Loc"
						value="경상도" id="Date_Loc">경상도 &nbsp;&nbsp;&nbsp;&nbsp; <input
						type="radio" name="Date_Loc" value="제주도" id="Date_Loc">제주도
					</td>
				</tr>

				<tr id="test10">
					<td id="title">키</td>
					<td>&nbsp; &nbsp;<input type="radio" name="Height"
						value="150cm이하" id="Height">150cm이하&nbsp;&nbsp; <input
						type="radio" name="Height" value="151~160cm" id="Height" checked>151~160cm&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="Height" value="161~170cm" id="Height">161~170cm&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="Height" value="171~180cm" id="Height">171~180cm&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="Height" value="181이상cm" id="Height">181이상cm
					</td>
				</tr>


				<tr id="test10">
					<td id="title">스타일</td>
					<td>&nbsp; &nbsp;<input type="radio" name="Style" value="귀여움"
						id="Style">귀여움&nbsp;&nbsp; <input type="radio"
						name="Style" value="남성스러움" id="Style" checked>남성스러움&nbsp;&nbsp;
						<input type="radio" name="Style" value="여성스러움" id="Style">여성스러움&nbsp;&nbsp;
						<input type="radio" name="Style" value="마름" id="Style">마름&nbsp;&nbsp;
						<input type="radio" name="Style" value="통통" id="Style">통통
					</td>
				</tr>

				<tr id="test10">
					<td id="title">성격</td>
					<td>&nbsp; &nbsp;<input type="radio" name="Personality"
						value="외향적 " id="Personality" checked>외향적&nbsp;&nbsp; <input
						type="radio" name="Personality" value="내향적 " id="Personality">내향적&nbsp;&nbsp;
						<input type="radio" name="Personality" value="감성적 "
						id="Personality">감성적&nbsp;&nbsp; <input type="radio"
						name="Personality" value="직관적 " id="Personality">직관적&nbsp;&nbsp;
						<input type="radio" name="Personality" value="자상함"
						id="Personality">자상함
					</td>
				</tr>

				<tr id="test10">
					<td id="title">혈액형</td>
					<td>&nbsp; &nbsp;<input type="radio" name="BldType" value="A"
						id="BldType" checked>A형&nbsp;&nbsp; <input type="radio"
						name="BldType" value="B" id="BldType">B형&nbsp;&nbsp; <input
						type="radio" name="BldType" value="AB" id="BldType">AB형&nbsp;&nbsp;
						<input type="radio" name="BldType" value="O" id="BldType">O형
					</td>
				</tr>

				<tr id="test10">
					<td id="title">연봉</td>
					<td>&nbsp; &nbsp;<input type="radio" name="Sal_Annual"
						value="3000이하 " id="Sal_Annual" checked>3000이하&nbsp;&nbsp;
						<input type="radio" name="Sal_Annual" value="5000이하 "
						id="Sal_Annual">5000이하&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="radio" name="Sal_Annual" value="7000이하 " id="Sal_Annual">7000이하&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="Sal_Annual" value="1억이상" id="Sal_Annual">1억이상
					</td>
				</tr>

			</table>
			<br />
			<div class="b1">
				<button class="btn btn-default" style="height: 30px; width: 80px;"
					type="submit" id="btn1">검색하기</button>
			</div>
		</div>

	</div>


	<jsp:include page="../assets/inc/footer.jsp" />


</body>
</html>