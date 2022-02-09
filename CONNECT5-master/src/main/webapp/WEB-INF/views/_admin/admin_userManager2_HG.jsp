<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="../assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/nanumfont.css" />

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Admin/admin_userManager2.css">



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
			<a href="${pageContext.request.contextPath}/_admin/admin_main_SE.do"
				class="list-group-item">대시보드</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_userManager1_HG.do"
				class="list-group-item active">회원관리</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_userManagement_YH.do"
				class="list-group-item">게시판 관리</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_userApply_YH.do"
				class="list-group-item">신청현황</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_Question_SE.do"
				class="list-group-item">문의현황</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_Payment_GD.do"
				class="list-group-item">결제관리</a>

		</div>

		<div class="col-md-10 middle">
			<h2>회원관리</h2>
			<br />
			<p class="text20">회원정보</p>
		</div>

		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br /> <br /> <br />
		<div class="box10">

			<table>
				<tbody>
					<tr>
						<td class="box13" rowspan="4">프로필사진</td>
						<td class="box14" rowspan="4">
						<img src="${pageContext.request.contextPath}/assets/upload/${output.getUser_Img()}">
						</td>

						<td class="box15">성별</td>
						<td class="box16"><c:choose>
								<c:when test="${output.gender == 0}">남자</c:when>
								<c:when test="${output.gender == 1}">여자</c:when>
								<c:otherwise>${output.gender}</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<td class="box13">이름</td>
						<td class="box14">${output.userName}</td>
					</tr>
					<tr>
						<td class="box13">생년월일</td>
						<td class="box14">${output.birthDate}</td>
					</tr>
					<tr>
						<td class="box13">가입일</td>
						<td class="box14">${output.join_Date}</td>
					</tr>

					<tr>
						<td class="box13">아이디</td>
						<td class="box14">${output.userId}</td>

						<td class="box15">등급</td>
						<td class="box16">${output.member_Lv}</td>
					</tr>

					<tr>
						<td class="box13">데이트 횟수</td>
						<td class="box14">${output.date_Count}</td>

						<td class="box15">잔여 횟수</td>
						<td class="box16">${output.date_Rest}</td>
					</tr>

					<tr>
						<td class="box13">E-mail</td>
						<td class="box14">${output.email}</td>

						<td class="box15">휴대폰번호</td>
						<td class="box16">${output.mobile}</td>
					</tr>

					<tr>
						<td class="box13">주소</td>
						<td class="box14" colspan="3">${output.basicAddress}</td>

					</tr>

					<tr>
						<td class="box13">직업</td>
						<td class="box14">${output.job}</td>

						<td class="box15">결혼여부</td>
						<td class="box16"><c:choose>
								<c:when test="${output.isMarried == 0}">초혼</c:when>
								<c:when test="${output.isMarried == 1}">재혼</c:when>
								<c:otherwise>${output.isMarried}</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<td class="box13">학력</td>
						<td class="box14">${output.edu_Lv}</td>

						<td class="box15">데이트 선호 지역</td>
						<td class="box16">${output.date_Loc}</td>
					</tr>
				</tbody>
			</table>


		</div>

		<div class="buttom">
			<br>
			<form method="post" style="display: inline-block;"
				action="${pageContext.request.contextPath}/_admin/admin_userManager2ok2_HG.do">
				<input type="hidden" name="MemberId" value="${output.getMemberId()}" />
				<input type="password" name="UserPw" style="height: 28px;"
					placeholder="&nbsp; &nbsp; &nbsp;&nbsp;비밀번호 입력란" />
				<button class="btn btn-default" value="${output.getUserPw()}"
					type="submit" style="height: 30px; width: 120px;">비밀번호 수정</button>

			</form>
			&nbsp;&nbsp;&nbsp; <br /> <br />
			<form method="post" style="display: inline-block;"
				action="${pageContext.request.contextPath}/_admin/admin_userManager2ok1_HG.do">
				<input type="hidden" name="MemberId" value="${output.getMemberId()}" />
				<button class="btn btn-default" type="submit"
					style="height: 30px; width: 80px;">탈퇴</button>
			</form>
			&nbsp;&nbsp;&nbsp;
			<button class="btn btn-default"
				onclick="location.href ='${pageContext.request.contextPath}/_admin/admin_userManager1_HG.do'"
				style="height: 30px; width: 80px;">목록</button>
		</div>
	</div>

	<!-- Javascript -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>

</body>
</html>