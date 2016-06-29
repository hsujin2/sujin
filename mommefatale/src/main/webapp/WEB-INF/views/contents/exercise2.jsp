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
    	<h1>Diet</h1> 
        <a href="dietary.do"><img src="resources/images/contents/arrow-before-dietary.png" alt="before"/></a>
        <a href="exercise1.do"><img src="resources/images/contents/contents-banner.png" id="contentmain" alt="banner"/></a>
        <a href="recommended_products.do"><img src="resources/images/contents/arrow-next-product.png" alt="next" /></a>
    </div>
    
    
</div>


<div id="main_content">
		<div id="pageFor">
        	<h1>Exercise</h1>
    	</div>
        <div id="exercise_detail">
        	<img src="resources/images/contents/exercise_detail.png">
        </div>
       
        <div class="fix_button">
        <a href="#"><img src="resources/images/contents/setting_button.gif" alt="fixbutton"/></a>
        </div>
</div>

<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>