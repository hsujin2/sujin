<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 완료</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
<style type="text/css">
.contentt{width:1003px; margin:50px auto 500px;}
.mentt{width:555px; margin:0 auto; font-weight:bold; font-size:30px; color:#666; margin-top:40px;}
.col{color:#6CF;}

.info{width:700px; margin:0 auto; margin-top:50px; border-collapse: collapse; border:1px #CCC solid; border-top:2px solid black;
font-size:12px;}
.bgcol{background:#eee; border-left:1px white solid; color:#666;}
.rcol{border-right:1px white solid; font-weight:bold;}
.info td{padding:10px;}
.loginbtn{margin:20px auto;}
.loginbtn button{ background-color:#666; }
</style>
</head>
<body>
<div id="wrap">
<%@ include file="../include/header.jsp" %>
<section class="contentt">
		<div class="mentt">
			회원가입 완료<br>
			<span class="col">쿠폰이 발급 되었습니다.</span>
		</div>
		<table class="info" cellpadding="1" cellspacing="0" border="1px">
			<tr>
				<td class="bgcol" width="30%">가입 기념 쿠폰</td>
				<td class="rcol" width="70%"><span class="col2">2000원 할인</span></td>
			</tr>
		</table>
</section>
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>