<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<nav>
		<div><a href="itemlist.admin">상품관리</a></div>
		<div><a href="itemAdd.admin">상품등록</a></div>
	</nav>
<div id="admincontent" name="admincontent">
<c:choose>
<c:when test="${contents eq 'itemList'}">
<%@include file="../item/itemList.jsp" %>

</c:when>
<c:when test="${contents eq 'itemAdd'}">
<%@include file="../item/itemAdd.jsp" %>

</c:when>
</c:choose>
</div>
</body>
</html>