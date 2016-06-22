<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
</head>
<body>
<header id="header">
    <ul class="util_left">
		<li><a href="#">gallery</a></li> 
        <li><a href="#">community</a></li> 
        <li><a href="#">Q&amp;A</a></li> 
        <li><a href="#">sitemap</a></li> 
    </ul>
    <ul class="util_right">    
        <li><a href="#">join</a></li> 
        <li><a href="#">login</a></li>
        <li><a href="#">mypage</a></li> 
        <li><a href="#" onClick="addBookmark()">bookmark</a></li>
  </ul>
     <h1><img src="resources/images/index/logo.png" alt="몸므파탈로고" id="logo"/></h1>
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