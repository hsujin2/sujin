<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="userLogin" value="${sessionScope.login}"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
</head>
<body>
<header id="header">
   <div id="util">
    <ul class="util_left">
		<li><a href="#">gallery</a></li> 
        <li><a href="communityBoard.do">community</a></li> 
        <li><a href="#">Q&amp;A</a></li> 
        <li><a href="#">sitemap</a></li> 
    </ul>
    
    <ul class="util_right">
    <c:choose>
   		<c:when test="${admin eq false}">  
	        <li> ${userLogin.getName()}님 환영합니다</li> 
	        <li><a href="mypage.do">mypage</a></li> 
	        <li><a href="logout.do">logout</a></li>
	    </c:when>
	    <c:when test="${admin eq true}">
	    	<li>관리자</a></li> 
	        <li><a href="#">adminpage</a></li> 
	        <li><a href="logout.do">logout</a></li>
	    </c:when>
	    <c:otherwise>
	    	<li><a href="joinagreement.do">join</a></li> 
	        <li><a href="login.do">login</a></li>
	    </c:otherwise>
    </c:choose>    
        <li><a href="#" onClick="addBookmark()">bookmark</a></li>
  </ul>
  </div>
     <h1><a href="index.do"><img src="resources/images/index/logo.png" alt="몸므파탈로고" id="logo"/></a></h1>
  <nav id="gnb">
     <ul id="gnb_shop">
		<li><a href="#">Equipment</a>
        	<ul class="menu1">
            	<li><a href="#">런닝머신</a></li>
                <li><a href="#">웨이트기구</a></li>
                <li><a href="#">헬스사이클</a></li>
                <li><a href="#">아령/덤벨</a></li>
                <li><a href="#">기타</a></li>
           </ul>
        </li>        
        <li><a href="#">SportsWear</a>
        	<ul class="menu2">
            	<li><a href="#">운동복</a></li>
                <li><a href="#">운동화/런닝화</a></li>
                <li><a href="#">스포츠브라</a></li>
                <li><a href="#">기타</a></li>
           </ul>
        </li> 
        <li><a href="#">Food</a>
        	<ul class="menu3">
            	<li><a href="#">보충제</a></li>
                <li><a href="#">영양제</a></li>
                <li><a href="#">기타식품</a></li>
           </ul> 
        </li> 
    </ul>
    <ul id="gnb_content">    
        <li><a href="#">HealthCare</a></li> 
        <li><a href="#">Bulk-up</a></li> 
        <li><a href="#">Diet</a> </li>
    </ul>
  </nav>
     <form name="searchF" action="#" method="get" id="searchF">
    		<fieldset>
                <legend class="skip">검색</legend>
                <label for="sbox" class="skip">전체 검색어 입력</label>
                <input type="search" id="sbox">
              <input type="image" src="resources/images/index/search_bl.gif" alt="검색" id="simg">
    		</fieldset>
    </form>
</header>
</body>
</html>