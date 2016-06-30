<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 중복확인</title>
<script type="text/javascript">
function searchDifferentId(){
	opener.document.getElementById('userid').focus();
	opener.document.getElementById('userid').value = '';
	self.close();
}

function focusMoveToPass(){
	opener.document.getElementById('userpass').focus();
	self.close();
}
</script>
</head>
<body>
<center>
${userid}<br><br>
<c:if test="${check eq -1}">
<b>사용가능한 ID 입니다.</b>
<input type="button" id="closeBtn" value="아이디 사용하기" onclick="focusMoveToPass()">
</c:if>
<c:if test="${check eq 1}">
<b>이미 존재하는 ID 입니다.</b>
<input type="button" id="closeBtn" value="다른 아이디 검색하기" onclick="searchDifferentId()">
</c:if>
</center>
</body>
</html>