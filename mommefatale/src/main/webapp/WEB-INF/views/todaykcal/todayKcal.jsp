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

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<script>
   window.onload=function foodListAll(){
      var foodList = $("#foodList");
      $.ajax({
         url : "/mommefatale/todayKcal.json",
         type : "POST",
         async : false,
         success : function(response){
            var foodlist = response.vo;
            if(foodlist !=null){
               if(foodlist.length != 0 ){
                  var table = $("<tbody>",{id:'foodList'});
                   for(var i =0; i<foodlist.length; i++){
                      var tr = $("<tr>");
                      tr.append($("<td>").append($('<input>',{type:"hidden",value:foodlist[i].food_no,name:"no"})));
                      tr.append($("<td>",{text:foodlist[i].food_category,name:'category'}));
                      tr.append($("<td>",{text:foodlist[i].food_name,name:'name'}));
                      tr.append($("<td>",{text:foodlist[i].food_gram,name:'gram'}));
                      tr.append($("<td>",{text:foodlist[i].food_kcal,name:'kcal'}));
                      tr.append($('<td>').append($('<input type="button" value="+" class="addBtn" onclick="moveToMyList(this)">').css("width","18px")));
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
                   tr.append($('<td>').append($('<input type="button" value="+" class="addBtn" onclick="moveToMyList(this)">').css("width","18px")));
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
                   tr.append($('<td>').append($('<input type="button" value="+" class="addBtn" onclick="moveToMyList(this)">').css("width","18px")));
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
               var table = $("<tbody>",{id:'my_foodList'});
                for(var i =0; i<foodlist.length; i++){
                   var tr = $("<tr>");
                   tr.append($("<td>",{text:foodlist[i].food_category}));
                   tr.append($("<td>",{text:foodlist[i].food_name}));
                   tr.append($("<td>",{text:foodlist[i].food_gram}));
                   tr.append($("<td>",{text:foodlist[i].food_kcal}));
                   tr.append($('<td>').append($('<input type="button" value="-" class="removeBtn" onclick="removeFromMyList(this)">').css("width","18px")));
                   table.append(tr);
                }
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
   $(clickList).closest('tr').remove();
}
</script>

</head>
<body>
   <div id="wrap">
      <%@ include file="../include/header.jsp"%>
      <div id="todayKcalWrap">
      <span class="recommendedKcal">${userLogin.name}님의 하루 권장섭취량</span>
      <span class="recommendedKcal2">${userLogin.kcal} 칼로리</span>
      <span id="todayMyKcal"></span>
      <div class="board">
         <div class="searchFood">
         <label for="food_name">음식명</label>
         <input type="text" id="food_name" name="food_name"> <input
            type="image" src="resources/images/index/search_bl.gif" width="18px"
            onclick="searchFoodByName()">
         </div>
         <div class="kcal_table">
         <table summary="food_kcal_list" id="food_list">
            <colgroup>
               <col width="0%">
               <col width="22%">
               <col width="35%">
               <col width="19%">
               <col width="19%">
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
         </div>
      </div>
      <div class="board">   
         <div class="my_kcal_table">
         <table summary="my_food_kcal_list" id="my_food_list">
            <colgroup>
               <col width="22%">
               <col width="35%">
               <col width="19%">
               <col width="19%">
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
         </div>
   </div>
   </div>
      <%@ include file="../include/footer.jsp"%>
   </div>
</body>
</html>