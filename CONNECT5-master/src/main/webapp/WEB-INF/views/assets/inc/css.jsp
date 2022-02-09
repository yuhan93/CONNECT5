<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<title>연-결</title>
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/./img/footerMain.PNG" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/./img/footerMain.PNG" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/./assets/css/bootstrap.min.css" />

<!-- 반응형 웹을 지원하지 않을 경우 -->
<!-- <link rel="stylesheet" href="assets/css/non-responsive.css" /> -->

<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
      <script type="text/javascript" src="assets/js/html5shiv.js"></script>
      <script type="text/javascript" src="assets/js/respond.min.js"></script>
   <![endif]-->

<!-- IE10 반응형 웹 버그 보완 -->
<!--[if gt IE 9]>
      <link rel="stylesheet" type="text/css" href="assets/css/ie10.css" />
      <script type="text/javascript" src="assets/js/ie10.js"></script>
   <![endif]-->

<!-- 시각적 확인을 위한 CSS 적용 -->
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald&display=swap"
	rel="stylesheet">


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

/* 로고 css 가운데 정렬 */
.logo {
	text-align: center;
}

/* 로고 이미지 크기 */
.logo>a>img {
	width: 250px;
	height: 150px;
}
/* 로그인 / 회원가입 */
#user {
	text-align: center;
	padding-top: 145px;
	font-family: 'Oswald', sans-serif;
}

/* 로그인 / 회원가입 가로 정렬 */
#user>li {
	display: inline;
	margin-left: 10px;
}

.logoutbutton {
	background-color: #F73478;
	width: 50px;
	height: 20px;
	color: white;
}

/* 상단 이미지 */
.boximg {
	float: left;
	width: 1140px;
	height: 240px;
}
/* 사이드바 */
.sidebar>#sidebar_menu>li {
	margin-top: 40px;
}

/* 사이드바 크기 */
.sidebar {
	float: right;
}

/* 사이드바 고정 */
#sidebar_menu {
	position: absolute;
	background-color: currentColor;
	height: 770px;
	margin-top: 150px;
}

/* footer_information 영역 */
.footer_information {
	color: white;
	padding-bottom: 30px;
	background-color: #F73478;
}

.footer_information_image {
	float: left;
	padding-right: 20px;
	padding-top: 20px;
}

.footer>ul>li {
	display: inline;
	text-align: center;
	margin-left: 50px;
}

/* footer 영역*/
.footer>ul {
	margin-top: 50px;
	padding-bottom: 10px;
	padding-left: 30px;
}

/* footer 세로 선 */
.vi {
	border-left: 1px solid red;
	height: 10px;
	display: inline;
	margin-left: 50px;
}

.vii {
	border-left: 1px solid;
	margin-left: 10px;
	margin-right: 10px;
}

.img-responsive {
	height: 230px;
	width: 1140px;
}

.btncolor {
	background-color: #F73478;
}

a.btncolor {
	color: white;
}

a.btncolor:hover {
	background-color: pink;
}

a.list-group-item:hover {
	background-color: pink;
}

/* 카테고리  */
#top_menu {
	position: relative;
	margin: 0 auto;
	display: inline-block;
	*display: inline;
	text-align: center;
	background-color: #F73478;
}

#top_menu_m ul {
	position: relative;
	padding: 0;
	margin: 0 auto;
	display: inline-block;
	*display: inline;
}

#top_menu_m ul li {
	float: left;
	width: 228px;
	height: 50px;
	padding-top: 15px;
	text-align: center;
	font-family: 'Do Hyeon', sans-serif;
}

#top_menu_m ul li a {
	text-decoration: none;
	color: #fff;
	padding: 0px;
}

#top_menu_m ul li a.onon {
	color: white;
	height: 50px;
}

#top_menu_m ul li a:hover {
	color: white;
}

#top_menu_m2 {
	position: absolute;
	overflow: hidden;
	z-index: 99;
	height: 0;
	text-align: center;
}

.wp_snbonly {
	position: relative;
	margin: 0 auto;
	height: 350px;
	display: inline-block;
	*display: inline;
	background-color: #FAF4F8;
}

.wp_snbonly ul {
	width: 228px;
	float: left;
	display: inline-block;
	*display: inline;
	padding: 0;
	margin: 0;
}

.wp_snbonly ul li {
	width: 100%;
	clear: both;
	text-align: center;
	float: left;
	height: 50px;
	font-family: 'Do Hyeon', sans-serif;
}

.wp_snbonly ul li:hover {
	background-color: pink;
}

.wp_snbonly ul li a {
	display: block;
	text-decoration: none;
	padding-top: 15px;
	color: #F73478;
}

.wp_snbonly ul li a:hover {
	color: white;
}

.wp_snbonly ul li a.onon {
	color: #1b2530;
}

.lnb_num5 a:hover {
	width: 228px;
	height: 100px;
}

.lnb_num1 {
	width: 100px;
	height: 55px;
}

#top_menu_m {
	height: 56px;
}
</style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>


<script type="text/javascript">
	$(function() {

		$(window).scroll(function() { //브라우저에 스크롤이 발생하는 순간부터
			var curpos = $(window).scrollTop(); //스크롤바의 상단 위치값 보관
			$("#sidebar_menu").stop().animate({
				"top" : curpos
			}); //스카이메뉴의 상단위치값 애니
		});

	});
</script>


</head>
</html>