<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div id="wrap">
<%@ include file="include/header.jsp" %>
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
			<c:forEach var="community" items="${community }">
	 			<li><span>${community.regdate}</span><a href="communityContent.do?no=${community.no}" >${community.subject}</a></li>
	 			</c:forEach>
			<!--<li><span class="date">06-16</span><a href="#" >운동을 시작하려고 하는데.. </a></li>
				<li><span class="date">06-15</span><a href="#" >다이어트 시작 마음이문제로다</a></li>
				<li><span class="date">06-13</span><a href="#" >어떻게 해야 돼죠??</a></li>
				<li><span class="date">06-08</span><a href="#" >친구랑 내기했는데...</a></li>
				<li><span class="date">06-07</span><a href="#" >애인이랑 헤어지고 살빼려구요..</a></li>
				<li><span class="date">05-31</span><a href="#" >여대생인데 치마 입는게 소원이에요</a></li>  -->
		</ul>
	</div>
    </div>
</section>

<aside>
 
</aside>

<%@ include file="include/footer.jsp" %>

</div>
</body>
</html>
