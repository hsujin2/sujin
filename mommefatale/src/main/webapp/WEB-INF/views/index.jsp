<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>몸므파탈(MommeFatale)</title>
<script src="js/common.js"></script>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
$(function(){
	$("#main_banner").animate({"opacity":"0.5"},1000).animate({"opacity":"1"},1000);
});
</script>

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
     <h1><img src="images/logo.png" alt="몸므파탈로고" id="logo"/></h1>
  <nav id="gnb">
     <ul>
		<li><a href="#">Equipment</a>
        	<ul class="menu1">
            	<li><a href="#">런닝머신</a></li>
                <li><a href="#">웨이트기구</a></li>
                <li><a href="#">헬스사이클</a></li>
                <li><a href="#">아령/덤벨</a></li>
                <li><a href="#">기타</a></li>
           </ul>
        </li>        
        <li><a href="#">SportWare</a>
        	<ul class="menu2">
            	<li><a href="#">운동복</a></li>
                <li><a href="#">신발</a></li>
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
              <input type="image" src="images/search_bl.gif" alt="검색" id="simg">
    		</fieldset>
    </form>
</header>
<section>
  <div id="main_banner">
    <!--배너광고 -->
    <img src="images/banner_index.png" alt="배너" class="main_bnimg" />
  </div>
  <div id="main_content">
  <h2>상품목록</h2>
   	<ul class="item">
    	<li><a href="#"><img src="images/item01.png" alt="FORCE BLACK MASS"/></a></li>
        <li><a href="#"><img src="images/item02.png" alt="leggings"/></a></li>
        <li><a href="#"><img src="images/item03.png" alt="cable"/></a></li>
        <li><a href="#"><img src="images/item04.png" alt="push-up bar"/></a></li>
    </ul>
  <h2>인기상품</h2>
   	<ul class="item">
    	<li><a href="#"><img src="images/item05.png" alt="ball"/></a></li>
        <li><a href="#"><img src="images/item06.png" alt="slevlesstop"/></a></li>
        <li><a href="#"><img src="images/item07.png" alt="mans t-shirts"/></a></li>
        <li><a href="#"><img src="images/item08.png" alt="jumploop"/></a></li>
    </ul>
    </div>
 <h2>공지사항</h2>
 <div></div>
 <h2>인기글</h2>
 <div></div>
</section>

<aside>
 
</aside>


<footer id="footer">
    <h1><img src="images/logo.png" alt="몸므파탈로고"id="footerlogo"></h1>
    <address>
        <p>몸므파탈</p>
        <p><span>대표 : 박현</span>&nbsp;&nbsp;&nbsp;<span>사업자등록번호 : 123-45-67890</span></p>
        <p><span>주소 : 서울시 성동구 왕십리</span>&nbsp;&nbsp;&nbsp;<span>Phone : 010-1234-5678</span>&nbsp;&nbsp;&nbsp;<span>E-mail : mommefatale@momme.com</span></p>	
        <p>Copyright &copy; 2016 MommeFatale All Rights Reserved.</p>			
    </address>
</footer>
</body>
</html>
