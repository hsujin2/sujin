<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="userLogin" value="${sessionScope.login}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘의 칼로리</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css" />
<link rel="stylesheet" type="text/css" href="resources/css/todaykcal/todaykcal_css.css" />
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<!-- amCharts javascript sources -->
<script type="text/javascript" src="http://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript" src="http://www.amcharts.com/lib/3/serial.js"></script>
<script type="text/javascript" src="http://www.amcharts.com/lib/3/plugins/export/export.js"></script>
<link rel="stylesheet" href="http://www.amcharts.com/lib/3/plugins/export/export.css">

<script>
   window.onload=function foodListAll(){
      var foodList = $("#foodList");
      $.ajax({
         url : "/mommefatale/todayKcal.json",
         type : "POST",
         async : false,
         success : function(response){
            var foodlist = response.vo;
            if(foodlist != null){
               if(foodlist.length != 0 ){
                  var table = $("<tbody>",{id:'foodList'});
                   for(var i =0; i<foodlist.length; i++){
                      var tr = $("<tr>");
                      tr.append($("<td>").append($('<input>',{type:"hidden",value:foodlist[i].food_no,name:"no"})));
                      tr.append($("<td>",{text:foodlist[i].food_category,name:'category'}));
                      tr.append($("<td>",{text:foodlist[i].food_name,name:'name'}));
                      tr.append($("<td>",{text:foodlist[i].food_gram,name:'gram'}));
                      tr.append($("<td>",{text:foodlist[i].food_kcal,name:'kcal'}));
                      tr.append($('<td>').append($('<input type="image" src="resources/images/board/Plus-icon.gif" value="+" class="addBtn" onclick="moveToMyList(this)">').css("width","18px")));
                      table.append(tr);
                   }
                   $("#foodList").replaceWith(table);
               }
            }
         },
         error : function(request, status, error){
            if(request.status != '0'){
               alert("code : "+request.status +"\r\nmessage : "
                           + request.reponseText + "\r\nerror : " + error);
            }
         }
      })
   }
  /* amChart */ 
   var kcalRecord;
   var member_id = "${userLogin.userid}";
   $.ajax({
      url : "/mommefatale/myKcal.json",
      type : "POST",
      data : {'member_id' : member_id },
      async : false,   
      success : function(response){
    	  kcalRecord = response.kcalRecord;
      },
      error : function(){
         alert("가져올 칼로리 기록이 없습니다.")
      }
   })

	AmCharts.makeChart("chartdiv",
		{
			"type": "serial",
			"angle": 20,
			"depth3D": 20,
			"dataProvider": kcalRecord,
			"categoryField": "kcal_regdate",
			"colors": [
				"#3399FF"
			],
			"startDuration": 1,
			"export": {
				"enabled": true
			},
			"categoryAxis": {
				"gridPosition": "start"
			},
			"trendLines": [],
			"graphs": [
				{
					"balloonText": "kcal : [[value]]",
					"fillAlphas": 1,
					"id": "AmGraph-1",
					"title": "kcal",
					"type": "column",
					"valueField": "kcal_today"
				}
			],
			"guides": [],
			"valueAxes": [
				{
					"id": "ValueAxis-1",
					"title": "kcal"
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
					"text": "나의 칼로리 기록"
				}
			]
		}
	); 
</script>   
<script>      
   function searchFoodByName(){
      var food_name = $("input[name='food_name']").val();
      var foodList = $("#foodList");
      $.ajax({
         url : "/mommefatale/todayKcal.json",
         type : "POST",
         data : {'food_name' : food_name},
         async : false,   
         success : function(response){
          var foodlist = response.vo;
          if(foodlist != null){
             if(foodlist.length != 0 ){
               var table = $("<tbody>",{id:'foodList'});
                for(var i =0; i<foodlist.length; i++){
                   var tr = $("<tr>");
                   tr.append($("<td>").append($('<input>',{type:"hidden",value:foodlist[i].food_no,name:"no"})));
                   tr.append($("<td>",{text:foodlist[i].food_category,name:'category'}));
                   tr.append($("<td>",{text:foodlist[i].food_name,name:'name'}));
                   tr.append($("<td>",{text:foodlist[i].food_gram,name:'gram'}));
                   tr.append($("<td>",{text:foodlist[i].food_kcal,name:'kcal'}));
                   tr.append($('<td>').append($('<input type="image" src="resources/images/board/Plus-icon.gif" value="+" class="addBtn" onclick="moveToMyList(this)">').css("width","18px")));
                   table.append(tr);
                }
                
                $("#foodList").replaceWith(table);
                
             }else{
                alert("검색 결과가 존재하지 않습니다.\n유사한 음식으로 다시 검색해주세요.");
             }
          }
         },
         error : function(request, status, error){
            if(request.status != '0'){
               alert("code : "+request.status +"\r\nmessage : "
                           + request.reponseText + "\r\nerror : " + error);
            }
         }
      })
   }
   
   function searchFoodByCategory(){
      var food_category = $("select[name='food_category']").val();
      var foodList = $("#foodList");
      $.ajax({
         url : "/mommefatale/todayKcal.json",
         type : "POST",
         data : {'food_category' : food_category},
         async : false,   
         success : function(response){
          var foodlist = response.vo;
          if(foodlist != null){
             if(foodlist.length != 0 ){
               var table = $("<tbody>",{id:'foodList'});
                for(var i =0; i<foodlist.length; i++){
                   var tr = $("<tr>");
                   tr.append($("<td>").append($('<input>',{type:"hidden",value:foodlist[i].food_no,name:"no"})));
                   tr.append($("<td>",{text:foodlist[i].food_category,name:'category'}));
                   tr.append($("<td>",{text:foodlist[i].food_name,name:'name'}));
                   tr.append($("<td>",{text:foodlist[i].food_gram,name:'gram'}));
                   tr.append($("<td>",{text:foodlist[i].food_kcal,name:'kcal'}));
                   tr.append($('<td>').append($('<input type="image" src="resources/images/board/Plus-icon.gif" value="+" class="addBtn" onclick="moveToMyList(this)">').css("width","18px")));
                   table.append(tr);
                }
                $("#foodList").replaceWith(table);
             }
          }
         },
         error : function(request, status, error){
            if(request.status != '0'){
               alert("code : "+request.status +"\r\nmessage : "
                           + request.reponseText + "\r\nerror : " + error);
            }
         }
      })
   }
</script>
<script>
var totalKcal = 0;

function moveToMyList(clickList){
   var tr = clickList.closest('tr');
   var food_no = $(tr).find("input[name='no']").val();
      var my_foodList = $("#my_foodList");
      $.ajax({
         url : "/mommefatale/todayKcal.json",
         type : "POST",
         data : {'food_no' : food_no},
         async : false,   
         success : function(response){
          var foodlist = response.vo;
          if(foodlist != null){
             if(foodlist.length != 0 ){
            	var span = $("<span>", {id:'todayMyKcal'});
                var table = $("<tbody>",{id:'my_foodList'});
                for(var i =0; i<foodlist.length; i++){
                   var tr = $("<tr>");
                   tr.append($("<td>",{text:foodlist[i].food_category,name:'category'}));
                   tr.append($("<td>",{text:foodlist[i].food_name,name:'name'}));
                   tr.append($("<td>",{text:foodlist[i].food_gram,name:'gram'}));
                   tr.append($("<td>",{text:foodlist[i].food_kcal,name:'kcal'}));
                   tr.append($('<td>').append($('<input type="image" src="resources/images/board/Minus-icon.gif" value="-" class="removeBtn" onclick="removeFromMyList(this)">').css("width","18px")));
                   table.append(tr);
                   var kcal = $("#todayMyKcal").text();
                   span.text(totalKcal = Number(kcal) + Number(foodlist[i].food_kcal));
                }
                $("#todayMyKcal").replaceWith(span);
                $("#my_foodList").append(tr);
             }
          }
         },
         error : function(request, status, error){
            if(request.status != '0'){
               alert("code : "+request.status +"\r\nmessage : "
                           + request.reponseText + "\r\nerror : " + error);
            }
         }
      })   
}

function removeFromMyList(clickList){
	var span = $("<span>", {id:'todayMyKcal'});
   $(clickList).closest('tr').remove();
   var kcal = $(clickList).closest('tr').find("td[name='kcal']").text();
   span.text(totalKcal = totalKcal - Number(kcal));
   $("#todayMyKcal").replaceWith(span);
}

function saveMyKcal(){
	var todayMyKcal = $("#todayMyKcal").text();
	var member_id =  $("#member_id").val();
	if(todayMyKcal == null || todayMyKcal == "" || todayMyKcal == 0){
		alert("오늘 먹은 음식의 칼로리를 기록해주세요");
		return;
	}else{	
	window.location="todayKcal.do?todayMyKcal="+todayMyKcal+"&member_id="+member_id;
	alert("오늘의 칼로리가 기록되었습니다.");
	}
}
</script>

</head>
<body>
   <div id="wrap">
      <%@ include file="../include/header.jsp"%>
      
      <div id="todayKcalWrap">
      
      
      <div class="board">
      
         <div class="searchFood">
         <label for="food_name">음식명</label>
         <input type="text" id="food_name" name="food_name"> <input
            type="image" src="resources/images/index/search_bl.gif" width="20px"
            onclick="searchFoodByName()">
         </div><!-- searchFood -->
         
         <div class="kcal_table">
         <table summary="food_kcal_list" id="food_list">
            <colgroup>
               <col width="0%">
               <col width="24%">
               <col width="35%">
               <col width="18%">
               <col width="18%">
               <col width="5%">
            </colgroup>
            <thead>
               <tr>
                  <th scope="col"><input type="hidden" id="food_no" name="food_no"></th>
                  <th scope="col"><select name="food_category" id="food_category" onchange="searchFoodByCategory()">
                                 <optgroup label="분류"></optgroup>
                                 <option value="">전체</option>
                                 <option value="견과">견과</option>
                                 <option value="과일">과일</option>
                                 <option value="과자">과자</option>
                                 <option value="국">국</option>
                                 <option value="떡">떡</option>
                                 <option value="면">면</option>
                                 <option value="반찬">반찬</option>
                                 <option value="밥">밥</option>
                                 <option value="분식">분식</option>
                                 <option value="빵">빵</option>
                                 <option value="아이스크림">아이스크림</option>
                                 <option value="음료">음료</option>
                                 <option value="죽">죽</option>
                                 <option value="찌개">찌개</option>
                                 <option value="패스트푸드">패스트푸드</option>
                                 </select></th>
                  <th scope="col">음식명</th>
                  <th scope="col">중량(g)</th>
                  <th scope="col">Kcal</th>
                  <th scope="col"></th>
               </tr>
            </thead>
            <tbody id="foodList">
            </tbody>
         </table>
         </div><!-- kcal_table -->
   
   		<div class="record">
      	<span class="recommendedKcal">${userLogin.name}님의 하루 권장섭취량</span>
      	<span class="recommendedKcal2">${userLogin.kcal} 칼로리</span>
      	<form action="todayKcal.do" method="get" name="todayKcalForm" id="todayKcalForm">
      	<span id="todayMyKcal">0</span>
      	<input type="hidden" id="member_id" name="member_id" value="${userLogin.userid}">
      	</form>
      	<input type="button" id="kcal_today" name="kcal_today" value="오늘의 칼로리 기록하기" onclick="saveMyKcal()">
      </div><!-- record -->
   
         <div class="my_kcal_table">
         <p id="todayMyMenu">나의 오늘 식단</p>
         <table summary="my_food_kcal_list" id="my_food_list">
            <colgroup>
               <col width="24%">
               <col width="35%">
               <col width="18%">
               <col width="18%">
               <col width="5%">
            </colgroup>
            <thead>
               <tr>
                  <th scope="col">분&nbsp;&nbsp;&nbsp;&nbsp;류</th>
                  <th scope="col">음식명</th>
                  <th scope="col">중량(g)</th>
                  <th scope="col">Kcal</th>
                  <th scope="col"></th>
               </tr>
            </thead>
            <tbody id="my_foodList">
            </tbody>
         </table>
         </div><!-- my_kcal_table -->
   </div><!-- board -->
   
    <!-- 이번주 칼로리 차트 -->
     <div id="chartdiv" style="width: 1000px; height: 300px; background-color: #FFFFFF;" ></div>
     
   </div><!-- todayKcalWrap -->
      <%@ include file="../include/footer.jsp"%>
   </div><!-- wrap -->
</body>
</html>