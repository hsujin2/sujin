<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>몸므파탈(MommeFatale)</title>
<script src="resources/js/index/common_js.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
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
<section>
  <div id="main_banner">
    <!--배너광고 -->
    <img src="resources/images/index/banner_index.png" alt="배너" class="main_bnimg" />
  </div>
  <div id="main_content">
  <h2>상품목록</h2>
   	<ul class="item">
    	<li><a href="#"><img src="resources/images/index/item01.png" alt="FORCE BLACK MASS"/></a></li>
        <li><a href="#"><img src="resources/images/index/item02.png" alt="leggings"/></a></li>
        <li><a href="#"><img src="resources/images/index/item03.png" alt="cable"/></a></li>
        <li><a href="#"><img src="resources/images/index/item04.png" alt="push-up bar"/></a></li>
        <li><a href="#"><img src="resources/images/index/item05.png" alt="ball"/></a></li>
    <!--<li><a href="#"><img src="resources/images/index/item06.png" alt="slevlesstop"/></a></li> -->
    </ul>
  <h2>인기상품</h2>
   	<ul class="item">
    	<li><a href="#"><img src="resources/images/index/item07.png" alt="t-shirts"/></a></li>
        <li><a href="#"><img src="resources/images/index/item08.png" alt="jumploop"/></a></li>
        <li><a href="#"><img src="resources/images/index/item09.png" alt="dumbbel"/></a></li>
        <li><a href="#"><img src="resources/images/index/item10.png" alt="yoga mat"/></a></li>
     <!--<li><a href="#"><img src="resources/images/index/item11.png" alt="big ball"/></a></li> -->  
        <li><a href="#"><img src="resources/images/index/item12.png" alt="treadmill"/></a></li>
    </ul>
 </div>
 <div id="main_board">
 	<div class="notice">
  	<h2 class="title">공지사항</h2>
	 	<ul>
				<li><span class="date">06-16</span><a href="#" >사이트 오픈 이벤트!!</a></li>
				<li><span class="date">06-15</span><a href="#" >가입인사글을 작성해주세요.</a></li>
				<li><span class="date">06-13</span><a href="#" >배송문의시 참고해주세요!</a></li>
				<li><span class="date">06-08</span><a href="#" >가장 효과적인 다이어트 방법</a></li>
				<li><span class="date">06-07</span><a href="#" >상품구입시 주의사항</a></li>
				<li><span class="date">05-31</span><a href="#" >회원가입을 축하드립니다.^^ </a></li>
		</ul>
	</div>
 	<div class="popular">
 	<h2 class="title">인기글</h2>
		<ul>
				<li><span class="date">06-16</span><a href="#" >운동을 시작하려고 하는데.. </a></li>
				<li><span class="date">06-15</span><a href="#" >다이어트 시작 마음이문제로다</a></li>
				<li><span class="date">06-13</span><a href="#" >어떻게 해야 돼죠??</a></li>
				<li><span class="date">06-08</span><a href="#" >친구랑 내기했는데...</a></li>
				<li><span class="date">06-07</span><a href="#" >애인이랑 헤어지고 살빼려구요..</a></li>
				<li><span class="date">05-31</span><a href="#" >여대생인데 치마 입는게 소원이에요</a></li>
		</ul>
	</div>
    </div>
</section>

<aside>
 
</aside>


<footer id="footer">
    <h1><img src="resources/images/index/logo.png" alt="몸므파탈로고"id="footerlogo"></h1>
    <address>
        <p>몸므파탈</p>
        <p><span>대표 : 박현</span>&nbsp;&nbsp;&nbsp;<span>사업자등록번호 : 123-45-67890</span></p>
        <p><span>주소 : 서울시 성동구 왕십리</span>&nbsp;&nbsp;&nbsp;<span>Phone : 010-1234-5678</span>&nbsp;&nbsp;&nbsp;<span>E-mail : mommefatale@momme.com</span></p>	
        <p>Copyright &copy; 2016 MommeFatale All Rights Reserved.</p>			
    </address>
</footer>
</body>
</html>
