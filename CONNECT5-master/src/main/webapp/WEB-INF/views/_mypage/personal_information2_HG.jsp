<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Mypage/personal_information2.css">
<script
	src="${pageContext.request.contextPath}/assets/plugins/regex/regex.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
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
			src="${pageContext.request.contextPath}/assets/img/informationimg.PNG"
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
						class="list-group-item btncolor">개인정보수정</a> <a
						href="${pageContext.request.contextPath}/_mypage/withdrawal1_HG.do"
						class="list-group-item">회원탈퇴</a>
				</div>
			</div>
		</div>



		<h3 class="col-md-10">개인정보수정</h3>
		<form name="next" id="next" enctype="multipart/form-data">
			<div class="col-md-9 content">
				<input type="hidden" name="MemberId" value="${output.getMemberId()}" />
				<div class="box10">
					<br /> <br />
					<table>
						<tbody>
							<tr>
								<th class="box13">프로필사진</th>
								<td class="box14"><input type="file" name="User_Img"
									id="User_Img"></td>

								<th class="box15">이름</th>
								<td class="box16" name="UserName">${output.getUserName()}</td>
							</tr>
							<tr>
								<th class="box13">아이디</th>
								<td class="box14" name="UserId">${output.getUserId()}</td>


								<th class="box15">성별</th>
								<td class="box16" name="Gender"><c:choose>
										<c:when test="${output.getGender() == 0}">남자</c:when>
										<c:when test="${output.getGender() == 1}">여자</c:when>
										<c:otherwise>${output.getGender()}</c:otherwise>
									</c:choose></td>
							</tr>
							<tr>
								<th class="box13">변경할 비밀번호</th>
								<td class="box14"><input class="text4" type="password"
									name="UserPw" id="UserPw" /></td>

								<th class="box15">변경할 비밀번호 확인</th>
								<td class="box16"><input class="text4" type="password"
									name="UserPw1" id="UserPw1" /></td>
							</tr>

							<tr>
								<th class="box13">휴대폰번호</th>
								<td class="box14"><input name="Mobile"
									value="${output.getMobile()}"></td>


								<th class="box15">전화번호</th>
								<td class="box16"><input name="TEL"
									value="${output.getTEL()}"></td>
							</tr>
							<tr>
								<th class="box13">이메일</th>
								<td class="box14" colspan="3"><input class="text4"
									name="Email" value="${output.getEmail()}" type="text"
									style="width: 200px" /></td>
							</tr>

							<tr>
								<td class="box13" rowspan="3">주소</td>
								<td class="box14" colspan="3"><input type="text"
									name="PostCode" id="sample6_postcode"
									value="${output.getPostCode()}"> <input type="button"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br></td>
							</tr>
							<tr>
								<td class="box14" colspan="2"><input type="text"
									name="BasicAddress" id="sample6_address"
									value="${output.getBasicAddress()}" size="50"></td>
								<td class="box14"><input type="text" name="StateAddress"
									id="sample6_extraAddress" value="${output.getStateAddress()}"></td>
							</tr>
							<tr>
								<td class="box14" colspan="3"><input type="text"
									name="DetailAddress" id="sample6_detailAddress"
									value="${output.getDetailAddress()}" size="50"></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="buttom">
					<br>
					<button class="btn btn-default" type="button" id="btn1"
						style="height: 30px; width: 80px;">수정하기</button>
					&nbsp;&nbsp;&nbsp;
					<button class="btn btn-default" type="reset"
						style="height: 30px; width: 80px;">다시작성</button>

				</div>
			</div>
		</form>


	</div>

	<script>
		$(function() {

			$("#btn1")
					.click(
							function(e) {
								e.preventDefault();
								if ($("#User_Img").val() == "") {
									alert("프로필사진을 선택해주세요");
								} else if ($("#UserPw").val() == "") {
									alert("비밀번호를 입력해주세요.");
								} else if ($("#UserPw").val() != $("#UserPw1")
										.val()) {
									alert("비밀번호가 다릅니다. 다시 입력해주세요.");
									return false;
								} else {
									var form = new FormData(document
											.getElementById('next'));

									console.log(form);

									$
											.ajax({
												url : "${pageContext.request.contextPath}/_mypage/personal_information2ok_HG.do",
												type : "POST",
												data : form,
												dataType : 'text',
												processData : false,
												contentType : false,
												success : function(data) {
													
													console.log(data);
												},
												error : function() {
													alert("오류발생");

												}
											});
									alert("수정되었습니다.");
									location.href = "${pageContext.request.contextPath}/_mypage/personal_information1_HG.do";
								}

							});
		});
	</script>



	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>