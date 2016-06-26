<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 쿠폰</title>
</head>
<body>
	<div class="board">
		<table summary="내 쿠폰" id="user_coupon">
			<h2 class="coupontitle">내 쿠폰</h2>
			<colgroup>
				<col width="40%">
				<col width="10%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">쿠폰명</th>
					<th scope="col">금액</th>
					<th scope="col">발급일</th>
					<th scope="col">유효기간</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${count == 0 }">

					<tr>
						<td></td>
						<td></td>
						<td>보유한 쿠폰이 없습니다</td>
						<td></td>
					</tr>

				</c:if>
				<c:if test="${count != 0 }">
					<c:forEach var="coupon" items="${coupons}">
						<tr>
							<td>${coupon.name}</td>
							<td>${coupon.amount}</td>
							<td><fmt:formatDate value="${coupon.issuedate }" type="date"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${coupon.exdate}" type="date"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>

</body>
</html>