<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>email 중복확인</title>
<script type="text/javascript">

</script>
</head>
<body>
<center>
${useremail}<br><br>
<c:if test="${check eq -1}">
<b>사용가능한 email 입니다.</b>
</c:if>
<c:if test="${check eq 1}">
<b>이미 존재하는 email 입니다.</b>
</c:if>
</center>
</body>
</html>