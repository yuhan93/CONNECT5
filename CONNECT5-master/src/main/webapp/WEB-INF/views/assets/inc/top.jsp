<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="utf-8" />
</head>
<body>
	<div class="container">
		<!-- col-md-12 영역 -->

		<div class="row">
			<!-- 4 / 4 / 4 로 나눔 -->
			<div class="col-md-offset-4 col-md-4">

				<!-- 메인 로고 -->
				<h1 class="logo">
					<a href="${pageContext.request.contextPath}/home.do"><img
						src="${pageContext.request.contextPath}/assets/img/Mainlogo11.PNG"
						alt="연-결"></a>
				</h1>
				<!-- 메인로고 끝 -->
			</div>

			<!-- 로그인 -->
			<div class="col-md-4">


				<ul id="user">
					<c:choose>
						<c:when test="${loginInfo == null }">
							<li><a href="${pageContext.request.contextPath}/_login/login_HG.do">LOGIN</a></li>
							<li><a href="${pageContext.request.contextPath}/_join/join1_HG.do">SIGN
									UP</a></li>
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
					<li><a
						href="${pageContext.request.contextPath}/./_info/IntroWebsite_YB.do">사이트
							소개</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_info/Greetings_YB.do">연-결
							인사말</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_info/manager_HG.do">커플
							매니저</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_info/story_SE.do">연결
							성혼 Story</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_info/notice_SE.do">공지사항</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_info/partner_HG.do">연-결
							파트너</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_info/map_GD.do">오시는
							길</a></li>
				</ul>

				<ul class="lnb2_ul">
					<li><a
						href="${pageContext.request.contextPath}/./_service/ServiceProcedures_YB.do">서비스
							이용절차</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_service/MembershipRegisGuide_YB.do">회원가입
							안내</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_service/MemberLevel_YH.do">회원등급
							안내</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_service/SpecialService_YH.do">스페셜
							서비스</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_service/MemberStatus_YB.do">회원현황</a></li>
				</ul>

				<ul class="lnb2_ul">
					<li><a
						href="${pageContext.request.contextPath}/./_coach/meetingTip_GD.do">미팅성공전략
							TIP</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_coach/loveColumn_GD.do">LOVE
							컬럼</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_coach/DatingCourse_YB.do">데이트
							코스</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_coach/review_SE.do">연-결
							만남 후기</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_coach/QnA_SE.do">연결
							Q &amp; A</a></li>
				</ul>
				<ul class="lnb2_ul">
					<li><a
						href="${pageContext.request.contextPath}/./_test/propensity1_HG.do">연애성향
							테스트</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_test/idealtype_HG.do">이상형
							찾기</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_test/lovescore1_HG.do">나의
							연애 매력</a></li>
				</ul>
				<ul class="lnb2_ul">
					<li><a
						href="${pageContext.request.contextPath}/./_mypage/myInfo_GD.do">My
							현황</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_mypage/search_SE.do">인연
							찾기</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_mypage/1_1questionEmpty_YH.do">1:1문의</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_mypage/Ex-MatchingRecord_YB.do">매칭
							기록 보기</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_mypage/personal_information1_HG.do">개인정보
							수정</a></li>
					<li><a
						href="${pageContext.request.contextPath}/./_mypage/withdrawal1_HG.do">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
		<!-- 카테고리 끝 -->


		<!-- 사이드바 메뉴 -->
		<div class="sidebar">
			<ul id="sidebar_menu">

				<li><a
					href="${pageContext.request.contextPath}/./_payment/mustInput_SE.do"><img
						src="${pageContext.request.contextPath}/assets/img/결제하기1.png"
						width="95px" height=""></a></li>
				<li><a
					href="${pageContext.request.contextPath}/./_coach/QnA_SE.do"><img
						src="${pageContext.request.contextPath}/assets/img/문의하기1.png"
						width="95px" height=""></a></li>
				<li><a
					href="${pageContext.request.contextPath}/./_mypage/1_1questionEmpty_YH.do"><img
						src="${pageContext.request.contextPath}/assets/img/1_1문의1.png"
						width="95px" height=""></a></li>
				<li><a
					href="${pageContext.request.contextPath}/./_info/map_GD.do"><img
						src="${pageContext.request.contextPath}/assets/img/오시는길1.png"
						width="95px" height=""></a></li>
				<li><a href="#"><img
						src="${pageContext.request.contextPath}/assets/img/전화번호.png"
						width="95px" height=""></a></li>
			</ul>
		</div>
		<!-- 사이드바 메뉴 끝 -->
</body>
</html>