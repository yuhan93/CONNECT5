<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>연-결</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/footerMain.PNG" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/img/footerMain.PNG" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS 링크 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/./assets/css/Index1.css">

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nanumfont.css" />

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

<!-- 구글 폰트 링크 -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet">

<!-- 플러그인 CSS 링크 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/aos/aos.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/animate/animate.css" />


<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<div class="container">
		<!-- col-md-12 영역 -->

		<div class="row">
			<div class="col-md-4"></div>

			<!-- 4 / 4 / 4 로 나눔 -->
			<div class="col-md-4">

				<!-- 메인 로고 -->
				<h1 class="logo">
					<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/assets/img/Mainlogo11.PNG" alt="연-결"></a>
				</h1>
				<!-- 메인로고 끝 -->
			</div>

			<!-- 로그인 -->
			<div class="col-md-4">
				<ul id="user">
					<c:choose>
						<c:when test="${loginInfo == null }">
							<li><a href="${pageContext.request.contextPath}/_login/login_HG.do">LOGIN</a></li>
							<li><a href="${pageContext.request.contextPath}/_join/join1_HG.do">SIGN UP</a></li>
						</c:when>
						<c:when test="${loginInfo != null }">
							<li style="font-family: 'Do Hyeon', sans-serif">
								안녕하세요.${login}님 <a href="${pageContext.request.contextPath}/_login/loginOut.do"><button class="logoutbutton">로그아웃</button> </a>
							</li>
						</c:when>
					</c:choose>
				</ul>
			</div>
			<!-- 로그인 끝 -->
		</div>
		<!-- 상단 영역 끝 -->


		<!-- 카테고리 -->
		<div id="top_menu">
			<div id="top_menu_m">
				<ul>
					<li class="lnb_num1"><a href="#">연-결 소개</a></li>
					<li class="lnb_num1"><a href="#">서비스 안내</a></li>
					<li class="lnb_num1"><a href="#">연-결 코치</a></li>
					<li class="lnb_num1"><a href="#">연-결 테스트</a></li>
					<li class="lnb_num1"><a href="#">My 연-결</a></li>
				</ul>
			</div>
		</div>

		<div id="top_menu_m2">
			<div class="wp_snbonly">
				<ul class="lnb2_ul">
					<li><a href="${pageContext.request.contextPath}/_info/IntroWebsite_YB.do">사이트 소개</a></li>
					<li><a href="${pageContext.request.contextPath}/_info/Greetings_YB.do">연-결 인사말</a></li>
					<li><a href="${pageContext.request.contextPath}/_info/manager_HG.do">커플 매니저</a></li>
					<li><a href="${pageContext.request.contextPath}/_info/story_SE.do">연결 성혼 Story</a></li>
					<li><a href="${pageContext.request.contextPath}/_info/notice_SE.do">공지사항</a></li>
					<li><a href="${pageContext.request.contextPath}/_info/partner_HG.do">연-결 파트너</a></li>
					<li><a href="${pageContext.request.contextPath}/_info/map_GD.do">오시는 길</a></li>
				</ul>

				<ul class="lnb2_ul">
					<li><a href="${pageContext.request.contextPath}/_service/ServiceProcedures_YB.do">서비스 이용절차</a></li>
					<li><a href="${pageContext.request.contextPath}/_service/MembershipRegisGuide_YB.do">회원가입 안내</a></li>
					<li><a href="${pageContext.request.contextPath}/_service/MemberLevel_YH.do">회원등급 안내</a></li>
					<li><a href="${pageContext.request.contextPath}/_service/SpecialService_YH.do">스페셜 서비스</a></li>
					<li><a href="${pageContext.request.contextPath}/_service/MemberStatus_YB.do">회원현황</a></li>
				</ul>

				<ul class="lnb2_ul">
					<li><a href="${pageContext.request.contextPath}/_coach/meetingTip_GD.do">미팅성공전략 TIP</a></li>
					<li><a href="${pageContext.request.contextPath}/_coach/loveColumn_GD.do">LOVE 컬럼</a></li>
					<li><a href="${pageContext.request.contextPath}/_coach/DatingCourse_YB.do">데이트 코스</a></li>
					<li><a href="${pageContext.request.contextPath}/_coach/review_SE.do">연-결 만남 후기</a></li>
					<li><a href="${pageContext.request.contextPath}/_coach/QnA_SE.do">연결 Q &amp; A</a></li>
				</ul>
				<ul class="lnb2_ul">
					<li><a href="${pageContext.request.contextPath}/_test/propensity1_HG.do">연애성향 테스트</a></li>
					<li><a href="${pageContext.request.contextPath}/_test/idealtype_HG.do">이상형 찾기</a></li>
					<li><a href="${pageContext.request.contextPath}/_test/lovescore1_HG.do">나의 연애 매력</a></li>
				</ul>
				<ul class="lnb2_ul">
					<li><a href="${pageContext.request.contextPath}/_mypage/myInfo_GD.do">My 현황</a></li>
					<li><a href="${pageContext.request.contextPath}/_mypage/search_SE.do">인연 찾기</a></li>
					<li><a href="${pageContext.request.contextPath}/_mypage/1_1questionEmpty_YH.do">1:1문의</a></li>
					<li><a href="${pageContext.request.contextPath}/_mypage/Ex-MatchingRecord_YB.do">매칭 기록 보기</a></li>
					<li><a href="${pageContext.request.contextPath}/_mypage/personal_information1_HG.do">개인정보 수정</a></li>
					<li><a href="${pageContext.request.contextPath}/_mypage/withdrawal1_HG.do">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
		<!-- 카테고리 끝 -->

		<!-- 사이드바 메뉴 -->
		<div class="sidebar">
			<ul id="sidebar_menu">
				<li><a href="${pageContext.request.contextPath}/_payment/mustInput_SE.do"><img src="${pageContext.request.contextPath}/assets/img/결제하기1.png" width="95px" height=""></a></li>
				<li><a href="${pageContext.request.contextPath}/_coach/QnA_SE.do"><img src="${pageContext.request.contextPath}/assets/img/문의하기1.png" width="95px" height=""></a></li>
				<li><a href="${pageContext.request.contextPath}/_mypage/1_1questionEmpty_YH.do"><img src="${pageContext.request.contextPath}/assets/img/1_1문의1.png" width="95px" height=""></a></li>
				<li><a href="${pageContext.request.contextPath}/_info/map_GD.do"><img src="${pageContext.request.contextPath}/assets/img/오시는길1.png"  width="95px" height=""></a></li>
				<li><a href="#"><img src="${pageContext.request.contextPath}/assets/img/전화번호.png" width="95px" height=""></a></li>
			</ul>
		</div>
		<!-- 사이드바 메뉴 끝 -->
		<!-- 캐러셀 내용 영역 -->
		<div class="caousel_evnet">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- 현재 위치 표시 -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<!-- 캐러셀 내용 영역 -->
				<div class="carousel-inner">
					<!-- 항목 (1) -->
					<div class="item active">
						<img src="${pageContext.request.contextPath}/assets/img/mainImage.jpg" alt="슬라이더(1)">
						<div class="carousel-caption" data-aos="fade-up" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="600">
							<h1>특별한 만남</h1>
							<p>연-결 과 함께 하세요.</p>
							<a href="${pageContext.request.contextPath}/_service/MemberStatus_YB.do"><img src="${pageContext.request.contextPath}/assets/img/image경로.png" style="width: 90px; height: 60px;"></a>
						</div>
					</div>

					<!-- 항목 (2) -->
					<div class="item">
						<img src="${pageContext.request.contextPath}/assets/img/54456.JPG" alt="슬라이더(2)">
						<div class="carousel-caption">
							<a href="${pageContext.request.contextPath}/_info/story_SE.do"><img src="${pageContext.request.contextPath}/assets/img/image경로.png" style="width: 90px; height: 60px;"></a>
						</div>
					</div>

					<!-- 항목 (3) -->
					<div class="item">
						<img src="${pageContext.request.contextPath}/assets/img/111.JPG" alt="슬라이더(3)">
						<div class="carousel-caption">
							<h1>당신을 위한 품격있는 만남 연-결</h1>

							<a href="${pageContext.request.contextPath}/_coach/review_SE.do"><img src="${pageContext.request.contextPath}/assets/img/image경로.png" style="width: 90px; height: 60px;"></a>
						</div>
					</div>
				</div>
				<!-- // 내용영역 구성 -->

				<!-- 이동 버튼 -->
				<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> 
					<span class="glyphicon glyphicon-chevron-left"></span> 
				</a> 
				<a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> 
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
		<!-- 메인 이미지 캐러셀 끝 -->
		<!-- information -->
		<div class="col-md-12 ">
			<h1 id="line_text">INFORMATION</h1>
		</div>
		<!-- information 끝 -->
		<hr class="line">
		<!-- 소개 / 가입안내 / 공지사항 /스페셜서비스 박스 -->
		<div class="row">
			<div class="col-md-3 text-center" id="information_box1">
				<ul>
					<li><a href="${pageContext.request.contextPath}/_info/IntroWebsite_YB.do"><img src="${pageContext.request.contextPath}/assets/img/Introduce2.jpg" width="265px" height="265px"></a></li>
				</ul>
			</div>
			<div class="col-md-3 text-center" id="information_box2">
				<ul>
					<li><a href="${pageContext.request.contextPath}/_service/MembershipRegisGuide_YB.do"><img src="${pageContext.request.contextPath}/assets/img/join2.jpg" width="265px" height="265px"></a></li>
				</ul>
			</div>
			<div class="col-md-3 text-center" id="information_box3">
				<ul>
					<li><a href="${pageContext.request.contextPath}/_service/SpecialService_YH.do"><img src="${pageContext.request.contextPath}/assets/img/specialservice.jpg" width="265px" height="265"></a></li>
				</ul>
			</div>
			<div class="col-md-3 text-center" id="information_box4">
				<ul>
					<li><a href="${pageContext.request.contextPath}/_service/ServiceProcedures_YB.do"><img src="${pageContext.request.contextPath}/assets/img/연결서비스안내1.jpg" width="265" height="265px"></a></li>
				</ul>
			</div>
		</div>

		<!-- 소개 / 가입안내 / 이상형 찾기 / 스페셜서비스 박스 끝 -->
		<!-- event 글씨 -->
		<div class="col-md-12">
			<h1 id="line_text">EVENT</h1>
		</div>
		<!-- event 글씨끝 -->
		<hr class="line">
		<!-- 공지사항 / 이벤트 / 고객센터 박스 -->
		<div class="row">
			<div class="abc" data-aos="fade-up" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="600">
				<div class="col-md-4 text-center event2_box_1">
					<ul>
						<li><a href="${pageContext.request.contextPath}/_info/noticeRead1_SE.do"><img src="${pageContext.request.contextPath}/assets/img/이벤트3.jpg" width="300px" height="300px"></a></li>
					</ul>
				</div>
			</div>
			<div class="abc" data-aos="fade-up" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="800">
				<div class="col-md-4 text-center event2_box_1">
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/_info/notice_SE.do"><img src="${pageContext.request.contextPath}/assets/img/이벤트4.jpg" width="300px" height="300px"></a>
						</li>
					</ul>
				</div>
			</div>
			<div class="abc" data-aos="fade-up" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="1000">
				<div class="col-md-4 text-center event2_box_1">
					<ul>
						<li><a href="${pageContext.request.contextPath}/_test/idealtype_HG.do"><img src="${pageContext.request.contextPath}/assets/img/이상형찾기1.jpg" width="300px" height="300px"></a></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- 이상형 찾기 / 이벤트 / 고객센터 박스 끝 -->

		<div class="col-md-12">
			<h1 id="line_text">MANAGER</h1>
		</div>
		<hr class="line">

		<div class="managet_introduce">
			<div class="abc" data-aos="fade-up" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="1400">
				<div class="col-md-2 manager_box">
					<ul>
						<li><img src="${pageContext.request.contextPath}/assets/img/gd.gif" width="200px" height="200px">
							<p class="manager_box_font">
								연-결 매니저 : 박경동<br> 010-1234-5678
							</p> 
							<a href="${pageContext.request.contextPath}/_index/counsel_YH.do" onClick="window.open(this.href, '_blank', 'width=600, height=720,scrollbars=yes'); return false;" style="color: white;">
								<button type="button" class="label">상담신청하기</button>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="abc" data-aos="fade-up" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="1200">
				<div class="col-md-2 manager_box">
					<ul>
						<li><img src="${pageContext.request.contextPath}/assets/img/hg.gif" width="200px" height="200px">
							<p class="manager_box_font">
								연-결 매니저 : 남희권<br> 010-4220-4220
							</p> 
							<a href="${pageContext.request.contextPath}/_index/counsel_YH.do" onClick="window.open(this.href, '_blank', 'width=600, height=720,scrollbars=yes'); return false;" style="color: white;">
								<button type="button" class="label">상담신청하기</button>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="abc" data-aos="fade-up" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="1000">
				<div class="col-md-2 manager_box">
					<ul>
						<li><img src="${pageContext.request.contextPath}/assets/img/se.gif" width="200px" height="200px">
							<p class="manager_box_font">
								연-결 매니저 : 배세은<br> 010-3210-3210
							</p> 
							<a href="${pageContext.request.contextPath}/_index/counsel_YH.do" onClick="window.open(this.href, '_blank', 'width=600, height=720,scrollbars=yes'); return false;" style="color: white;">
								<button type="button" class="label"> 상담신청하기</button>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="abc" data-aos="fade-up" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="800">
				<div class="col-md-2 manager_box">
					<ul>
						<li><img src="${pageContext.request.contextPath}/assets/img/yb.gif" width="200px" height="200px">
							<p class="manager_box_font">
								연-결 매니저 : 정유빈<br> 010-5678-5678
							</p> 
							<a href="${pageContext.request.contextPath}/_index/counsel_YH.do" onClick="window.open(this.href, '_blank', 'width=600, height=720,scrollbars=yes'); return false;" style="color: white;">
								<button type="button" class="label"> 상담신청하기</button>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="abc" data-aos="fade-up" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="600">
				<div class="col-md-2 manager_box">
					<ul>
						<li><img src="${pageContext.request.contextPath}/assets/img/yh.gif" width="200px" height="200px">
							<p class="manager_box_font">
								연-결 매니저 : 최유한<br> 010-1234-7890
							</p> 
							<a href="${pageContext.request.contextPath}/_index/counsel_YH.do" onClick="window.open(this.href, '_blank', 'width=600, height=720,scrollbars=yes'); return false;" style="color: white;">
								<button type="button" class="label"> 상담신청하기</button>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<h1 id="line_text">HOT &amp; ISSUE</h1>
		</div>
		<hr class="line">
		<div class="col-md-12">
			<div class="col-md-6 hot_issue_image" data-aos="fade-right" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="600">
				<img src="${pageContext.request.contextPath}/assets/img/hot_issue.jpg" width="500px" height="300px" style="float: left;">
			</div>
			<div class="table-responsive" data-aos="fade-left" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="600">
				<h3 class="col-md-4 ">연-결 NEWS</h3>
				<a href="${pageContext.request.contextPath}/_info/notice_SE.do">
					<button style="float: right; width: 65px; margin-right: 15px; margin-top: 30px;" type="submit" class="btn btn-default btn-xs col-md-2" id="plus_icon">
						<span class="glyphicon glyphicon-plus"></span> 더 보기
					</button>
				</a>
				<div class="col-md-6 table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>제목</th>
								<th class="date">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${output == null || fn:length(output) == 0}">
									<tr>
										<td colspan="9" align="center">공지사항이 없습니다.</td>
									</tr>
								</c:when>
								<%-- 조회결과가 있는  경우 --%>
								<c:otherwise>
									<%-- 조회 결과에 따른 반복 처리 --%>
									<c:forEach var="item" items="${output}" varStatus="status">
										<c:set var="Title" value="${item.getTitle()}" />
										<c:set var="CreationDate" value="${item.getCreationDate()}" />

										<tr>
											<td>${Title}</td>
											<td>${CreationDate}</td>
										</tr>
										<c:set var="num" value="${num-1}"></c:set>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="hot_issue col-md-12">
			<div class="col-md-offset-6 hot_issue_image" data-aos="fade-left" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="600">
				<img src="${pageContext.request.contextPath}/assets/img/hot1_issue.jpg" width="500px" height="300px" style="float: right;">
			</div>
			<div class="table-responsive" data-aos="fade-right" data-aos-offset="100" data-aos-easing="ease-in-sine" data-aos-duration="600">
				<h3 class="col-md-5">연-결 성혼 Story</h3>
				<a href="${pageContext.request.contextPath}/_info/story_SE.do">
				<button type="button" onclick="location='${pageContext.request.contextPath}/_info/story_SE.do'" class="btn btn-default btn-xs col-md-1" style="width: 65px; margin-left: 12px; margin-top: 30px;">
					<span class="glyphicon glyphicon-plus"></span> 더 보기
				</button>
				</a>
				<div class="col-md-6 table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>제목</th>
								<th class="date">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${output2 == null || fn:length(output2) == 0}">
									<tr>
										<td colspan="9" align="center">게시글이 없습니다.</td>
									</tr>
								</c:when>
								<%-- 조회결과가 있는  경우 --%>
								<c:otherwise>
									<%-- 조회 결과에 따른 반복 처리 --%>
									<c:forEach var="item" items="${output2}" varStatus="status">
										<c:set var="Title" value="${item.getTitle()}" />
										<c:set var="CreationDate" value="${item.getCreationDate()}" />
										
										<tr>
											<td>${Title}</td>
											<td>${CreationDate}</td>
										</tr>
										<c:set var="num" value="${num-1}"></c:set>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-12 footer">
			<ul>
				<li><a href="${pageContext.request.contextPath}/_info/IntroWebsite_YB.do">회사소개</a>
					<div class="vi"></div></li>
				<li><a href="${pageContext.request.contextPath}/_service/MembershipRegisGuide_YB.do">가입안내</a>
					<div class="vi"></div></li>
				<li><a href="${pageContext.request.contextPath}/_service/ServiceProcedures_YB.do">서비스이용절차</a>
					<div class="vi"></div></li>
				<li><a href="${pageContext.request.contextPath}/_info/map_GD.do">오시는길</a>
					<div class="vi"></div></li>
				<li><a href="${pageContext.request.contextPath}/_info/partner_HG.do">연-결 제휴 파트너</a>
					<div class="vi"></div></li>
				<li><a href="${pageContext.request.contextPath}/_service/MemberStatus_YB.do">회원현황</a></li>
			</ul>
		</div>

		<div class="col-md-12 footer_information">
			<div class="col-md-offset-2 footer_information_image">
				<img src="${pageContext.request.contextPath}/assets/img/footerMain.PNG" width="150" height="150">
			</div>
			<br>서울특별시 서초구 서초대로77길 54 서초더블유타워 13층 <br>무료상담전화: 1588-1588
			<span class="vii"></span> FAX : 02-1234-1234 
			<span class="vii"></span> Email : ezen@ezen.co.kr <br> <br> 상호명: (주)연-결 연애정보 
			<span class="vii"></span> 대표 : 박경동 <br> 연-결 매니저 : 정유빈 
			<span class="vii"></span> 배세은 
			<span class="vii"></span> 최유한 
			<span class="vii"></span> 남희권 <br> <br> COPYRIGHT&copy;CONNECT_5.co.kr
		</div>
	</div>
	<!-- Javascript -->

	<!-- 플러그인 참조 스크립트 -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/animate/jquery.animatecss.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/aos/aos.js"></script>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/Index1.js"></script>

	<!-- EVENT / HOT ISSUE 스크립트 -->
	<script type="text/javascript">
		$(function() {
			AOS.init();
		});
	</script>

	<!-- 사이드바 스크립트 -->
	<script type="text/javascript">
		$(function() {
			$(window).scroll(function() { // 브라우저에 스크롤이 발생하는 순간부터
				var curpos = $(window).scrollTop(); // 스크롤바의 상단 위치값+20 보관
				$("#sidebar_menu").stop().animate({
					"top" : curpos
				}); // 스카이메뉴의 상단위치값 애니
			});
		});
	</script>

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

	<!-- INFORMATION 플러그인 스크립트 -->
	<script src="${pageContext.request.contextPath}/assets/plugins/animate/jquery.animatecss.min.js"></script>
	<script type="text/javascript">
		$(function() {
			// 페이지 실행 즉시 2초 동안 재생
			$("#information_box1").animateCSS('fadeIn', {
				duration : 2000
			});
			// 페이지 실행 0.7초 이후 2초동안 재생
			$("#information_box2").animateCSS('fadeIn', {
				duration : 2000,
				delay : 400
			});
			// 페이지 실행 1.4초 이후 2초동안 재생
			$("#information_box3").animateCSS('fadeIn', {
				duration : 2000,
				delay : 800
			});
			$("#information_box4").animateCSS('fadeIn', {
				duration : 2000,
				delay : 1200
			});
		});
	</script>
</body>
</html>