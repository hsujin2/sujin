<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login_page</title>
<link rel="stylesheet" type="text/css" href="login_Css.css">
</head>

<body>
<div id="wrap">

<section>
	<div id="loginWrap">
    	<div id="member">
        	<h1>&bull;로그인</h1>
            <p>몸므파탈에 다양한 서비스를 이용하시려면 로그인 해주세요.</p>
            <p>회원가입 하시면 다양한 혜택을 드립니다.</p>
            <div id="loginArea">
            	<p><img src="images/logimg2.png" alt=""></p>
            	<form>
                	<ul>
                		<li><input type="text" name="userid" placeholder="아이디" required tabindex="1"></li>
                        <li><input type="password" name="userpass" placeholder="비밀번호" required></li>
                    </ul>
                    <input type="submit" id="logbtn" value="로그인">
                <hr>
                <div id="logbottom">
                	<span><a href="join.html">회원가입</a></span> 
                    <span class="findidpass">아이디 / 비밀번호 찾기</span>
                </div>
                </form>
            </div>
        </div>
    </div>
</section>

</div>
</body>
</html>