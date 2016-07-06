<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>몸므파탈(MommeFatale)</title>
<script src="resources/js/index/common_js.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css" />
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
	$(function() {
		$("#main_banner").animate({
			"opacity" : "0.5"
		}, 1000).animate({
			"opacity" : "1"
		}, 1000);
	});
</script>

</head>
<body>
	<div id="wrap">
		<%@ include file="include/header.jsp"%>
		<section>
		<div id="main_banner">
			<!--배너광고 -->
			<img src="resources/images/index/banner_index.png" alt="배너"
				class="main_bnimg" />
		</div>
		<div id="main_content">
			<h2>상품목록</h2>
			<ul class="item">
				<li><a href="#"><img
						src="resources/images/index/item01.png" alt="FORCE BLACK MASS" /></a></li>
				<li><a href="#"><img
						src="resources/images/index/item02.png" alt="leggings" /></a></li>
				<li><a href="#"><img
						src="resources/images/index/item03.png" alt="cable" /></a></li>
				<li><a href="#"><img
						src="resources/images/index/item04.png" alt="push-up bar" /></a></li>
				<li><a href="#"><img
						src="resources/images/index/item05.png" alt="ball" /></a></li>
			</ul>
			<h2>인기상품</h2>
			<ul class="item">
				<li><a href="#"><img
						src="resources/images/index/item07.png" alt="t-shirts" /></a></li>
				<li><a href="#"><img
						src="resources/images/index/item08.png" alt="jumploop" /></a></li>
				<li><a href="#"><img
						src="resources/images/index/item09.png" alt="dumbbel" /></a></li>
				<li><a href="#"><img
						src="resources/images/index/item10.png" alt="yoga mat" /></a></li>
				<li><a href="#"><img
						src="resources/images/index/item12.png" alt="treadmill" /></a></li>
			</ul>
		</div>
		<div id="main_board">
			<div class="notice">
				<h2 class="title">공지사항</h2>
				<ul>
					<c:forEach var="notice" items="${notice}" begin="0" end="5">
						<!-- 6개 보이도록 -->
						<li><span class="date">${notice.update_date}</span><a
							href="communityContent.do?no=${notice.no}">${notice.subject}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="popular">
				<h2 class="title">최신인기글</h2>
				<ul>
					<c:forEach var="community" items="${community}" begin="0" end="5">
						<!-- 6개 보이도록 -->
						<li><span class="date">${community.update_date}</span><a
							href="communityContent.do?no=${community.no}">${community.subject}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="todayMenu">
				<h2 class="title">나의 오늘 식단은?</h2>
				<c:if test="${userLogin ne null}">
					<img src="resources/images/index/todayMenu.jpg" alt="오늘의 식단"
						width="200px" onclick="window.location='todayKcal.do'">
				</c:if>
				<c:if test="${userLogin eq null}">
					<img src="resources/images/index/todayMenu.jpg" alt="오늘의 식단"
						width="200px" onclick="alert('로그인 후 이용해주세요')">
				</c:if>
			</div>
		</div>
		</section>

		<aside> </aside>

		<%@ include file="include/footer.jsp"%>

	</div>
</body>
</html>
