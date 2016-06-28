<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품리스트</title>
</head>
<body>
<div id="itemwrapper">
	<div>
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
					<c:forEach var="item" items="${itemlist}">
						<tr height="150px">
							<td align="center"><a href="#"><img src="../../resources/images/uploadimg/${item.main_img}" alt="${item.main_img}" class="itemImg"/></a></td>
							<td align="center"><a href="javascript:window.location='itmeModifydel.admin?no=${item.no}'">${item.name}</a></td>
							<td align="center">${item.category}</td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<td colspan="3" align="center">
						<c:if test="${paging.isPre()}"><a href="itemList.do?pageNum=${paging.getPage_Start()-paging.pageNavi}&category=${category}">[이전]</a>&nbsp;&nbsp;</c:if>
						<c:forEach var="counter" begin="${paging.getPage_Start()}" end="${paging.getPage_End()}">
							<c:if test="${paging.getCur_Page() eq counter}">
								[${counter}]
							</c:if>
							<c:if test="${paging.getCur_Page() ne counter}">
								<a href="javascript:window.location='itemList.do?pageNum=${counter}&category=${category}'">[${counter}]</a>
							</c:if>	
						</c:forEach>
						<c:if test="${paging.isNext()}">
							<a href="itemList.do?pageNum=${paging.getPage_Start()+pagingNum.pageNavi}&category=${category}">[다음]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

</body>
</html>