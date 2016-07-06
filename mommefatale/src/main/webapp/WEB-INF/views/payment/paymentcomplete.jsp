<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제완료</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
</head>
<body>
<%@ include file="../include/header.jsp" %>
결제완료!
<div align="center">
<div>총 금액 : ${totalpay}</div>
<div>은행 : ${bank }</div>
<div>계좌 : ${account }</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>