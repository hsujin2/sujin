<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>email 중복확인</title>
<script type="text/javascript">
function useDifferentEmail(){
	opener.document.getElementById('useremail1').focus();
	opener.document.getElementById('useremail1').value = '';
	self.close();
}

function useEmail(){
	opener.document.getElementById('msms').focus();
	self.close();
}
</script>
</head>
<body>
<center>
${useremail}<br><br>
<c:if test="${check eq -1}">
<b>사용가능한 email 입니다.</b>
<input type="button" id="closeBtn" value="이메일 등록하기" onclick="useEmail()">
</c:if>
<c:if test="${check eq 1}">
<b>이미 존재하는 email 입니다.</b>
<input type="button" id="closeBtn" value="다시 입력하기" onclick="useDifferentEmail()">
</c:if>
</center>
</body>
</html>