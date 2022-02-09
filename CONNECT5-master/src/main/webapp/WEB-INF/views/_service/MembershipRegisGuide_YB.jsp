<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />




<!-- 시각적 확인을 위한 CSS 적용 -->

<style>

/* 공통 초기화 작업
 -------------------------------------------- */
 * {
 	margin: 0;
 	padding: 0;
}

 html, body {
 	width: 100%;
 	height: 100%;
}

 ul, ol {
 	life-style: none;
}

/* 목록정의 각 항목 사이의 구분선
 -------------------------------------------- */
#gallery li {
 	border-bottom: 1px dotted #ccc;
}

#gallery li:last-child {
	border-bottom: 0;
}

/* 링크 영역 크기 확장 및 글자 처리
 -------------------------------------------- */
#gallery li a {
	display: block;
	width: auto;
	padding: 5px;
	color: #222;
	text-decoration: none;

/** 텍스트를 감싸는 블록의 부모 요소에게 position 부여 */
	position: relative;
}

/* 이미지가 들어 있는 <span> 및 이미지 크기 처리
 -------------------------------------------- */
#gallery li a {
 	width: 80px;
 	height: 120px;
 	display: block;
 }

#gallery img {
 	width: 95px;
 	height: 95px;
 	display: block;
 }

/* 텍스트를 감싸는 블록
 -------------------------------------------- */
#gallery .text {
 	display:block;
 	width: auto;
 	position: absolute;
 	left: 130px;
 	top: 27px;
 }

/* 텍스트 블록 안의 제목과 내용 공통
 -------------------------------------------- */
#gallery .text span {
 	display: block;
 	white-space: nowrap;
 	overflow: hidden;
 	text-overflow: ellipsis;
}

/* 제목 + 내용
 -------------------------------------------- */
#gallery .text .title {
	font-weight: bold;
}

#gallery .text .desc {
	font-size: 0.8em;
	line-height: 150%;
}



</style>

	
	
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<meta charset="utf-8" />
<title>서비스 안내_회원가입안내(MembershipRegisGuide)</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/회원가입안내_상단.png" alt="연-결"
			class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">서비스 안내</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
            	<a href="${pageContext.request.contextPath}/_service/ServiceProcedures_YB.do" class="list-group-item">서비스 이용절차</a>
                <a href="${pageContext.request.contextPath}/_service/MembershipRegisGuide_YB.do" class="list-group-item btncolor">회원가입안내</a>
                <a href="${pageContext.request.contextPath}/_service/MemberLevel_YH.do" class="list-group-item">회원등급안내</a>
                <a href="${pageContext.request.contextPath}/_service/SpecialService_YH.do" class="list-group-item">연-결 스페셜 서비스</a>
                <a href="${pageContext.request.contextPath}/_service/MemberStatus_YB.do" class="list-group-item">회원 현황</a>
            </div> 
		</div>
	</div>


	<h3 class="col-md-10">회원가입안내</h3>
	<div class="col-md-10 text1">
		<h5>회원가입 안내입니다.</h5>
	</div>

	<div class="col-md-9 content">
		



	<ul id="gallery">
		<li>
			<a>
				<!-- 이미지, 제목, 요약글 -->
				<span class="thumb">
					<img src="${pageContext.request.contextPath}/assets/img/01상담안내.png" alt="01상담문의" /></span>
				<span class="text">
					<span class="title">[STEP 01] 무료상담문의</span>
					<span class="desc">연-결에 궁금한 사항이 있으시면 전화, 온라인, 방문을 통해 무료로 상담 받으실 수 있습니다.</span>
				</span>
			</a>
		</li>
		<li>
			<a>
				<!-- 이미지, 제목, 요약글 -->
				<span class="thumb">
					<img src="${pageContext.request.contextPath}/assets/img/02맞춤상담.png" alt="02맞춤상담" />
				</span>
				<span class="text">
					<span class="title">[STEP 02] 1:1 맞춤상담</span>
					<span class="desc">풍부한 경험과 노하우를 겸비한 커플매니저 상담합니다.
						<br />
						회원님의 이상형, 서비스가입절차, 활동 전반에 관한 사항을 꼼꼼히 알려드립니다.
					</span>
				</span>
			</a>
		</li>
		<li>
			<a>
				<!-- 이미지, 제목, 요약글 -->
				<span class="thumb">
					<img src="${pageContext.request.contextPath}/assets/img/03정회원가입.png" alt="03정회원가입" />
				</span>
				<span class="text">
					<span class="title">[STEP 03] 정회원 가입</span>
					<span class="desc">신분증, 재직증명서 등 철저한 신원 인증 절차를 진행합니다.
						<br />
						회원님의 연인을 찾아 드리기 위한 매칭 데이터폼을 작성합니다.
						<br />
						감성매칭 시스템 테스트를 진행하여 이상형을 찾아드립니다.
					</span>
				</span>
			</a>
		</li>
		<li>
			<a>
				<!-- 이미지, 제목, 요약글 -->
				<span class="thumb">
					<img src="${pageContext.request.contextPath}/assets/img/04정회원인증.png" alt="04회원인증" />
				</span>
				<span class="text">
					<span class="title">[STEP 04] 정회원 인증</span>
					<span class="desc">유료서비스, 서류심사, 정회원 가입 절차가 완료되면 연-결 정회원 시스템에 등록됩니다.
						<br />
						등록이 완료되는 즉시 연-결의 혜택을 받으실 수 있습니다.
					</span>
				</span>
			</a>
		</li>
		<li>
			<a>
				<!-- 이미지, 제목, 요약글 -->
				<span class="thumb">
					<img src="${pageContext.request.contextPath}/assets/img/05담당매니저지정.png" alt="05담당매니저" />
				</span>
				<span class="text">
					<span class="title">[STEP 05] 담당매니저 지정</span>
					<span class="desc">정회원으로 등록되시면 담당 매니저가 지정되며 회원님께 어울리는 최적의 상대를 소개해드립니다.
						<br />
						담당 매니저가 소개한 상대를 만날 의향이 있을 경우 만남이 지속됩니다.
					</span>
					
				</span>
			</a>
		</li>
	</ul>	
	</div>
	<!-- 가운데(내용) 영역 끝 -->

	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>