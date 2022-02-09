<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Mypage/withdrawal1.css">

<script>

$(document).ready(function() {
	   $("#btn1").click(function(){
	      
	      if($("#user_pw").val() == ""){
	         alert("비밀번호를 입력해주세요");
	      }else{
	    	  location.href = "${pageContext.request.contextPath}/_mypage/withdrawal2_HG.do";
	         return;
	      }
	      
	   });

	});
	
</script>

<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/withdrawalimg.PNG" alt="연-결"
			class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	 <!-- 가운데 영역 -->
                  <div class="center">
                     <div class="col-md-2">
                        <!-- 패널 타이틀1 -->
                        <div class="left_sidebar">
                           <h3 class="title">My 연-결</h3>
                           <!-- 사이드바 메뉴목록1 -->
                          <div class="list-group">
					<a href="${pageContext.request.contextPath}/_mypage/myInfo_GD.do"
						class="list-group-item ">My현황</a> <a
						href="${pageContext.request.contextPath}/_mypage/search_SE.do"
						class="list-group-item">인연 찾기</a> <a
						href="${pageContext.request.contextPath}/_mypage/1_1questionEmpty_YH.do"
						class="list-group-item">1:1 문의</a> <a
						href="${pageContext.request.contextPath}/_mypage/Ex-MatchingRecord_YB.do"
						class="list-group-item">매칭 기록 보기 </a><a
						href="${pageContext.request.contextPath}/_mypage/personal_information1_HG.do"
						class="list-group-item ">개인정보수정</a> <a
						href="${pageContext.request.contextPath}/_mypage/withdrawal1_HG.do"
						class="list-group-item btncolor">회원탈퇴</a>
				</div>
                        </div>
                     </div>
                     
					<h3 class="col-md-10">회원탈퇴</h3>
					<div class="col-md-10 text1">
			<h5>비밀번호를 입력해주세요.</h5>
		</div>
                     <div class="col-md-9 content">
				<hr />
				<fieldset>
			<form action="${pageContext.request.contextPath}/_mypage/withdrawal1ok_HG.do" method="POST" >
					<input type="hidden" name="MemberId"
						value="${output.getMemberId()}" />
					<div class="user_name">
					
						<label for="user_name" style="width:100px;" name="UserId">아이디 </label>
						<a>${output.getUserId()}</a>
					</div>
					<div class="user_pw">
						<label for="text" style="width:100px;">비밀번호 </label> 
						<input type="password"
							placeholder="비밀번호 입력해주세요" name="UserPw" id="user_pw" size="20" />

							
					</div>
					<div class="buttom">
						<br />
						<button class="btn btn-default" id="btn1"
							style="height: 30px; width: 80px;">확인</button>
					</div>
					
					</form>
				</fieldset>



			</div>
		
	</div>
	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>