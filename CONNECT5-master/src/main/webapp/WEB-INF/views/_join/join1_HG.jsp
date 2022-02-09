<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/HG/Join/join1.css">

<script>
	$(function() {

		$("#btn1")
				.click(
						function(e) {
							e.preventDefault;

							var value1 = $("#chk1:checked").val();
							var value2 = $("#chk2:checked").val();

							if (value1 != null && value2 != null) {
								location.href = "${pageContext.request.contextPath}/_join/join2_HG.do";
							} else {
								alert("모든 약관에 동의해주세요.");
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
		<img src="${pageContext.request.contextPath}/assets/img/joinimg1.PNG"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<!-- 가운데 영역 -->
	<div class="center">
		<div class="col-md-2">
			<!-- 패널 타이틀1 -->
			<div class="left_sidebar">
				<h3 class="title">회원가입</h3>
				<!-- 사이드바 메뉴목록1 -->
				<div class="list-group">
					<a href="${pageContext.request.contextPath}/_join/join1_HG.do"
						class="list-group-item btncolor">회원가입</a> <a
						href="${pageContext.request.contextPath}/_login/login_HG.do"
						class="list-group-item">로그인</a> <a
						href="${pageContext.request.contextPath}/_findAccount/FindId_GD.do"
						class="list-group-item">ID/PW 찾기</a>
				</div>
			</div>
		</div>
		<div class="col-md-9 content">
			<h3 class="col-md-10">회원가입</h3>
			<h4 class="col-md-10">연-결 회원이 되시면 더 많은 서비스를 이용하실 수 있습니다.</h4>
			<br> <br>







			<div class="aaaa">
				<!-- 서비스 동의박스 -->
				<div class="col-md-12">
					<div class="well" id="chk1">
						<div
							style="overflow-x: hidden; overflow-y: auto; width: 700px; height: 100px;">
							제 1 조 (목적) 이 약관은 ㈜연-결 결혼정보(이하 "연-결"라 합니다.)와 이용자간에 회사가 운영하는 인터넷
							사이트 (www.CONNECT_5.co.kr)및 동 사이트의 기본 DB를 공유하는 모든 사이트와 연-결이 운영하는
							제휴사이트 포함(이하 "사이트"라 합니다.)에서 제공하는 제반 서비스(이하 "서비스"라 합니다)의 가입 및 이용에
							관한 제반 사항과 기타 필요한 사항을 규정함을 목적으로 합니다. 제 2 조 (용어의 정의) 이 약관에서 사용하는
							주요한 용어의 정의는 다음과 같습니다. 1) 회원 : 서비스를 제공받기 위하여 이용자 아이디(ID)를 부여 받은 자를
							말합니다. 2) 회원 아이디 (이하 "ID" ) : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가
							부여하는 문자와 숫자의 조합을 말합니다. 3) 비밀번호 : 회원이 사용하는 ID와 일치된 회원임을 확인하고 회원의
							개인정보를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다. 제 3 조 (약관의 효력 및 변경) 1) 이 약관은
							이용자가 회원에 가입함과 동시에 효력을 발생하며, 관계법령에 위배되지 않는 범위 안에서 개정될 수 있습니다. 개정된
							약관은 온라인에서 공지함으로써 효력을 발생하며, 이용자의 권리 또는 의무 등 중요한 규정의 개정은 사전에 공지합니다.
							2) 이 약관에 동의하는 것은 정기적으로 웹을 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다. 변경된
							약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 회사에서 책임지지 않습니다. 3) 회원은 개정된 약관에
							동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, 서비스를 계속 사용하는 것은 약관의 내용을 수락하고 동의하는
							것으로 간주합니다. 제 4 조 (약관 외 준칙) 1) 이 약관이 해당사이트에서 공지하는 개별서비스 혹은 회사의 정책에
							대한 세부적인 안내내용은 서비스안내(헬프데스크 등 도움말 관련 메뉴, 각 메뉴 및 서비스 화면에 고지된 내용,
							사이트에 게시하는 공지 등을 포함하며 회사가 온라인에서 제공하는 서비스에 대한 설명 및 사용권한, 회원의 의무, 책임
							등을 명시한 내용 이하 "서비스안내"라 합니다)에서 정할 것을 위임하거나, 기타 이 약관에서 명시하지 아니한 사항에
							대하여는 서비스안내가 정한 바에 따르기로 합니다. 2) 서비스안내의 변경 및 변경에 관한 동의에 있어서도 제3조
							제2항 및 제3항의 규정을 적용합니다.. 제 5 조 (회원가입) 1) 사이트 회원이 되고자 하는 자는 회사가 정한
							가입양식에 따라 회원정보를 기입하고 "약관에 동의합니다" 및 "회원가입" 단추를 누르는 방법으로 회원가입을
							신청합니다. 2) 회원은 반드시 회원 본인의 실명과 본인 연락처(본인확인)를 기재하여야 하며, 회사가 정한 가입양식에
							기재하는 모든 정보는 진실한 것으로 간주됩니다. 내용이 허위이거나, 그러하다고 의심할만한 합리적인 사유가 발생할 경우
							회사는 가입신청을 한 회원의 모든 ID를 삭제하고 본 서비스 제공의 일부 또는 전부를 중지할 수 있으며, 이로 인해
							발생하는 모든 불이익에 대하여 책임지지 않습니다. 회사는 이를 위하여 필요한 경우 제 증명을 요구할 수 있습니다.
							3) 회원이 회사의 사이트 회원으로 가입하는 것은 서비스와 관련된 전화(SMS 포함), 이메일(E-MAIL)을
							수신하는 데에 동의하는 것으로 간주합니다. 단, 이메일 수신 거부자의 경우 이메일 발송대상에서 제외되며, 이후에도
							회원의 의사에 따라 수신여부를 변경할 수 있습니다.</div>
					</div>
					<input type="checkbox" name="req" id="chk1" /> 동의합니다. <br> <br>
					<div class="well">
						<div
							style="overflow-x: hidden; overflow-y: auto; width: 700px; height: 100px;">
							[소비자 권익 보호에 관한 사항] 1) 최소한의 정보처리 및 동의거부에 대한 안내 - 정보동의시 가입상담 및 고객관리
							등을 위해 최소한의 정보만 수집.이용하게 되며, 본 동의를 거부하시는 경우에는 해당 서비스의 이용 및 가입상담 등
							정상적인 서비스 제공이 불가능할 수 있음을 알려 드립니다. 2) 개인정보 제공동의 열람,정정,처리정지 - 개인정보
							수집ㆍ이용에 동의한 이후에도 개인정보 열람 요구, 개인정보 정정·삭제 요구, 개인정보 처리정지 요구를
							전화[대표번호], 서면, 메일 등을 통해 요청할 수 있습니다. 3) 상품권유 중지청구(Do-Not Call) -
							개인정보 제공 및 이용에 동의한 이후에도 전화[대표번호], 서면 등을 통해 마케팅활동에 대한 중지를 요청할 수
							있습니다. [개인정보 제공에 관한 사항] 1. 개인정보를 제공받는 자 : 커플매니저, 파티/이벤트 담당, 마케팅
							담당, 바로연 협력사 2. 개인정보를 제공받는 자의 이용 목적 1) 온라인 서비스 컨텐츠 제공 - 온라인 회원제 가입
							서비스 제공, 다양한 테스트 및 결과 내용 발송, 서비스 관련 안내자료 등 발송 2) 결혼중개 서비스 제공을 위한
							서비스 이용 의사 확인 - 컨텐츠 제공, 컨텐츠 맞춤 서비스 제공, 다양한 테스트 및 결과 내용 발송, 서비스 관련
							안내자료 등 발송 - 본인 식별, 결혼중개 서비스 가입 관련 안내자료 발송 및 상담 등의 서비스 가입권유 - 결혼중개
							서비스와 관련된 이벤트(미팅파티, 상품증정) 안내 및 신상품 정보 제공 등 - 마케팅 광고에의 활용, 광고성 정보
							제공 3) 결혼중개 서비스 제공을 위한 계약의 성립 및 이행 - 본인 식별, 프로필 소개 등 결혼중개 서비스 제공 -
							결혼중개 서비스 이용 대금 결제 - 이용약관 위반 회원에 대한 이용제한 조치, 서비스의 원활한 운영에 지장을 미치는
							행위 및 서비스 부정이용 행위 제재, 분쟁 조정을 위한 기록보존, 고지사항 전달, 회원탈퇴 의사의 확인 - 민원처리


						</div>
					</div>
					<input type="checkbox" name="req" id="chk2" /> 동의합니다.

					<div class="buttom">
						<br>
						<button class="btn btn-default" id="btn1"
							style="height: 30px; width: 80px;">다음</button>
					</div>
				</div>
			</div>

		</div>
	</div>




	<!-- 가운데 영역 끝 -->


	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>