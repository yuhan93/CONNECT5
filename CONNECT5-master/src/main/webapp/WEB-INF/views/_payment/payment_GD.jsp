<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/GD/Payment/payment.css">


<script>
	$("document")
			.ready(
					function() {

						$("input:radio[name=pay]")
								.click(
										function() {

											if ($("input[name=pay]:checked")
													.val() == "2") {
												$("#selectpay")
														.html(
																"<select id='cardType' name='cardType'><option value=''>--------카드선택--------</option><option value='1'>KB국민카드</option><option value='2'>농협카드</option><option value='3'>삼성카드</option><option value='4'>BC카드</option><option value='5'>현대카드</option><option value='6'>우리카드</option></select>")
												$("#pay_bank").html("카드사")
												$("#pay_name").html("일시불")
												$("#pay_area")
														.html(
																"<select id='installment' name='installment'><option value=''>--------할부선택--------</option><option value='0'>일시불</option><option value='1'>2개월</option><option value='2'>3개월</option><option value='3'>6개월</option><option value='4'>10개월</option><option value='5'>12개월</option></select>")

											} else if ($(
													"input[name=pay]:checked")
													.val() == "1") {
												$("#selectpay")
														.html(
																"<select id='bank'><option>--------은행선택--------</option><option value='1'>KB국민은행</option><option value='2'>농협</option><option value='3'>신한은행</option><option value='4'>BC카드</option><option value='5'>하나은행</option><option value='6'>우리은행</option></select>")

												$("#pay_bank").html("입금 은행")
												$("#pay_name").html("입금자 명")
												$("#pay_area")
														.html(
																"<input type='text' size='16' id='payName' name='payName'>")
											}

										});

						$("input:radio[name=level]")
								.click(
										function() {

											if ($("input[name=level]:checked")
													.val() == "1") {
												$("#price")
														.html(
																"<span id='price1'>2,999,000원</span>");
											} else if ($(
													"input[name=level]:checked")
													.val() == "2") {
												$("#price")
														.html(
																"<span id='price1'>4,999,000원</span>");
											} else if ($(
													"input[name=level]:checked")
													.val() == "3") {
												$("#price")
														.html(
																"<span id='price1'>6,999,000원</span>");
											} else if ($(
													"input[name=level]:checked")
													.val() == "4") {
												$("#price")
														.html(
																"<span id='price1'>9,999,000원</span>");
											}

										});

					});

	function paygo() {

		var level = $("input[name=level]:checked").val();
		var bank = $("#bank").val();
		var pay_name = $("#payName").val();
		var installment = $("#installment").val();
		var card = $("#cardType").val();

		if (level == null) {
			alert("서비스를 선택해주세요");
			return false;
		}

		if ($("input[name=pay]:checked").val() == "gobank") {

			if (bank == "") {
				alert("은행을 선택해주세요");
				return false;
			}
			if (pay_name == "") {
				alert("입금자명을 입력해주세요");
				return false;

			}
			if (confirm("결제하시겠습니까?") == true) {
				alert("결제가 정상적으로 완료되었습니다.");
			} else {
				return;
			}
			location.href = "${pageContext.request.contextPath}/_payment/pay_ok_GD.do";
		}

		if ($("input[name=pay]:checked").val() == "card") {
			if (card == "") {
				alert("카드사를 선택해주세요");
				return false;
			}
			if (installment == "") {
				alert("할부 개월수를 선택해주세요");
				return false;
			}
			if (confirm($("input[name=level]:checked").val() + " / "
					+ $("#cardType").val() + " / " + $("#installment").val()
					+ "  입력하신 정보가 맞습니까?") == true) {
				alert("결제가 정상적으로 완료되었습니다.");
			} else {
				return;
			}
			location.href = "${pageContext.request.contextPath}/_payment/pay_ok_GD.do";

		}

	}
</script>

<meta charset="utf-8" />
<title>연-결</title>
</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/question1.png"
			alt="연-결" class="img-responsive" />
	</div>
	<!-- 상단 이미지 끝 -->

	<div class="col-md-2">
		<!-- 패널 타이틀1 -->
		<div class="left sidebar1">
			<h3 class="title">유료 결제</h3>
			<!-- 사이드바 메뉴목록1 -->
			<div class="list-group">
				<a href="#" class="list-group-item ">필수 입력 항목</a> <a href="#"
					class="list-group-item btncolor">결제 수단 선택</a> <a href="#"
					class="list-group-item" id="success">결제 완료</a>
			</div>
		</div>
	</div>



	<h3 class="col-md-10">결제 서비스</h3>
	<div class="col-md-10 text1">
		<h5>결제 수단 선택</h5>
	</div>
	<form method="post"
		action="${pageContext.request.contextPath}/_payment/payok.do">
		<div class="col-md-9 content">
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th class="text-center" id="num">서비스 선택</th>
							<th class="text-center"><input type="radio" name="level"
								value="1" />데이트
								3회&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="radio" name="level" value="2" />데이트
								5회&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="radio" name="level" value="3" />데이트 7회 +
								@&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="radio" name="level" value="4" />데이트 무제한</th>
						</tr>
						<tr>
							<th class="text-center" id="num">결제 수단</th>
							<th class="text-center"><input type="radio" name="pay"
								value=1 checked="checked" />무통장
								입금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="radio" name="pay" value=2 />카드
								결제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
						</tr>
					</thead>
				</table>
				<div align="center">
					<table class="table-bordered" width="500px" align="center">
						<tr>
							<th class="text-center" id="payment">결제 금액</th>
							<th class="text-center" id="price">
								<div id="price" align="center"></div>
							</th>
						</tr>
						<tr>
							<div id="bankorcard">
								<th class="text-center" id="pay_bank">입금 은행</th>

								<th class="text-center" id="selectpay"><select name="bank"
									id="bank">
										<option value="">--------은행선택--------</option>
										<option value="1">신한은행</option>
										<option value="2">KB은행</option>
										<option value="3">농협</option>
										<option value="4">하나은행</option>
										<option value="5">우리은행</option>
										<option value="6">신협</option>
										<option value="7">새마을금고</option>
								</select></th>
						</tr>
						<tr>
							<th class="text-center" id="pay_name">입금자 명</th>

							<th class="text-center" id="pay_area"><input type="text"
								size="16" name="payName"></th>
						</tr>
					</table>
					<br />
					<button class="btn btn-default" onclick="paygo()">결제요청</button>
				</div>
			</div>
		</div>
	</form>






	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>