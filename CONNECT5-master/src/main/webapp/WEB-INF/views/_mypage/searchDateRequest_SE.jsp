<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>datePicker</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/datepicker/datepicker.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/SE/Mypage/searchDateOpen.css">
<style>
body{
	text-align: center;
}
</style>
</head>
<body>
	<h1>날짜를 선택하세요.</h1>
	<hr />
	<div id="date">
        <input type="text" id="datepicker" readonly />
        <a href="#" id="show-cal"><img src="${pageContext.request.contextPath}/assets/img/calendar.png" height="20"></a>
    </div>
    <br />

    <div>
		<button type="submit" class="btn btn-primary" onclick="add()">확인</button>
		<button type="button" class="btn btn-primary" onclick="window.close(); return false;">취소</button>
	</div>
	
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/datepicker/datepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/datepicker/i18n/datepicker.ko-KR.js"></script>
    <script>
        $(function() {
            $("#datepicker").datepicker({
                autoHide: true,         // 날짜 선택 후 자동 숨김 (true/false)
                format: 'yyyy-mm-dd',   // 날짜 형식
                language: 'ko-KR',      // 언어
                weekStart: 0,           // 시작요일(0=일요일~6=토요일)
                trigger: '#show-cal',    // 클릭시 달력을 표시할 요소의 id
                startDate:Date()
            });
        });
        
        function add(){
        	var SpService = ${ReqSpService};
            if(confirm("해당 날짜를 선택 하시겠습니까?") == true){
            	var start = $("#datepicker").val();
            	alert("등록이 완료되었습니다.");
            	window.opener.top.location.href="${pageContext.request.contextPath}/_mypage/searchDateRequest_SE.do?start="+ start+"&ReqSpService="+SpService;	
           }else{
              return;
           }
			window.close()
        }
    </script>
	   
</body>
</html>