<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 완료</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
</head>
<body>
<div id="wrap">
<%@ include file="../include/header.jsp" %>
<h2 class="title">회원가입 완료</h2>
<div class="align_center">가입 기념 쿠폰이 발급되었습니다.</div>
<input type="button" onclick="location.href='login.do'" value="로그인하러가기">
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>