<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 검색 결과</title>
</head>
<body>
<c:if test="${check eq false}">
	<script type="text/javascript">
		alert("회원정보가 없습니다.");
		window.location="/searchId.do";
	</script>
</c:if>
<c:if test="${check eq true}">
고객님의 ID는 <strong>${id}</strong> 입니다.<br>
<a href="login.do">뒤로</a>
</c:if>
</body>
</html>