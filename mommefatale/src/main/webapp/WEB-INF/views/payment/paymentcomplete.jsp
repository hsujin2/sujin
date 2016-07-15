<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제완료</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css" />
<link rel="stylesheet" type="text/css" href="resources/css/pay/paymentcomplete_css.css" />
</head>
<body>
	<div id="wrap">
		<%@ include file="../include/header.jsp"%>
		<section class="content">
		<div class="ment">
			구매하신 상품의 결제가 <span class="col">예약</span>되었습니다.
		</div>
		<table class="info" cellpadding="1" cellspacing="0" border="1px">
			<tr>
				<td class="bgcol" width="30%">입금금액</td>
				<td class="rcol" width="70%"><span class="col2">${totalpay}원</span></td>
			</tr>
			<tr>
				<td class="bgcol">입금은행</td>
				<td class="rcol">${bank }</td>
			</tr>
			<tr>
				<td class="bgcol">계좌번호</td>
				<td class="rcol">${account }</td>
			</tr>
		</table>
		</section>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>