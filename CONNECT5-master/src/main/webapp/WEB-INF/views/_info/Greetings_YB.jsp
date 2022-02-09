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
<title>연-결 소개_연-결 인사말(Greetings)</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/연결인사말_상단.jpg" alt="연-결"
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
                              <a href="${pageContext.request.contextPath}/./_info/IntroWebsite_YB.do" class="list-group-item">사이트 소개</a>
                              <a href="${pageContext.request.contextPath}/./_info/Greetings_YB.do" class="list-group-item btncolor">연-결 인사말</a>
                              <a href="${pageContext.request.contextPath}/./_info/manager_HG.do" class="list-group-item">커플 매니저</a>
                              <a href="${pageContext.request.contextPath}/./_info/story_SE.do" class="list-group-item">연-결 성혼스토리</a>
                              <a href="${pageContext.request.contextPath}/./_info/notice_SE.do" class="list-group-item">공지사항</a>
                              <a href="${pageContext.request.contextPath}/./_info/partner_HG.do" class="list-group-item">연-결 파트너</a>
                              <a href="${pageContext.request.contextPath}/./_info/map_GD.do" class="list-group-item">오시는 길</a>
                           </div> 
                        </div>
                     </div>


					 <!-- 내용 작성  -->
                     <h3 class="col-md-10">연-결 인사말</h3>
                     	<div class="col-md-10">
                     	
		                     <div class="col-md-9 content">
		                     <br />
		                     	<div class="box">
				                    <h4><b>연애와 결혼, 그게 바로 '연-결'입니다.</b></h4>
				                    <br />
					                    <h5>안녕하세요? (주)연-결 연애결혼정보회사 입니다.</h5>
					                    <h5>연-결이 추구하는 본질적 가치는 '자연스러운 만남'입니다.</h5>
					                    <h5>자연스러운 연애의 시작으로 최고의 성혼율을 이끌어 내고 있는 연-결 입니다.</h5>
					                    <h5>결혼을 위한 합리적인 매개체로 결혼정보회사가 자리잡음으로써 자연스러우며 올바른 소개만큼 중요한 것이 또 있을까요?</h5>
					                    <h5>연-결은 행복한 결혼생활의 밑거름이 되는 최상의 공통 분모를 찾아 상대를 선택할 수 있는 시스템이 있습니다.</h5>
					                    <h5>연-결은 가장 이상적인 남녀간의 만남을 주선하여 연애에서 행복한 결혼이 이루어지도록 최선의 노력을 다하겠습니다.</h5>	
					                    <h5>앞으로도 변함없는 관심과 성원 부탁드립니다.</h5>
					                 <br />
			                    	 <br />
		                    	 </div>
		                     </div>
								
								
		                   
							  <div class="col-md-9 content">
							  	<div class="box">
			                    	<h4><b>연-결의 발전은 회원과의 신뢰입니다!</b></h4>
			                    	<br />
					                     <h5>연-결은 입소문 난 연애▶성혼업체로서 강남센터에 위치하고 있습니다.</h5>
					                     <h5>이곳에서는 고객 한 분 한 분께 최선을 다하는 맞춤형 서비스로 정성껏 관리해 드리고 있습니다.</h5>
					                     <h5>연-결은 커플 매니저들이 최적의 매칭조건으로 상류층 VIP 고객분들께 걸맞는 상담과 매칭 서비스를 제공해드립니다.</h5>
					
					                     <h5>이러한 연-결의 자부심을 바탕으로 성혼이 성공할 수 있도록 최선을 다하겠습니다.</h5>
			                    	 <br />
			                    	 <br />
			             		</div>
			                    	 
			                    <div class="box">
			                  		<h4><b>연-결에 오신 여러분 진심으로 환영합니다.</b></h4>
			                    <br />
			                    </div>
			                     
			                   	<div class="box">
			                   	<br />
			                     	<img src="${pageContext.request.contextPath}/assets/img/wedding2.jfif" alt="연-결" class="img-rounded img-responsive" width="600" height=auto />
		                     	</div>
		                      	<br />
		                      	<br />
		                      	
			                    </div>
			             </div>
		             </div>
                 	 <!-- 가운데(내용) 영역 끝 -->

	<jsp:include page="../assets/inc/footer.jsp" />
	
</body>
</html>