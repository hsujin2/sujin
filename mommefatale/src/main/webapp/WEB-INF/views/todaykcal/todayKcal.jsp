<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <c:set var="userLogin" value="${sessionScope.login}"/>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘의 칼로리</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>
function searchFood(){
		var food_name = $("input[name='food_name']").val();
		var foodList = $("#foodList");
		alert(food_name);
		$.ajax({
			url : "/mommefatale/todayKcal.json",
			type : "POST",
			data : {'food_name' : food_name},
			async : false,	
			success : function(response){
				alert("success");
			 var foodlist = response.vo;
			 if(foodlist != null){
				 if(foodlist.length != 0 ){
					var table = $("<tbody>",{id:'foodList'});
					 for(var i =0; i<foodlist.length; i++){
						 var tr = $("<tr>");
						 tr.append($("<td>",{text:foodlist[i].food_category}));
						 tr.append($("<td>",{text:foodlist[i].food_name}));
						 tr.append($("<td>",{text:foodlist[i].food_gram}));
						 tr.append($("<td>",{text:foodlist[i].food_kcal}));
						 table.append(tr);
					 }
					 
					 $("#foodList").replaceWith(table);
					 
				 }else{
					 foodList.append($("<tr><td>검색결과가 존재하지 않습니다.</td></tr>"));
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

function moveToMyList(){
	
}
</script>
</head>
<body>
<div id="wrap">
		<%@ include file="../include/header.jsp"%>
		<div class="recommendedKcal">
		권장섭취량 : ${userLogin.kcal} 칼로리
		</div>
		<div class="board">
			<h2 class="title">음식</h2>
			<input type="text" id="food_name" name="food_name">
			<input type="image" src="resources/images/index/search_bl.gif" width="20px" onclick="searchFood()">
			<table summary="food_kcal_list" id="food_list">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">분류</th>
						<th scope="col">음식명</th>
						<th scope="col">중량(g)</th>
						<th scope="col">Kcal</th>
						<th scope="col">추가</th>
					</tr>
				</thead>
				<tbody id="foodList">
				</tbody>
			</table>
		</div>
		<div id="footList">
			<c:if test="${paging.isPre()}">
				<a
					href="todayKcal.do?pageNum=${paging.getPage_Start()-paging.p_size}">[이전]</a>&nbsp;&nbsp;</c:if>
			<c:forEach var="counter" begin="${paging.getPage_Start()}"
				end="${paging.getPage_End()}">
				<c:if test="${paging.getCur_Page() eq counter}">[${counter}]
                     </c:if>
				<c:if test="${paging.getCur_Page() ne counter}">
					<a
						href="javascript:window.location='todayKcal.do?pageNum=${counter}'">[${counter}]</a>
				</c:if>
			</c:forEach>
			<c:if test="${paging.isNext()}">
				<a
					href="todayKcal.do?pageNum=${paging.getPage_Start()+paging.p_size}">[다음]</a>
			</c:if>

		</div>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>