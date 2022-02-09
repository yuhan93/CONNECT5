<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/inc/css.jsp" />

<!-- 시각적 확인을 위한 CSS 적용 -->
<style>

body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}

#chartdiv {
  width: 120%;
  height: 500px;
}

</style>


<meta charset="utf-8" />
<title>서비스 안내_멤버 현황(Service_MemberStatus1)</title>


</head>
<body>
	<jsp:include page="../assets/inc/top.jsp" />



	<!-- 변경사항  -->


	<!-- 상단 이미지 ( 다른 이미지 저장 시 src 변경 이름 ) -->
	<div class="boximg">
		<img src="${pageContext.request.contextPath}/assets/img/멤버현황상단.png" alt="연-결"
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
                <a href="${pageContext.request.contextPath}/_service/MembershipRegisGuide_YB.do" class="list-group-item">회원가입안내</a>
                <a href="${pageContext.request.contextPath}/_service/MemberLevel_YH.do" class="list-group-item">회원등급안내</a>
                <a href="${pageContext.request.contextPath}/_service/SpecialService_YH.do" class="list-group-item">연-결 스페셜 서비스</a>
                <a href="${pageContext.request.contextPath}/_service/MemberStatus_YB.do" class="list-group-item btncolor">회원 현황</a>
            </div> 
		</div>
	</div>


	<h3 class="col-md-10">회원 현황</h3>
	<div class="col-md-10 text1">
		<h5>회원들의 비율을 지표 및 그래프로 보여줍니다.</h5>
	
	<div class="col-md-9 content">
	
		<div class="container">
			<a href="${pageContext.request.contextPath}/_service/MemberStatus_YB.do"><button class="btn btn-graph active" type="submit">연-결 남녀 회원 현황 비율 </button></a>
			<a href="${pageContext.request.contextPath}/_service/MemberStatus2_YB.do"><button class="btn btn-graph" type="submit">연-결 남녀 회원 연봉 분포</button></a>
			<a href="${pageContext.request.contextPath}/_service/MemberStatus3_YB.do"><button class="btn btn-graph" type="submit">연-결 남녀 회원 연령 분포</button></a>
			<a href="${pageContext.request.contextPath}/_service/MemberStatus4_YB.do"><button class="btn btn-graph" type="submit">연-결 남녀 회원 학력 분포</button></a>
		</div>
	
    	
	    <!-- Resources -->
		<script src="https://www.amcharts.com/lib/4/core.js"></script>
		<script src="https://www.amcharts.com/lib/4/charts.js"></script>
		<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
		
		<!-- 데이터 시각화 구현 -->
		<script>
		am4core.ready(function() {
		
		// Themes begin
		// Themes end
		
		// create chart
		var chart = am4core.create("chartdiv", am4charts.GaugeChart);
		chart.hiddenState.properties.opacity = 0;
		
		var axis = chart.xAxes.push(new am4charts.ValueAxis());
		axis.min = 0;
		axis.max = 100;
		axis.strictMinMax = true;
		axis.renderer.inside = true;
		//axis.renderer.ticks.template.inside = true;
		//axis.stroke = chart.colors.getIndex(3);
		axis.renderer.radius = am4core.percent(97);
		//axis.renderer.radius = 80;
		axis.renderer.line.strokeOpacity = 1;
		axis.renderer.line.strokeWidth = 5;
		axis.renderer.line.stroke = chart.colors.getIndex(1);
		axis.renderer.ticks.template.disabled = false
		axis.renderer.ticks.template.stroke = chart.colors.getIndex(1);
		axis.renderer.labels.template.radius = 35;
		axis.renderer.ticks.template.strokeOpacity = 1;
		axis.renderer.grid.template.disabled = true;
		axis.renderer.ticks.template.length = 10;
		axis.hiddenState.properties.opacity = 1;
		axis.hiddenState.properties.visible = true;
		axis.setStateOnChildren = true;
		axis.renderer.hiddenState.properties.endAngle = 180;
		axis.renderer.labels.template.adapter.add("text", function(text) {
			  return text + "(%)";
			});
		
		var axis2 = chart.xAxes.push(new am4charts.ValueAxis());
		axis2.min = 0;
		axis2.max = 100;
		axis2.strictMinMax = true;
		
		axis2.renderer.line.strokeOpacity = 1;
		axis2.renderer.line.strokeWidth = 5;
		axis2.renderer.line.stroke = chart.colors.getIndex(3);
		axis2.renderer.ticks.template.stroke = chart.colors.getIndex(3);
		
		axis2.renderer.ticks.template.disabled = false
		axis2.renderer.ticks.template.strokeOpacity = 1;
		axis2.renderer.grid.template.disabled = true;
		axis2.renderer.ticks.template.length = 10;
		axis2.hiddenState.properties.opacity = 1;
		axis2.hiddenState.properties.visible = true;
		axis2.setStateOnChildren = true;
		axis2.renderer.hiddenState.properties.endAngle = 180;
		axis2.renderer.labels.template.adapter.add("text", function(text) {
			  return text + "(%)";
			});
		

		var hand = chart.hands.push(new am4charts.ClockHand());
		hand.fill = axis.renderer.line.stroke;
		hand.stroke = axis.renderer.line.stroke;
		hand.axis = axis;
		hand.pin.radius = 10;
		hand.startWidth = 10;
		
		var hand2 = chart.hands.push(new am4charts.ClockHand());
		hand2.fill = axis2.renderer.line.stroke;
		hand2.stroke = axis2.renderer.line.stroke;
		hand2.axis = axis2;
		hand2.pin.radius = 10;
		hand2.startWidth = 10;
		
		setInterval(function() {
		  hand.showValue(${jsonListm} == 0? 0: (${jsonListm}/(${jsonListm}+${jsonListw})*100));
		  label.text = Math.round(hand.value).toString();
		  hand2.showValue(${jsonListw} == 0? 0: (${jsonListw}/(${jsonListm}+${jsonListw})*100));
		  label2.text = Math.round(hand2.value).toString();
		}, 2000);
		
		var legend = new am4charts.Legend();
		legend.isMeasured = false;
		legend.y = am4core.percent(100);
		legend.verticalCenter = "bottom";
		legend.parent = chart.chartContainer;
		legend.data = [{
		  "name": "연-결 남자 회원비율(%)",
		  "fill": chart.colors.getIndex(1)
		}, {
		  "name": "연-결 여자 회원비율(%)",
		  "fill": chart.colors.getIndex(3)
		}];
		
		legend.itemContainers.template.events.on("hit", function(ev) {
		  var index = ev.target.dataItem.index;
		
		  if (!ev.target.isActive) {
		    chart.hands.getIndex(index).hide();
		    chart.xAxes.getIndex(index).hide();
		    labelList.getIndex(index).hide();
		  }
		  else {
		    chart.hands.getIndex(index).show();
		    chart.xAxes.getIndex(index).show();
		    labelList.getIndex(index).show();
		  }
		});
		
		var labelList = new am4core.ListTemplate(new am4core.Label());
		labelList.template.isMeasured = false;
		labelList.template.background.strokeWidth = 5;
		labelList.template.fontSize = 25;
		labelList.template.padding(10, 20, 10, 20);
		labelList.template.y = am4core.percent(50);
		labelList.template.horizontalCenter = "middle";
		
		var label = labelList.create();
		label.parent = chart.chartContainer;
		label.x = am4core.percent(40);
		label.background.stroke = chart.colors.getIndex(1);
		label.fill = chart.colors.getIndex(1);
		label.text = "0(%)";
		
		var label2 = labelList.create();
		label2.parent = chart.chartContainer;
		label2.x = am4core.percent(60);
		label2.background.stroke = chart.colors.getIndex(3);
		label2.fill = chart.colors.getIndex(3);
		label2.text = "0(%)";
		
		
		}); // end am4core.ready()
		</script>
		
		<!-- 그래프를 표시할 위치 -->
		<div id="chartdiv"></div>

	</div>
	</div>
		<!-- 가운데(내용) 영역 끝 -->


	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>