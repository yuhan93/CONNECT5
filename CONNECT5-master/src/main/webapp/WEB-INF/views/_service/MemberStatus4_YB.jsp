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
  width: 750px;
  height: 500px;
}

</style>


<meta charset="utf-8" />
<title>서비스 안내_멤버 현황(Service_MemberStatus4)</title>


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
			<a href="${pageContext.request.contextPath}/_service/MemberStatus_YB.do"><button class="btn btn-graph" type="submit">연-결 남녀 회원 현황 비율 </button></a>
			<a href="${pageContext.request.contextPath}/_service/MemberStatus2_YB.do"><button class="btn btn-graph" type="submit">연-결 남녀 회원 연봉 분포</button></a>
			<a href="${pageContext.request.contextPath}/_service/MemberStatus3_YB.do"><button class="btn btn-graph" type="submit">연-결 남녀 회원 연령 분포</button></a>
			<a href="${pageContext.request.contextPath}/_service/MemberStatus4_YB.do"><button class="btn btn-graph active" type="submit">연-결 남녀 회원 학력 분포</button></a>
		</div>
	
    	
		<!-- Resources -->
		<script src="https://www.amcharts.com/lib/4/core.js"></script>
		<script src="https://www.amcharts.com/lib/4/charts.js"></script>
		<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
		
		<!-- Chart code -->
		<script>
		am4core.ready(function() {
		
		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end
		
		// Create chart instance
		var chart = am4core.create("chartdiv", am4charts.XYChart3D);
		
		// Add data 
		chart.data = [{
		    "학력": "고등학교 졸업",
		    "NoOfEduLvM": ${jsonHighschoolM} == 0? 0: (${jsonHighschoolM}/(${jsonHighschoolM}+${jsonHighschoolW})*100),
		    "NoOfEduLvW": ${jsonHighschoolW} == 0? 0: (${jsonHighschoolW}/(${jsonHighschoolM}+${jsonHighschoolW})*100)
		}, {
		    "학력": "전문대 졸업(전문학사)",
		    "NoOfEduLvM": ${jsonCollegeM} == 0? 0: (${jsonCollegeM}/(${jsonCollegeM}+${jsonCollegeW})*100),
		    "NoOfEduLvW": ${jsonCollegeW} == 0? 0: (${jsonCollegeW}/(${jsonCollegeM}+${jsonCollegeW})*100)
		}, {
		    "학력": "대학교 졸업(학사)",
		    "NoOfEduLvM": ${jsonUniversityM} == 0? 0: (${jsonUniversityM}/(${jsonUniversityM}+${jsonUniversityW})*100),
		    "NoOfEduLvW": ${jsonUniversityW} == 0? 0: (${jsonUniversityW}/(${jsonUniversityM}+${jsonUniversityW})*100)
		}, {
		    "학력": "대학원 졸업(석사)",
		    "NoOfEduLvM": ${jsonGraduateSchoolM} == 0? 0: (${jsonGraduateSchoolM}/(${jsonGraduateSchoolM}+${jsonGraduateSchoolW})*100),
		    "NoOfEduLvW": ${jsonGraduateSchoolW} == 0? 0: (${jsonGraduateSchoolW}/(${jsonGraduateSchoolM}+${jsonGraduateSchoolW})*100)
		}, {
		    "학력": "대학원 졸업(박사)",
		    "NoOfEduLvM": ${jsonDoctoralM} == 0? 0: (${jsonDoctoralM}/(${jsonDoctoralM}+${jsonDoctoralW})*100),
		    "NoOfEduLvW": ${jsonDoctoralW} == 0? 0: (${jsonDoctoralW}/(${jsonDoctoralM}+${jsonDoctoralW})*100)
		}];
		
		// Create axes
		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "학력";
		categoryAxis.title.text = "연-결 학력별 남녀 회원 비율";
		categoryAxis.renderer.grid.template.location = 0;
		categoryAxis.renderer.minGridDistance = 30;
		categoryAxis.renderer.cellStartLocation = 0.1;
		categoryAxis.renderer.cellEndLocation = 0.9;
		
		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.title.text = "학력별 남녀 비율(%)";
		valueAxis.renderer.labels.template.adapter.add("text", function(text) {
		  return text + "(%)";
		});
		
		// Create series
		var series = chart.series.push(new am4charts.ColumnSeries3D());
		series.dataFields.valueY = "NoOfEduLvM";
		series.dataFields.categoryX = "학력";
		series.name = "남성회원";
		series.clustered = true;
		series.columns.template.tooltipText = "연-결 회원 비율 {category} (남성회원): [bold]{valueY}%[/]";
		series.columns.template.fillOpacity = 0.9;
		
		var series2 = chart.series.push(new am4charts.ColumnSeries3D());
		series2.dataFields.valueY = "NoOfEduLvW";
		series2.dataFields.categoryX = "학력";
		series2.name = "여성회원";
		series2.clustered = true;
		series2.columns.template.tooltipText = "연-결 회원 비율 {category} (여성회원): [bold]{valueY}%[/]";
		
		}); // end am4core.ready()
		</script>
		
		<!-- HTML -->
		<div id="chartdiv"></div>
		
	</div>
	</div>
		<!-- 가운데(내용) 영역 끝 -->


	<!-- 변경 사항 -->

	<jsp:include page="../assets/inc/footer.jsp" />
</body>
</html>
