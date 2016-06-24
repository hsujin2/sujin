<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="userLogin" value="${sessionScope.login}"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function passcheck(){
		
		var userpass = document.deleteForm.userpass.value;
		var dbpass = "${userLogin.getPassword()}";
		if(userpass==dbpass){
			return true;
		}else{
			alert("비밀번호가 틀렸습니다.");
			return false;
		}
	}
</script>
</head>
<body>
<center>
	<form method="post" action="userDeleteProc.do" name="deleteForm" onsubmit="return passcheck()">
		<input type="password" placeholder="비밀번호를 입력해 주세요" name="userpass"><br/>
		<input type="submit" value="탈퇴하기">
	</form>
</center>
</body>
</html>