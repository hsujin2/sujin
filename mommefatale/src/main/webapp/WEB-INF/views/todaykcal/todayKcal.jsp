<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘의 칼로리</title>
<script>
function searchFood(){
	
}

function moveToMyList(){
	
}
</script>
</head>
<body>
<div id="wrap">
		<%@ include file="../include/header.jsp"%>
		<div class="board">
			<h2 class="title">음식</h2>
			<input type="text" id="search_food">
			<input type="image" src="resources/images/index/search_bl.gif" onclick="searchFood()">
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
						<th scope="col">Kcal</th>
						<th scope="col">중량(g)</th>
						<th scope="col">추가</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${count == 0 }">
						<tr>
							<td></td>
							<td></td>
							<td>등록된 음식이 없습니다.</td>
							<td></td>
							<td></td>
						</tr>
					</c:if>
					<c:if test="${count != 0 }">
						<c:forEach var="vo" items="${vo}" varStatus="i">
							<tr>
								<td>${vo.food_category}</td>
								<td class="align_left">${vo.food_name}</td>
								<td>${vo.food_kcal}</td>
								<td>${vo.food_gram}</td>
								<td><input type="button" id="addBtn" onclick="moveToMyList()"></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<div id="footList">
			<c:if test="${paging.isPre()}">
				<a
					href="qnaBoard.do?pageNum=${paging.getPage_Start()-paging.p_size}">[이전]</a>&nbsp;&nbsp;</c:if>
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
					href="todayKcalBoard.do?pageNum=${paging.getPage_Start()+paging.p_size}">[다음]</a>
			</c:if>
	
	<div>
		권장섭취량 : ${userLogin.getMember_kcal} 칼로리
	</div>

		</div>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>