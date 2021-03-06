<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>몸므파탈(MommeFatale)</title>
<link rel="stylesheet" type="text/css" href="resources/css/contents/contents_css.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
</head>


<body>
<div id="wrap">
<%@ include file="../include/header.jsp" %>
    <div id="wrapcontents">
    <div id="content_banner">
    	<h1>${category}</h1> 
        <a href="exercise1.do?category=${category}"><img src="resources/images/contents/arrow-before-exercise.png" alt="before"/></a>
        <a href="recommended_products.do?category=${category}"><img src="resources/images/contents/contents-banner.png" id="contentmain" alt="banner"/></a>
        <a href="dietary.do?category=${category}"><img src="resources/images/contents/arrow-next-dietary.png" alt="next" /></a>
    </div>
    
    
</div>


<div id="main_content">

		<div id="pageFor">
        	<h1>Recommended Products</h1>
    	</div>
    	<h2>equipment</h2>
    	<c:if test="${admin eq true}">
        <div class="fix_button">
        <a href="#"><img src="resources/images/contents/setting_button.gif" alt="fixbutton"/></a>
        </div>
        </c:if>
        <hr />
        <ul class="item">
        	<li><a href="#"><img src="resources/images/contents/eq1.png" alt="gimball"/> </a></li>
            <li><a href="#"><img src="resources/images/contents/eq2.png" alt="jumprope"/> </a></li>
            <li><a href="#"><img src="resources/images/contents/eq3.png" alt="cable"/> </a></li>
            <li><a href="#"><img src="resources/images/contents/eq4.png" alt="yoga mat"/> </a></li>            
        </ul>
    	<h2>sportsWear</h2>
        <hr />
    	<ul class="item">
        	<li><a href="#"><img src="resources/images/contents/spo1.png" alt="girl's top"/> </a></li>
            <li><a href="#"><img src="resources/images/contents/spo2.png" alt="men's top"/> </a></li>
            <li><a href="#"><img src="resources/images/contents/spo1.png" alt="girl's top"/> </a></li>
            <li><a href="#"><img src="resources/images/contents/spo2.png" alt="men's top"/> </a></li>            
        </ul>
    	<h2>food</h2>
        <hr />
        <ul class="item">
        	<li><a href="#"><img src="resources/images/contents/food.png" alt="gainer"/> </a></li>
            <li><a href="#"><img src="resources/images/contents/food.png" alt="gainer"/> </a></li>
            <li><a href="#"><img src="resources/images/contents/food.png" alt="gainer"/> </a></li>
            <li><a href="#"><img src="resources/images/contents/food.png" alt="gainer"/> </a></li>  
        </ul>
</div>

<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>