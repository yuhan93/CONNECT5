<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>연-결</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../assets/ico/favicon.ico" />
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/nanumfont.css" />

<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<!-- 시각적 확인을 위한 CSS 적용 -->
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

/* 모든 링크의 밑줄 제거
------------------------------------*/
a {
	text-decoration: none;
	color: #222;
}

a:hover {
	text-decoration: none;
}

/* 모든 목록정의 초기화. -여백은 6,7라인에서 제거했으므로 생략
------------------------------------*/
ul, ol {
	list-style: none;
}

table {
	margin-top: 30px;
}

#user_email_box {
	width: 80px;
	background-color: #f73478;
	color: white;
	text-align: center;
}

.user_name_box {
	width: 80px;
	background-color: #f73478;
	color: white;
	text-align: center;
}

.user_gender_select {
	width: 80px;
	background-color: #f73478;
	color: white;
	text-align: center;
}

#context_box {
	width: 80px;
	background-color: #f73478;
	color: white;
	text-align: center;
	height: 300px;
}

#content {
	width: 464px;
	height: 300px;
}

.container {
	text-align: center;
}

#label {
	background-color: #f73478;
	color: white;
	margin-top: 30px;
	width: 80px;
	height: 30px;
}
</style>
<script type="text/javascript">
	function cancel() {
		self.close();
	}
</script>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Hello JSP</title>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0"
	marginheight="0" onLoad="parent.resizeTo(650,720)">

	<div class="container">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true" onclick="cancel()">&times;</button>
			<h4 class="modal-title" id="myModalLabel">무료상담신청</h4>
		</div>
		<form method="post"
			action="${pageContext.request.contextPath}/_index/send.do">
			<div class="col-md-12">
				<table>
					<tr>
						<td class="col-md-3" id="user_email_box">이메일</td>
						<td class="col-md-3 "><input type="email" name="to" id="to"
							value="qotpdms2005@gmail.com" readonly /></td>


						<td class="col-md-3 user_gender_select">성별</td>
						<td class="col-md-3"><input type="radio" name="user_gender"
							value="1" /> <label type='submit'>남자</label> <input type="radio"
							name="user_gender" value="2" /> <label type='submit'>여자</label>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td class="user_name_box col-md-3">이름</td>
						<td class="col-md-3"><input type="text" name="subject"
							id="subject" /></td>
					</tr>
				</table>
				<table>
					<tr>
						<td class="col-md-3" id="context_box">내용</td>
						<td class="col-md-9"><textarea name="content" id="content">[신청사항]</textarea>
						</td>
					</tr>
				</table>
				<div class="col-md-3">
					<input type="submit" id="label" value="신청하기" /> <input
						onclick="cancel()" type="button" id="label" value="취소" />
				</div>
			</div>

		</form>
	</div>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>
</html>
