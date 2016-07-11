<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="resources/css/login/login_css.css">
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
</head>

<body>
<div id="wrap">
<%@ include file="../include/header.jsp" %>
<section>
	<div id="loginWrap">
    	<div id="member">
        	<h1>로그인</h1>
            <p>몸므파탈에 다양한 서비스를 이용하시려면 로그인 해주세요.</p>
            <p>회원가입 하시면 다양한 혜택을 드립니다.</p>
            <div id="loginArea">
            	<p><img src="resources/images/login/logimg.png" alt="" height="285px"></p>
            	<form method="post" action="loginProc.do" id="loginForm">
                	<ul>
                		<li><input type="text" name="userid" placeholder="아이디" required tabindex="1"></li>
                        <li><input type="password" name="userpass" placeholder="비밀번호" required tabindex="2"></li>
                    </ul>
                    <input type="submit" id="logbtn" value="로그인">
                <hr>
                <div id="logbottom">
                	<span><a href="joinagreement.do">회원가입</a></span>
                    <span class="findidpass"><a href="searchId.do">아이디 찾기</a></span>
                    <span class="findidpass"><a href="searchPass.do">비밀번호 찾기</a></span>
                </div>
                </form>
            </div>
        </div>
    </div>
</section>
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>