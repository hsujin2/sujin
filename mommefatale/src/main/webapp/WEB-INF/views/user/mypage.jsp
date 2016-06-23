<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% request.getSession().getAttribute("login") %> --%>
<c:set var="userLogin" value="${sessionScope.login}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mypage</title>
</head>
<body>
	<div>mypage</div>
	<div>${userLogin.getName()} 님의 마이페이지</div>
	<div>${userLogin.getGrade() }</div>
</body>
</html>