<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Info/partner.css">

<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/partnerimg1.PNG" alt="연-결"
			class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	 
                     <div class="col-md-2">
                        <!-- 패널 타이틀1 -->
                        <div class="left_sidebar">
                           <h3 class="title">연-결 소개</h3>
                           <!-- 사이드바 메뉴목록1 -->
                            <div class="list-group">
					<a href="${pageContext.request.contextPath}/_info/IntroWebsite_YB.do"
						class="list-group-item">사이트 소개</a> <a
						href="${pageContext.request.contextPath}/_info/Greetings_YB.do"
						class="list-group-item">연-결 인사말</a> <a href="${pageContext.request.contextPath}/_info/manager_HG.do"
						class="list-group-item ">커플 매니저</a> <a href="${pageContext.request.contextPath}/_info/story_SE.do"
						class="list-group-item">연-결 성혼스토리</a> <a href="${pageContext.request.contextPath}/_info/notice_SE.do"
						class="list-group-item">공지사항</a> <a href="${pageContext.request.contextPath}/_info/partner_HG.do"
						class="list-group-item btncolor">연-결 파트너</a> <a href="${pageContext.request.contextPath}/_info/map_GD.do"
						class="list-group-item">오시는 길</a>
				</div>
                        </div>
                     </div>


	<h3 class="col-md-10">연-결 파트너</h3>
	<div class="col-md-10 text1">
		<h5>연-결 파트너입니다.</h5> <br />
	</div>

	<div class="col-md-9 content">
	<div class="box10">
	<span class="photo transform1">
	<img src="${pageContext.request.contextPath}/assets/img/seoulimg.PNG">
	<p>서 울 대 학 교</p>
	</span>
</div>

<div class="box10">
	<span class="photo transform2">
	<img src="${pageContext.request.contextPath}/assets/img/koreaimg.PNG">
	<p>고 려 대 학 교</p>
	</span>
	</div>
	
	<div class="box10">
	<span class="photo transform3">
	<img src="${pageContext.request.contextPath}/assets/img/yonseiimg.PNG">
	<p>연 세 대 학 교</p>
	</span>
	</div>
	
	<div class="box10">
	<span class="photo transform4">
	<img src="${pageContext.request.contextPath}/assets/img/hanyangimg.PNG">
	<p>한 양 대 학 교</p>
	</span>
</div>

<div class="box10">
	<span class="photo transform5">
	<img src="${pageContext.request.contextPath}/assets/img/cauimg.PNG">
	<p>중 앙 대 학 교</p>
	</span>
	</div>
	
	<div class="box10">
	<span class="photo transform6">
	<img src="${pageContext.request.contextPath}/assets/img/konkukimg.PNG">
	<p>건 국 대 학 교</p>
	</span>
		</div>
</div>
	


	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>