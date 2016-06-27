<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품리스트</title>
</head>
<body>
<div id="itemwrapper">
	<div>
		<div id="smallMenu" align="left">
			<a href="javascript:window.location='productlist.admin'">전체상품</a>&nbsp;|&nbsp;
			<a href="javascript:window.location='productlist.admin?category=outer'">아우터</a>&nbsp;|&nbsp;
			<a href="javascript:window.location='productlist.admin?category=top'">상의</a>&nbsp;|&nbsp;
			<a href="javascript:window.location='productlist.admin?category=pants'">하의</a>&nbsp;|&nbsp;
			<a href="javascript:window.location='productlist.admin?category=acc'">악세사리</a>
			<input type="button" value="상품등록" onclick="location.href='productadd.admin'" />
		</div>
		<div id="items">
			<table style="width: 80%">
				<tr height="20px">
					<td align="center" bgcolor="black" width="33%"><font color="white"><b>사진</b></font></td>
					<td align="center" bgcolor="black" width="47%"><font color="white"><b>상품 이름</b></font></td>
					<td align="center" bgcolor="black" width="80px"><font color="white"><b>카테고리</b></font></td>
				</tr>
				<c:if test="${count == 0}">
					<tr>
						<td>등록된 상품이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${count != 0}">
					<c:forEach var="vo" items="${itemList}">
						<tr height="150px">
							<td align="center"><a href="#"><img src="../../res/uploadimg/${vo.main_pic}" alt="${vo.main_pic}" class="productImg"/></a></td>
							<td align="center"><a href="javascript:window.location='productmodifydel.admin?no=${vo.product_no}'">${vo.product_id}</a></td>
							<td align="center">${vo.product_category}</td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<td colspan="3" align="center">
						<c:if test="${bp.isPre()}"><a href="productlist.admin?pageNum=${bp.getPage_Start()-bp.p_size}&category=${category}">[이전]</a>&nbsp;&nbsp;</c:if>
						<c:forEach var="counter" begin="${bp.getPage_Start()}" end="${bp.getPage_End()}">
							<c:if test="${bp.getCur_Page() eq counter}">
								[${counter}]
							</c:if>
							<c:if test="${bp.getCur_Page() ne counter}">
								<a href="javascript:window.location='productlist.admin?pageNum=${counter}&category=${category}'">[${counter}]</a>
							</c:if>	
						</c:forEach>
						<c:if test="${bp.isNext()}">
							<a href="productlist.admin?pageNum=${bp.getPage_Start()+bp.p_size}&category=${category}">[다음]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

</body>
</html>