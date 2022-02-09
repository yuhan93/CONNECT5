<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="utf-8" />
<title>Hello JSP</title>
</head>
<body>
	<div class="col-md-12 footer">
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/./_info/IntroWebsite_YB.do">회사소개</a>
				<div class="vi"></div></li>
			<li><a
				href="${pageContext.request.contextPath}/./_service/MembershipRegisGuide_YB.do">가입안내</a>
				<div class="vi"></div></li>
			<li><a
				href="${pageContext.request.contextPath}/./_service/ServiceProcedures_YB.do">서비스이용절차</a>
				<div class="vi"></div></li>
			<li><a
				href="${pageContext.request.contextPath}/./_info/map_GD.do">오시는길</a>
				<div class="vi"></div></li>
			<li><a
				href="${pageContext.request.contextPath}/./_info/partner_HG.do">연-결
					제휴 파트너</a>
				<div class="vi"></div></li>
			<li><a
				href="${pageContext.request.contextPath}/./_service/MemberStatus_YB.do">회원현황</a></li>
		</ul>
	</div>
	<div class="col-md-12 footer_information">
		<div class="col-md-offset-2 footer_information_image">
			<img
				src="${pageContext.request.contextPath}/./assets/img/footerMain.PNG"
				width="150" height="150">
		</div>
		<br>서울특별시 서초구 서초대로77길 54 서초더블유타워 13층 <br>무료상담전화: 1588-1588 <span
			class="vii"></span> FAX : 02-1234-1234 <span class="vii"></span>
		Email : ezen@ezen.co.kr <br> <br> 상호명: (주)연-결 연애정보 <span
			class="vii"></span> 대표 : 박경동 <br> 연-결 매니저 : 정유빈 <span
			class="vii"></span> 배세은 <span class="vii"></span> 최유한 <span
			class="vii"></span> 남희권 <br> <br>
		COPYRIGHT&copy;CONNECT_5.co.kr
	</div>


	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<!-- 카테고리 스크립트 -->
	<script type="text/javascript">
		$(document).ready(
				function() {
					$('#top_menu_m').mouseover(function() {
						$('#top_menu_m2').stop().animate({
							height : "350px"
						}, 300);
					});

					$('#top_menu_m2').mouseover(function() {
						$('#top_menu_m2').stop().animate({
							height : "350px"
						}, 300);
					});

					$('#top_menu_m').mouseout(function() {
						$('#top_menu_m2').stop().animate({
							height : "0px"
						}, 200);
					});

					$('#top_menu_m2').mouseout(function() {
						$('#top_menu_m2').stop().animate({
							height : "0px"
						}, 200);
					});

					function hide_menu() {
						$("#top_menu_m > ul > li").find("a")
								.removeClass("onon");
					}

					function show_menu() {
						$("#top_menu_m > ul > li").find("a")
								.removeClass("onon");
						$(this).find("a").addClass("onon");

					}

					function hide_menu2() {
						$("#top_menu_m > ul > li").find("a")
								.removeClass("onon");
					}

					function show_menu2() {
						var idx = $(".wp_snbonly > ul").index(this);
						$(".wp_snbonly > ul").find("a").removeClass("onon");

						$("#top_menu_m > ul > li").find("a")
								.removeClass("onon");
						$("#top_menu_m > ul > li").eq(idx).find("a").addClass(
								"onon");
					}

					$("#top_menu_m > ul > li").mouseover(show_menu).mouseout(
							hide_menu);
					$(".wp_snbonly > ul").mouseover(show_menu2).mouseout(
							hide_menu2);

					hide_menu();
					hide_menu2();
				});
	</script>

</body>
</html>