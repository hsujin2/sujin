<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dli">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>몸므파탈(MommeFatale)</title>
<script src="resources/js/index/common_js.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.0.0.js"></script>
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
		<div id="main_banner">
			<!--배너광고 -->
			<c:if test="${userLogin ne null}">
			<img src="resources/images/index/banner_index2.png" alt="배너"
				class="main_bnimg" onclick="window.location='todayKcal.do'" style="cursor: pointer;">
			</c:if>
			<c:if test="${userLogin eq null}">
			<img src="resources/images/index/banner_index2.png" alt="배너"
				class="main_bnimg" onclick="alert('로그인 후 이용해주세요')">
			</c:if>
		</div>
		<section>
		<div class="content">
    <div class="sub">이달의 <span class="col">C</span>hoice</div>
    <div class="sub2">나라면 당장 선택하겠어</div>
        <div class="newitem">
            <ul>
            <c:forEach var="item" items="${newitem}">
                <li width="33%">
                    <div class="group">
                        <div class="image"><a href="itemview.do?no=${item.no}"><img src="/mommefatale/resources/images/uploadimg/${item.main_img}" width="280" height="280" /></a></div>
                        <div class="ment">
                            <a href="itemview.do?no=${item.no}"><span class="col2">[신상품]</span><div class="item_name">[${item.name}]</div><span class="explain"><br>브랜드 : ${item.brand }<br>원산지 : ${item.origin}</span></a>
                        </div>
                        <div class="price">${item.price_discount}원</div>
                    </div>
                </li>
            </c:forEach>
            <div class="clear"></div>
            </ul>
        </div>
    <div class="best">
   	 	<div class="sub3"><span class="col3">BEST </span>PRODUCT</div>
    	<div class="sub4">쇼핑몰에서 엄선한 추천상품입니다.</div>
    </div>
            <ul class="bestitems">
            <c:forEach var="item" items="${bestitem}">
                <li width="25%">
                    <div class="group2">
                        <div class="image2"><a href="itemview.do?no=${item.no}"><img src="/mommefatale/resources/images/uploadimg/${item.main_img}" width="230" height="230" /></a></div>
                        <div class="ment2">
                            <a href="itemview.do?no=${item.no}"><div class="item_name">[${item.name}]</div><span class="explain"><br>브랜드 : ${item.brand }<br>원산지 : ${item.origin}</span></a>
                        </div>
                        <div class="price2">${item.price_discount}원</div>
                    </div>
                </li>
            </c:forEach>
            </ul>
        <div class="clear"></div>
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
		</div>
		</section>

		<aside> </aside>

		<%@ include file="include/footer.jsp"%>

	</div>
</body>
</html>
