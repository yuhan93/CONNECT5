<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Join/join2.css">
<script
	src='${pageContext.request.contextPath}/assets/js/ajax_helper.js'></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
	src='${pageContext.request.contextPath}/assets/js/regex.js'></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
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
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("StateAddress").value = extraAddr;

				} else {
					document.getElementById("StateAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('PostCode').value = data.zonecode;
				document.getElementById("BasicAddress").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("DetailAddress").focus();
			}
		}).open();
	}
	function cancel() {
		if (confirm("정말 취소하시겠습니까?") == true) {
			alert("취소되었습니다.");
		} else {
			return;
		}
		location.href = "${pageContext.request.contextPath}";
	}

	$(function() {
		$("#join_form").submit(function(e) {
			var idcheck = $("#idcheck").val();
			
			if (idcheck == 0) {
				alert("아이디 중복검사를 눌러주세요.");
				return false;
			}
			
			if(!regex.value('#UserId', '아이디를 입력해주세요.')) {return false;}
			if (!regex.eng_num('#UserId', '아이디는 영어와 숫자로만 입력 가능합니다.')) {return false;}
			if (!regex.min_length('#UserId', 4, '아이디는 최소 4자 이상 입력 가능합니다.')) {return false;}
			if (!regex.max_length('#UserId', 20, '아이디는 최대 20자 까지만 입력 가능합니다.')) {return false;}
			
			if (!regex.value('#UserPw', '비밀번호를 입력해주세요.')) { return false; }
            if (!regex.min_length('#UserPw', 4, '비밀번호는 최소 4자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#UserPw', 20, '비밀번호는 최대 20자 까지만 입력 가능합니다.')) { return false; }
            if (!regex.compare_to('#UserPw', '#UserPw1', '비밀번호 확인이 잘못되었습니다.')) { return false; }
            
            if (!regex.value('#UserName', '이름을 입력해주세요.')) { return false; }
            if (!regex.kor('#UserName', '이름은 한글만 입력 가능합니다.')) { return false; }
            if (!regex.min_length('#UserName', 2, '이름은 최소 2자 이상 입력 가능합니다.')) { return false; }
            if (!regex.max_length('#UserName', 10, '이름은 최대 10자 까지만 입력 가능합니다.')) { return false; }
            
            if (!regex.value('#BirthDate', '생년월일을 입력해주세요.')) { return false; }
            if (!regex.min_length('#BirthDate', 6, '생년월일 6자리로 입력해주세요.')) { return false; }
            if (!regex.max_length('#BirthDate', 6, '생년월일 6자리로 입력해주세요.')) { return false; }
            
            if (!regex.check('input[name=Gender]', '성별을 선택해주세요.')) {return false;}
            
            if (!regex.check('input[name=IsMarried]', '결혼여부를 선택해주세요.')) {return false;}
            
            if (!regex.value('#Mobile', '연락처를 입력해주세요.')) { return false; }
            if (!regex.cellphone('#Mobile', '연락처가 잘못되었습니다.')) { return false; }
            
            if (!regex.value('#Email', '이메일을 입력해주세요.')) { return false; }
            if (!regex.email('#Email', '이메일 주소가 잘못되었습니다.')) { return false; }
            
            if (!regex.value('#PostCode', '우편번호를 선택해주세요.')) { return false; }
            
            if (!regex.value('#BasicAddress', '기본주소를 입력해주세요.')) { return false; }
            
            if (!regex.value('#DetailAddress', '상세주소를 입력해주세요.')) { return false; }
            

		})
	})
	
	$(function() {
		$("#idcheck").click(function() {
			var UserId_val = $("#UserId").val();
			console.log(UserId_val);
			if (!UserId_val) {
				alert("아이디를 입력하세요!!!");
				$("#UserId").focus();
				return false;
			}
			$.post("idcheck.do", {
				UserId : UserId_val
			}, function(req) {

				console.log(UserId_val);
				console.log(req);

				if (req == 'OK') {
					alert("사용 가능한 아이디 입니다.");
					$("#idcheck").attr("value", 1);

				} else {
					alert("사용할 수 없는 아이디 입니다.");
					$("#idcheck").attr("value", 0);
					$("#UserId").val("");
					$("#UserId").focus();
				}
			});
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
		<img src="${pageContext.request.contextPath}/assets/img/joinimg1.PNG"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">회원가입</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
				<a href="${pageContext.request.contextPath}/_join/join1_HG.do"
					class="list-group-item btncolor">회원가입</a> <a
					href="${pageContext.request.contextPath}/_login/login_HG.do"
					class="list-group-item">로그인</a> <a
					href="${pageContext.request.contextPath}/_findAccount/FindId_GD.do"
					class="list-group-item">ID/PW 찾기</a>
			</div>
		</div>
	</div>



	<h2 class="col-md-10">
		<strong>회원가입</strong>
	</h2>
	<h4 class="col-md-10">기본 가입정보 입력</h4>
	<div class="col-md-9 content">

		<form method="post" id="join_form" name="join_form"
			action="${pageContext.request.contextPath}/_join/join2_HGok.do">
			<div class="box10">
				<table>
					<tbody>

						<tr>
							<td class="box11">아이디</td>
							<td class="box12" colspan="3"><input class="text4"
								type="text" name="UserId" id="UserId" />&nbsp;&nbsp;&nbsp;
								<button class="btn btn-default" type="button" id="idcheck"
									name="idcheck" style="height: 30px; width: 80px;" vlaue="0">중복확인</button></td>
						</tr>

						<tr>
							<td class="box11">비밀번호</td>
							<td class="box12" colspan="3"><input class="text4"
								type="password" name="UserPw" id="UserPw" min="5" max="13" /></td>
						</tr>

						<tr>
							<td class="box11">비밀번호 확인</td>
							<td class="box12" colspan="3"><input class="text4"
								type="password" name="UserPw" id="UserPw1" min="5" max="13" /></td>
						</tr>

						<tr>
							<td class="box11">이름</td>
							<td class="box12"><input class="text4" type="text"
								name="UserName" id="UserName"></td>

							<td class="box13">생년월일</td>
							<td class="box14"><input class="text4" type="text"
								name="BirthDate" placeholder="주민번호 앞 6자리" id="BirthDate"></td>
						</tr>

						<tr>
							<td class="box11">성별</td>
							<td class="box12"><input class="text4" type="radio"
								name="Gender" id="Gender" value="0" checked /> 남자 &nbsp;&nbsp;<input
								type="radio" name="Gender" value="1" /> 여자</td>

							<td class="box13">결혼여부</td>
							<td class="box14"><input class="text4" type="radio"
								name="IsMarried" id="IsMarried" value="0" checked />
								초혼&nbsp;&nbsp; <input type="radio" name="IsMarried" value="1" />
								재혼</td>
						</tr>

						<tr>
							<td class="box11">휴대폰번호</td>
							<td class="box12"><input class="text4" type="text"
								name="Mobile" id="Mobile" placeholder="&nbsp; - 제외 입력"/></td>

							<td class="box13">전화번호</td>
							<td class="box14"><input class="text4" type="text"
								name="TEL" id="TEL" /></td>
						</tr>

						<tr>
							<td class="box11">이메일</td>
							<td class="box12" colspan="3"><input class="text4"
								type="text" name="Email" id="Email" style="width: 200px" /></td>
						</tr>

						<tr>
							<td class="box11" rowspan="3">주소</td>
							<td class="box12" colspan="3"><input type="text"
								name="PostCode" id="PostCode" placeholder="우편번호"> <input
								type="button" onclick="sample6_execDaumPostcode()"
								value="우편번호 찾기"><br></td>
						</tr>
						<tr>
							<td class="box12" colspan="2"><input type="text"
								name="BasicAddress" id="BasicAddress" placeholder="주소" size="50"></td>
							<td class="box12"><input type="text" name="StateAddress"
								id="StateAddress" placeholder="동/읍/리"></td>
						</tr>
						<tr>
							<td class="box12"><input type="text" name="DetailAddress"
								id="DetailAddress" placeholder="상세주소" size="50"></td>


						</tr>

						<tr>
							<td class="box11">가입경로</td>
							<td class="box12" colspan="3" style="text-align: center;"><input
								class="text4" type="checkbox" name="box" value="route" />지인소개
								&nbsp; &nbsp; &nbsp;<input type="checkbox" name="box"
								value="route1" />광고 &nbsp; &nbsp; &nbsp;<input type="checkbox"
								name="box" value="route2" />매니저권유 &nbsp; &nbsp; &nbsp;<input
								type="checkbox" name="box" value="route3" />인터넷검색</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="buttom">
				<br>
				<button class="btn btn-default" onclick="cancel()" type="reset"
					style="height: 30px; width: 80px;">취소</button>
				&nbsp;&nbsp;&nbsp;
				<button class="btn btn-default" type="reset"
					style="height: 30px; width: 80px;">초기화</button>
				&nbsp;&nbsp;&nbsp;
				<button class="btn btn-default" id="btn1" type="submit"
					style="height: 30px; width: 80px;">완료</button>
			</div>

		</form>
	</div>



	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />

</body>

</html>