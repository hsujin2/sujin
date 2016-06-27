<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>몸므파탈(MommeFatale)</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/contents/contents_css.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css" />
	
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script src="contents/galleria/galleria-1.4.min.js"></script>

</head>


<body>
	<%@ include file="../include/header.jsp"%>
	<div id="wrapcontents">
		<div id="content_banner">
			<h1>Diet</h1>
			<a href="recommended_products.do"><img
				src="resources/images/contents/arrow-before-product.png"
				alt="before" /></a> <a href="dietary.do"><img
				src="resources/images/contents/contents-banner.png" id="contentmain"
				alt="banner" /></a> <a href="exercise1.do"><img
				src="resources/images/contents/arrow-next-exercise.png" alt="next" /></a>
		</div>


	</div>


	<div id="main_content">
		<div id="pageFor">
			<h1>Dietary</h1>
		</div>
		
		<div id="dietary">
			<a href="#"> <img src="resources/images/contents/dietary1.png"></a>&nbsp;&nbsp;&nbsp;
			<a href="#"> <img src="resources/images/contents/dietary2.png"></a>
		</div>

		
		<div class="galleria">
				<img src="resources/images/contents/dietary1.png">
				<img src="resources/images/contents/dietary1.jpg">
				<img src="resources/images/contents/dietary1.png">
				<img src="resources/images/contents/dietary1.jpg">
		</div>

		<script>
    		Galleria.loadTheme('galleria/themes/classic/galleria.classic.min.js');
    		Galleria.run('.galleria');
    	</script>
    	
		<div class="fix_button">
			<a href="#"><img src="resources/images/contents/setting_button.gif" alt="fixbutton" /></a>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>