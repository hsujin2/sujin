<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이트현황</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css" />
<script type="text/javascript" src="http://www.amcharts.com/lib/3/amcharts.js"></script>
		<script type="text/javascript" src="http://www.amcharts.com/lib/3/serial.js"></script>
		<script type="text/javascript" src="http://www.amcharts.com/lib/3/plugins/export/export.js"></script>
		<link rel="stylesheet" href="http://www.amcharts.com/lib/3/plugins/export/export.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.0.0.js"></script>
<style type="text/css">
#chartdiv{margin:125px auto;}
</style>
<script type="text/javascript">
window.onload=function(){
	var sales;
	$.ajax({
		url : "/mommefatale/salesStatus.json",
		type : "POST",
		async : false,
		success : function(response){
			sales = response.sales;
		},error : function(){
			alert("매출 통계 오류");
		}
	})
			AmCharts.makeChart("chartdiv",
				{
					"type": "serial",
					"dataProvider": sales,
					"categoryField": "this_week_total",
					"colors": [
						"#1497f6",
						"#cc0000"
					],
					"startDuration": 1,
					"color": "#1497F6",
					"fontSize": 13,
					"export": {
						"enabled": true
					},
					"categoryAxis": {
						"gridPosition": "start"
					},
					"trendLines": [],
					"graphs": [
						{
							"balloonText": "[[value]]원",
							"bullet": "round",
							"id": "AmGraph-1",
							"title": "이번주 매출",
							"valueField": "this_week_total"
						},
						{
							"balloonText": "[[value]]원",
							"bullet": "square",
							"id": "AmGraph-2",
							"title": "저번주 매출",
							"valueField": "last_week_total"
						}
					],
					"guides": [],
					"valueAxes": [
						{
							"id": "ValueAxis-1",
							"title": "총매출"
						}
					],
					"allLabels": [],
					"balloon": {},
					"legend": {
						"enabled": true,
						"useGraphSettings": true
					},
					"titles": [
						{
							"id": "Title-1",
							"size": 15,
							"text": "주단위 매출 현황"
						}
					]
				}
			);
}
		</script>
</head>
<body>
 <div id="wrap">
    <%@ include file="../include/header.jsp"%>
    <div id="chartdiv" style="width: 900px; height: 400px; background-color: #FFFFFF;" ></div>
 	<%@ include file="../include/footer.jsp"%>
 </div>


</body>
</html>