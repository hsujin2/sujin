<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <c:set var="userLogin" value="${sessionScope.login}"/>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문내역</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/pay/paymentlist_css.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	jQuery(function($){
		$('#fromDate').on('change',function(){
		 $('#toDate').prop('min',$(this).val());
	});
	
		$('#toDate').on('change',function(){
		 $('#fromDate').prop('min',$(this).val());
	});
	});
	function searchDate(){
		var fromDate = $("#fromDate").val();
		var toDate = $("#toDate").val();
		$.ajax({
			url : "/mommefatale/paymentdatelist.json",
			type : "POST",
			data : {'fromDate' : fromDate, 'toDate' : toDate},
			async : false,
			
			success : function(response){
				alert("success");
				var paylist = response.paymentdatelist;
				if(paylist != null){
					if(paylist.length != 0){
						var paytbody = $("<tbody>",{id:'paymentlist'});
						 for(var i=0; i<paylist.length; i++){
							 var tr = $("<tr>");
							 tr.append($("<td>",{text:paylist[i].order_date}).attr("class","firstline").append($("<br>")).append($("<a>",{text:"주문번호 : "+paylist[i].order_no})));
							 tr.append($("<td>").attr("class","firstline").append($("<img>").attr("src","/mommefatale/resources/images/uploadimg/"+paylist[i].image).css("height","100px")));
							 tr.append($("<td>",{text:paylist[i].item_name}).attr("class","qqq").append($("<br>"),$("<br>"),"옵션 : ",paylist[i].size));
							 tr.append($("<input>").attr("type","hidden").attr("name","item_no").attr("value",paylist[i].item_no));
							 tr.append($("<td>",{text:paylist[i].price}).append("원").attr("class","firstline"));
							 tr.append($("<td>",{text:paylist[i].count}).append("개").attr("class","firstline"));
							 tr.append($("<td>",{text:paylist[i].state}).attr("class","firstline"));
							 paytbody.append(tr);
						 }
						 $("#paymentlist").replaceWith(paytbody);
					}else{
						alert("검색결과 없음");
					}
				}
			},
			error : function(){
				alert("주문내역조회 오류")
			}
		})
	}
</script>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<section class="content">
	<div class="subject">주 문 내 역 조 회</div>

	<div class="cal">
		<table class="month" cellpadding="1" cellspacing="0" border="1px">
			<tr>
				<td><a href="#">오늘</a></td>
				<td><a href="#">일주일</a></td>
				<td><a href="#">1개월</a></td>
				<td><a href="#">3개월</a></td>
				<td><a href="#">6개월</a></td>
			</tr>
		</table>
		<div class="calen">
			<label for="fromDate">날짜</label> <input type="date" id="fromDate"
				size="1px" required="" /> <label for="toDate">~</label> <input
				type="date" id="toDate" required="" /> <input type="button"
				value="조회" class="but" onclick="searchDate()">
		</div>
	</div>
	<br />
	<br />



	<ul class="war">
		<li>기본적으로 최근 3개월간의 자료가 조회되고, 기간검색시 지난 주문내역을 조회하실 수 있습니다.</li>
		<li>주문번호를 클릭하시면 해당 주문에대한 상세내역을 확인하실수 있습니다.</li>
	</ul>
	<div class="list">주문 상품 정보</div>
	<table class="menu">

		<tr id="menu2">
			<td width="100px" class="firstline"><span class="aaaa"><strong>주문일자<br />
						[주문번호]
				</strong></span></td>
			<td width="100px" class="firstline"><span class="aaaa"><strong>이미지</strong></span></td>
			<td width="350px" class="firstline"><span class="aaaa"><strong>상품정보</strong></span></td>
			<td width="70px" class="firstline"><span class="aaaa"><strong>판매가</strong></span></td>
			<td class="firstline"><span class="aaaa"><strong>수량</strong></span></td>
			<td class="firstline"><span class="aaaa"><strong>주문처리상태</strong></span></td>
			<td class="firstline"><span class="aaaa"><strong>취소/교환/반품</strong></span></td>

		</tr>
	
	<tbody class="menu" id="paymentlist" name="paymentlist">
		<c:forEach var="vo" items="${paymentlist }">
			<tr>
				<td class="firstline">${vo.order_date }<br />
				<a href="#">주문번호 : ${vo.order_no }</a></td>
				<td class="firstline"><img src="/mommefatale/resources/images/uploadimg/${vo.image}"
					height="100px" /></td>
				<td class="qqq">${vo.item_name } <br /><input type="hidden" name="item_no" value="${vo.item_no }">
				<br />옵션 : ${vo.size }
				</td>
				<td class="firstline">${vo.price }원</td>
				<td class="firstline">${vo.count }개</td>
				<td class="firstline">${vo.state }</td>
				<td class="firstline"><a href="#">[상세정보]</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	</section>
<%@ include file="../include/footer.jsp" %>
</body>
</html>