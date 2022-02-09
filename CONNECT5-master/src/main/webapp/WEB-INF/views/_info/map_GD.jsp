<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/GD/Info/map.css">



 

<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/question1.png" alt="연-결"
			class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left_sidebar">
			<h3 class="title">연-결 소개</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
	            <a href="${pageContext.request.contextPath}/./_info/IntroWebsite_YB.do" class="list-group-item">사이트 소개</a>
                              <a href="${pageContext.request.contextPath}/./_info/Greetings_YB.do" class="list-group-item">연-결 인사말</a>
                              <a href="${pageContext.request.contextPath}/./_info/manager_HG.do" class="list-group-item">커플 매니저</a>
                              <a href="${pageContext.request.contextPath}/./_info/story_SE.do" class="list-group-item">연-결 성혼스토리</a>
                              <a href="${pageContext.request.contextPath}/./_info/notice_SE.do" class="list-group-item">공지사항</a>
                              <a href="${pageContext.request.contextPath}/./_info/partner_HG.do" class="list-group-item">연-결 파트너</a>
                              <a href="${pageContext.request.contextPath}/./_info/map_GD.do" class="list-group-item btncolor">오시는 길</a>
			</div>
		</div>
	</div>

	<h3 class="col-md-10">오시는 길</h3>
	<div class="col-md-10 text1">
		<h5>(주) 연- 결 본사 찾아오시는 길 안내 입니다.</h5>
		<hr />
	</div>
	
	<hr />

	<div class="col-md-9 content">

	 <div id="loc" align="center"></div>
	 <hr />
	 <div id="information" align="center"><span id="adr">주소 : 평안남도 평양시 대포동 451-1 령도자빌딩</span><div>TEL : 080-1518-2581</div></div><br />
	 <div id="comeon" align="left"><h3><strong>교통편</strong></h3>
	 <hr />
	 <div><h4 style="color:#F73478">도보</h4></div>
	 <p align="left" >DMZ 무단 횡단 , 임진강 해저터널 잠수</p>
	 <div><h4 style="color:#F73478">버스</h4></div>
	 <p align="left"> 684 실미도 버스 -> DMZ 돌파 -> 총격전 후 보위국 앞에서 하차</p>
	 <div><h4 style="color:#F73478">지하철</h4></div>
	 <p align="left"> 제 3땅굴 탄광선 -> 아오지역 하차 도보 5분</p>
	 <p align="left"> 제 2땅굴 탄광선 -> 대포동역 하차 후 직진 300m</p>
	 <p align="left"> 제 7땅굴 탄광선 -> 수령역 하차 후 좌회전 후 직진 500m</p>
	 </div>

		<!-- 내용 작성  -->
	</div>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCW32UIKoxVxO7MYMmf-arhD2Np3F_-IrM"></script>
         <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
         <!-- gmap 플러그인 참조 -->
         <script src="${pageContext.request.contextPath}/assets/plugins/gmaps/gmaps.min.js"></script>
         <script type="text/javascript">

           $(function(){

            var lat_value = 39.043022;
            var lng_value = 125.751030915;


            var map = new GMaps({
                 el: '#loc',     // 지도를 표시할 div의 id값.
                 lat: lat_value,    // 지도가 표시될 위도
                 lng: lng_value,    // 지도가 표시될 경도
                zoomControl: true   // 줌 컨트롤 사용 여부

             });

            map.addMarker({
                // 마우스 오버시 노란 박스
                title: '(주) 연-결 본관 (평양지점)',
                 lat: lat_value,    // 마커가 표시될 위도
                 lng: lng_value,    // 마커가 표시될 경도
                icon: {          // 사용자 정의 아이콘
                   url: "${pageContext.request.contextPath}/assets/img/map_icon.png",
                   scaledSize: new google.maps.Size(50, 50)
                },
                infoWindow: {    // 클릭시 표시될 말풍선 <-- HTML 코딩 가능함.
                   content: '<img src="${pageContext.request.contextPath}/assets/img/map_img.jpg" width="250" /><h4>성혼을 위한 바로 그곳 연-결</h4><p>평안 남도 평양시 대포동 591-1  </p><a href="#">상세보기</a>'
                }
             });

         });


                  
</script>


	<!-- 변경 사항 -->

<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>