<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />

<!-- 시각적 확인을 위한 CSS 적용 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/YB/Info/IntroWebsite&Greetings.css">

<meta charset="utf-8" />
<title>연-결 소개_사이트 소개(IntroWebsite)</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />

	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/weddingharmony1.jpg" alt="연-결"
			class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	 <!-- 가운데 영역 -->
                  <div class="center">
                     <div class="col-md-2">
                        <!-- 패널 타이틀1 -->
                        <div class="left_sidebar">
                           <h3 class="title">연-결 소개</h3>
                           <!-- 사이드바 메뉴목록1 -->
                           <div class="list-group">
                              <a href="${pageContext.request.contextPath}/./_info/IntroWebsite_YB.do" class="list-group-item btncolor">사이트 소개</a>
                              <a href="${pageContext.request.contextPath}/./_info/Greetings_YB.do" class="list-group-item">연-결 인사말</a>
                              <a href="${pageContext.request.contextPath}/./_info/manager_HG.do" class="list-group-item">커플 매니저</a>
                              <a href="${pageContext.request.contextPath}/./_info/story_SE.do" class="list-group-item">연-결 성혼스토리</a>
                              <a href="${pageContext.request.contextPath}/./_info/notice_SE.do" class="list-group-item">공지사항</a>
                              <a href="${pageContext.request.contextPath}/./_info/partner_HG.do" class="list-group-item">연-결 파트너</a>
                              <a href="${pageContext.request.contextPath}/./_info/map_GD.do" class="list-group-item">오시는 길</a>
                           </div> 
                        </div>
                     </div>


					 <!-- 내용 작성  -->

                     <h3 class="col-md-10">연-결 사이트 소개</h3>
                     <div class="col-md-10">
                     <div class="col-md-10 text1"><h5><b>행복한 성혼을 이뤄드립니다.</b></h5></div>

                     	<div class="col-md-9 content">
	            		 	<div class="box">
	            		 		<br />
			            		 <h4><b>연애결혼정보회사 '(주)연-결'은</b></h4>
			            		 <h5>정직, 신뢰, 행동을 기반으로 </h5>
			                     <h5>때로는 아들딸처럼, 부모처럼 가족 같은 마음으로 고객 여러분을 소중히 여깁니다.</h5>
			                     <br />
	
								<h4><b>About Connect</b></h4>
								<h5>자연스러운 만남으로 되게 하라!</h5>
								<h5>성혼은 자연스러운 연결과정이 제일 중요합니다.</h5>
								<br />	
								<br />
							</div>

							<div class="box">
	                     		<img src="${pageContext.request.contextPath}/assets/img/wedding1.jfif" alt="연-결" class="img-rounded img-responsive" width="600" height=auto />
							</div>
							<br />
							<br />
							<br />
                  		</div>
                  		</div>
                  	</div>
                 	<!-- 가운데(내용) 영역 끝 -->

	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html> 