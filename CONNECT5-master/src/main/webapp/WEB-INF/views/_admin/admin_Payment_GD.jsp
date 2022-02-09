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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Grid</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/footerMain.PNG" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/img/footerMain.PNG" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/nanumfont.css" />

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

<!-- 시각적 확인을 위한 CSS 적용 -->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/GD/Admin/payment.css">

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>


<script>
    	
    	$(function() {
            /** 더 보기 버튼에 대한 이벤트 정의 */
    		$("#ok").click(function() {
            	
    			
    			
    		});
            
			$("#cancel").click(function() {
            	
    			
    			
    		});
            
            
    	});
    </script>

</head>

<body>


	<div class="container">
		<div class="top">
			<div class="col-md-12 top_login">
				<p id="connect">
					admin 님 접속중
					<button type="submit" class="btn btn-xs"
						onclick="location='${pageContext.request.contextPath}/home.do'">Logout</button>
				</p>
			</div>
		</div>


		<div class="col-md-2 sidebar1">
			<a href="${pageContext.request.contextPath}/_admin/admin_main_SE.do"
				class="list-group-item">대시보드</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_userManager1_HG.do"
				class="list-group-item">회원관리</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_userManagement_YH.do"
				class="list-group-item">게시판 관리</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_userApply_YH.do"
				class="list-group-item">신청현황</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_Question_SE.do"
				class="list-group-item">문의현황</a> <a
				href="${pageContext.request.contextPath}/_admin/admin_Payment_GD.do"
				class="list-group-item active">결제관리</a>
		</div>

		<div class="col-md-10 middle">
			<h2>결제 관리</h2>
		</div>

		<form method="get"
			action="${pageContext.request.contextPath}/_admin/admin_Payment_GD.do">
			<div class="col-md-4 searching_box">
				<ul>
					<li><select name="keyField">
							<option value="username">이름</option>
					</select> <input type="text" name=keyword placeholder="이름검색"
						value="${keyword}" />
						<button type="submit">검색</button>
				</ul>

			</div>
		</form>
		<br /> <br />
		<div class="col-md-10 text_box">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr class="text-center">
						<td id="num">번호</td>
						<td>이름</td>
						<td>결제수단</td>
						<td id="views">결제금액</td>
						<td id="date">결제일</td>
						<td>현재 등급</td>
						<td id="delete">등급</td>
						<td id="manager">매니저</td>
						<td id="date_count">서비스</td>
						<td>승인</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<%--조회결과가 없는 경우 --%>
						<c:when test="${output == null || fn:length(output) == 0}">
							<tr>
								<td colspan="9" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<%--조회결과가 있는 경우 --%>
						<c:otherwise>
							<%--조회 결과에 따른 반복 처리 --%>
							<c:forEach var="item" items="${output}" varStatus="status">
								<%--출력을 위해 준비한 학과이름과 위치 --%>
								<c:set var="name" value="${item.username}" />
								<c:set var="clear" value="${item.clear}" />
								<%-- 검색어가 있다면? --%>
								<c:if test="${keyword != ''}">
									<%-- 검색어에 <mark> 태그를 적용하여 형광팬 효과 준비 --%>
									<c:set var="mark" value="<mark>${keyword}</mark>" />
									<%-- 출력을 위해 준비한 교수이름에서 검색어와 일치하는 단어를 형광팬 효과로 변경 --%>
									<c:set var="name"
										value="${fn:replace(username, keyword, mark)}" />
								</c:if>
								

								<form method="post"
									action="${pageContext.request.contextPath}/_admin/admin_Payment_edit_GD.do">
									<input type="hidden" name="MemberId" value="${item.memberid}">
									<tr>
										<td align="center">${item.paymentid}</td>
										<td align="center"><a href="${pageContext.request.contextPath}/_admin/admin_userManager2_HG.do?MemberId=${item.memberid}">${item.username}</a></td>
										<c:if test="${item.pmttype == 1 }">
											<td align="center">무통장입금</td>
										</c:if>
										<c:if test="${item.pmttype == 2 }">
											<td align="center">카드결제</td>
										</c:if>
										<c:if test="${item.servicetype == 1 }">
											<td align="center">2,999,000</td>
										</c:if>
										<c:if test="${item.servicetype == 2 }">
											<td align="center">4,999,000</td>
										</c:if>
										<c:if test="${item.servicetype == 3 }">
											<td align="center">6,999,000</td>
										</c:if>
										<c:if test="${item.servicetype == 4 }">
											<td align="center">9,999,000</td>
										</c:if>

										<td align="center">${item.datetime}</td>
										<c:if test="${item.member_lv == 0 }">
											<td align="center">일반</td>
										</c:if>
										<c:if test="${item.member_lv == 1 }">
											<td align="center">브론즈</td>
										</c:if>
										<c:if test="${item.member_lv == 2 }">
											<td align="center">실버</td>
										</c:if>
										<c:if test="${item.member_lv == 3 }">
											<td align="center">골드</td>
										</c:if>
										<c:if test="${item.member_lv == 4 }">
											<td align="center">V.I.P</td>
										</c:if>
										
										<c:if test="${clear == 0 }">
										<td align="center"><select name="memlv" id="memlv">
												<option value="1">브론즈</option>
												<option value="2">실버</option>
												<option value="3">골드</option>
												<option value="4">V.I.P</option>
										</select></td>
										</c:if>
										<c:if test="${clear == 1 }">
											<td align="center"><span>완료</span></td>
										</c:if>
										
										<%-- 조회 결과에 따른 반복 처리 --%>
										<c:if test="${clear == 0 }">
										<td align="center"><select name="manager" id="manager">
												<c:forEach var="item" items="${managerList }"
													varStatus="status">
													<option value="${item.managerid }">${item.managerid }</option>
												</c:forEach>
										</select></td>
										</c:if>
										<c:if test="${clear == 1 }">
											<td align="center"><span>완료</span></td>
										</c:if>
										
										<c:if test="${clear == 0 }">
										<td align="center"><select name="service" id="service">
												<option value="3">3회</option>
												<option value="5">5회</option>
												<option value="7">7회</option>
												<option value="99">무제한</option>
										</select></td>
										</c:if>
										<c:if test="${clear == 1 }">
											<td align="center"><span>완료</span></td>
										</c:if>
					
										<c:if test="${clear == 0 }">
											<td align="center"><input type="submit" value="확인"
												id="ok"></td>
										</c:if>
										<c:if test="${clear == 1 }">
											<td align="center"><span>완료</span></td>
										</c:if>
									</tr>
								</form>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<!-- 페이지 번호 구현 -->
			<%-- 이전 그룹에 대한 링크 --%>
			<c:choose>
				<%-- 이전 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.prevPage > 0}">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/_admin/admin_Payment_GD.do" var="prevPageUrl">
						<c:param name="page" value="${pageData.prevPage}" />
						<c:param name="keyword" value="${keyword}" />
					</c:url>
					<a href="${prevPageUrl}">[이전]</a>
				</c:when>
				<c:otherwise>
            [이전]
        </c:otherwise>
			</c:choose>

			<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
			<c:forEach var="i" begin="${pageData.startPage}"
				end="${pageData.endPage}" varStatus="status">
				<%-- 이동할 URL 생성 --%>
				<c:url value="/_admin/admin_Payment_GD.do" var="pageUrl">
					<c:param name="page" value="${i}" />
					<c:param name="keyword" value="${keyword}" />
				</c:url>

				<%-- 페이지 번호 출력 --%>
				<c:choose>
					<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
					<c:when test="${pageData.nowPage == i}">
						<strong>[${i}]</strong>
					</c:when>
					<%-- 나머지 페이지의 경우 링크 적용함 --%>
					<c:otherwise>
						<a href="${pageUrl}">[${i}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<%-- 다음 그룹에 대한 링크 --%>
			<c:choose>
				<%-- 다음 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.nextPage > 0}">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/_admin/admin_Payment_GD.do" var="nextPageUrl">
						<c:param name="page" value="${pageData.nextPage}" />
						<c:param name="keyword" value="${keyword}" />
					</c:url>
					<a href="${nextPageUrl}">[다음]</a>
				</c:when>
				<c:otherwise>
            [다음]
        </c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- Javascript -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>



	<script>
	
		
		console.log(${output});
		
		</script>

</body>
</html>