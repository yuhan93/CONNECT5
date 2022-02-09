<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/GD/Payment/mustInput.css">




<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img
			src="${pageContext.request.contextPath}/assets/img/mustinputImg.jpg"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">유료 결제</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
				<a href="#" class="list-group-item btncolor">필수 입력 항목</a> <a
					href="#" class="list-group-item">결제 수단 선택</a> <a href="#"
					class="list-group-item">결제 완료</a>
			</div>
		</div>
	</div>


	<h3 class="col-md-10">정회원 필수 입력 항목</h3>
	<div class="col-md-10 text1">
		<h5>추가 정보를 입력해주세요.</h5>
	</div>

	<form name="next" id="next" enctype="multipart/form-data">
		<div class="col-md-9 content" id="ajax">

			<table class="table table-bordered">

				<tr>

					<th id="title">프로필사진</th>
					<th><input type="file" name="profile_img" id="profile_img"></th>

					<th id="title">키</th>
					<th><select name="height" id="height">
							<option value="">--------선택--------</option>
							<option value="150cm이하">150cm이하</option>
							<option value="151~160cm">151~160cm</option>
							<option value="161~170cm">161~170cm</option>
							<option value="171~180cm">171~180cm</option>
							<option value="181cm이상">181cm이상</option>
					</select></th>
				</tr>

				<tr>
					<th id="title">학력</th>
					<th><select id="edu" name="edu_lv">
							<option value="">--------선택--------</option>
							<option value="중졸">중졸</option>
							<option value="고졸">고졸</option>
							<option value="대졸">대졸</option>
							<option value="석사이상">석사이상</option>
					</select></th>
					<th id="title">직업</th>
					<th><input type="text" id="job" name="job"
						style="width: 135px;" /></th>
				</tr>
				<tr>
					<th id="title">혈액형</th>
					<th><select id="blood" name="blood">
							<option value="">--------선택--------</option>
							<option value="A">A형</option>
							<option value="B">B형</option>
							<option value="AB">AB형</option>
							<option value="O">O형</option>
					</select></th>
					<th id="title">데이트선호장소</th>
					<th><select id="place" name="place">
							<option value="">--------선택--------</option>
							<option value="서울">서울</option>
							<option value="경기도">경기도</option>
							<option value="강원도">강원도</option>
							<option value="충청도">충청도</option>
							<option value="전라도">전라도</option>
							<option value="경상도">경상도</option>
							<option value="제주도">제주도</option>
					</select></th>
				</tr>
				<tr>
					<th id="title">선호스타일</th>
					<th><select id="style" name="style">
							<option value="">--------선택--------</option>
							<option value="귀여움">귀여움</option>
							<option value="남성스러움">남성스러움</option>
							<option value="여성스러움">여성스러움</option>
							<option value="마름">마름</option>
							<option value="통통">통통</option>
					</select></th>
					<th id="title">선호성격</th>
					<th><select id="personality" name="personality">
							<option value="">--------선택--------</option>
							<option value="외향적">외향적</option>
							<option value="내향적">내향적</option>
							<option value="감성적">감성적</option>
							<option value="직관적">직관적</option>
							<option value="자상함">자상함</option>
					</select></th>
				</tr>
				<tr>
					<th id="title">연봉</th>
					<th colspan="3"><input type="radio" id="income" name="income"
						value="3000이하" checked/> 3000 이하&nbsp;&nbsp;&nbsp; <input type="radio"
						name="income" value="5000이하" /> 5000 이하&nbsp;&nbsp;&nbsp; <input
						type="radio" name="income" value="7000이하" /> 7000
						이하&nbsp;&nbsp;&nbsp; <input type="radio" name="income"
						value="1억이상" /> 1억 이상</th>
				</tr>


			</table>
			<div id="agree">
				<input type="checkbox" name="ok" value="ok"> 하위 등급과 매칭이 진행될
				수 있습니다. 동의하시겠습니까?
			</div>
		</div>
		<div id="btn">
			<button type="button" id="btn1">결제페이지로 이동</button>
		</div>
	</form>
	<!-- 변경 사항 -->

	<!-- validate 플러그인 참조 -->
	<script
		src="${pageContext.request.contextPath}/assets/plugins/regex/regex.js"></script>
	<script>
		$(function() {

			$("#btn1")
					.click(
							function(e) {
								e.preventDefault();
								if ($("#profile_img").val() == "") {
									alert("프로필사진을 선택해주세요");
								} else if ($("#height").val() == "") {
									alert("키를 선택해주세요");
								} else if ($("#blood").val() == "") {
									alert("혈액형을 선택해주세요");
								} else if ($("#place").val() == "") {
									alert("데이트선호장소를 선택해주세요");
									return false;
								} else if ($("#style").val() == "") {
									alert("선호스타일을 선택해주세요");
									return false;
								} else if ($("#personality").val() == "") {
									alert("선호성격을 선택해주세요");
									return false;
								} else if ($("input[id=income]:checked").val() == "") {
									alert("연봉을 선택해주세요");
									return false;
								} else if ($("input:checkbox[name='ok']").is(
										":checked") == false) {
									alert("동의사항을 확인해주세요.");
									return false;
								} else {
									console.log("AJAX");
									var form = new FormData(document
											.getElementById('next'));

									console.log(form);

									$
											.ajax({
												url : "${pageContext.request.contextPath}/_payment/mustInputok.do",
												type : "POST",
												data : form,
												dataType : 'text',
												processData : false,
												contentType : false,
												success : function(data) {
													alert("필수입력 사항이 저장되었습니다.");
													console.log(data);
												},
												error : function() {
													alert("오류발생");

												}
											});
									location.href = "${pageContext.request.contextPath}/_payment/payment_GD.do";
								}
							
							});
		});
	</script>

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>