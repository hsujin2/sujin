<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이트현황</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.0.0.js"></script>
<!-- amCharts javascript sources -->
		<script type="text/javascript" src="http://www.amcharts.com/lib/3/amcharts.js"></script>
		<script type="text/javascript" src="http://www.amcharts.com/lib/3/pie.js"></script>
		<script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/light.js"></script>
		<!-- amCharts javascript code -->
		<script type="text/javascript">
		
		window.onload=function(){
			var man;
			var woman; 
			
			$.ajax({
				url : "/mommefatale/genderStatus.json",
				type : "POST",
				async : false,
				success : function(response){
					var map = response.map;
					man = map.man;
					woman = map.woman;
					alert(map.man);
				},error : function(){
					alert("성별 통계 오류");
				}
			})
			AmCharts.makeChart("chartdiv",
				{
					"type": "pie",
					"balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
					"innerRadius": "40%",
					"colors": [
						"#68C5F7",
						"#FD9FF5"
					],
					"titleField": "category",
					"valueField": "column-1",
					"theme": "light",
					"allLabels": [],
					"balloon": {},
					"legend": {
						"enabled": true,
						"align": "center",
						"markerType": "circle"
					},
					"titles": [],
					"dataProvider": [
						{
							"category": "남자",
							"column-1": man
						},
						{
							"category": "여자",
							"column-1": woman
						}
					]
				}
			);
		}
		</script>
</head>
<body>
사이트현황
<div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
</body>
</html>