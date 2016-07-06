<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문내역</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/pay/paymentlist_css.css" />
<script type="text/javascript">
	jQuery(function($){
		$('#fromDate').on('change',function(){
		 $('#toDate').prop('min',$(this).val());
	});
	
		$('#toDate').on('change',function(){
		 $('#fromDate').prop('min',$(this).val());
	});
	});
</script>
</head>
<body>
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
				value="조회" class="but" />
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
		<c:forEach var="vo" items="${paymentlist }">
			<tr>
				<td class="firstline">${vo.order_date }<br />
				<a href="#"> [vo.order_no]</a></td>
				<td class="firstline"><img src="img/0050020000232.JPG"
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
	</table>

	</section>
</body>
</html>