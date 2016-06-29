<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품리스트</title>
<link rel="stylesheet" href="resources/css/equipment/running.css">
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
</head>
<body>
<div id="wrap">
<section class="contents">
<%@ include file="../include/header.jsp" %>
	<div id="itemwrapper">
		<div>
			<div class="items">
				<ul class="array">
					<li><a href="itemList.do?category=1&order=new">신상품</a></li>
					<li>|</li>
					<li><a href="itemList.do?category=1&order=quantity">인기순</a></li>
					<li>|</li>
					<li><a href="itemList.do?category=1&order=lowprice">낮은가격순</a></li>
					<li>|</li>
					<li><a href="itemList.do?category=1&order=highprice">높은가격순</a></li>
					<li>|</li>
					<li><a href="itemList.do?category=1&order=review">리뷰수</a></li>
				</ul>
				<br />
				<hr class="hr1" />
				<br />
				<h3 class="best">BEST상품</h3>
				<ul class="bestitem">
					<li><span><a href="#"><img src="img/980399_1.jpg" /></a></span>
						<a href="#"><span>파워런닝머신</span><br /> <span>체력 증진을 위한
								파워런닝머신</span> <br /> <span>1,339,000원</span></a></li>
					<li><span><a href="#"><img
								src="img/ORG-1800-B3.jpg" /></a></span> <a href="#"><span>파워런닝머신</span><br />
							<span>체력 증진을 위한 파워런닝머신</span> <br /> <span>1,339,000원</span></a></li>
					<li><span><a href="#"><img
								src="img/0050020000232.jpg" /></a></span> <a href="#"><span>파워런닝머신</span><br />
							<span>체력 증진을 위한 파워런닝머신</span> <br /> <span>1,339,000원</span></a></li>
					<li><span><a href="#"><img
								src="img/Contents_20121129113252_.jpg" /></a></span> <a href="#"><span>파워런닝머신</span><br />
							<span>체력 증진을 위한 파워런닝머신</span> <br /> <span>1,339,000원</span></a></li>
				</ul>
				<hr class="hr2" />
				<h3 class="best">전체 상품</h3>
				<ul class="allitem">
					<c:if test="${count == 0}">
						<ul>
							<li>등록된 상품이 없습니다.</li>
						</ul>
					</c:if>
					<c:if test="${count != 0}">
						<c:forEach var="item" items="${itemlist}">
							<li><span><a href="itemview.do?no=${item.no}"><img
										src="/mommefatale/resources/images/uploadimg/${item.main_img}"
										alt="${item.name}" class="itemImg" /></a></span><a href="#">
								<span class="itemname">${item.name}</span><br/>
								<hr class="hr3">
								<span>브랜드 : ${item.brand }</span><br>
								<span>원산지 : ${item.origin}</span> <br />
								<span class="sales">${item.price_sales}</span> <br />
								<span>${item.price_discount}</span></a>
							</li>
						</c:forEach>
					</c:if>
					
				</ul>
				<table class="paging">
					<tr>
						<td colspan="3" align="center"><c:if test="${paging.isPre()}">
								<a
									href="itemList.do?pageNum=${paging.getPage_Start()-paging.pageNavi}&category=${category}">[이전]</a>&nbsp;&nbsp;</c:if>
							<c:forEach var="counter" begin="${paging.getPage_Start()}"
								end="${paging.getPage_End()}">
								<c:if test="${paging.getCur_Page() eq counter}">
								[${counter}]
							</c:if>
								<c:if test="${paging.getCur_Page() ne counter}">
									<a
										href="javascript:window.location='itemList.do?pageNum=${counter}&category=${category}'">[${counter}]</a>
								</c:if>
							</c:forEach> <c:if test="${paging.isNext()}">
								<a
									href="itemList.do?pageNum=${paging.getPage_Start()+pagingNum.pageNavi}&category=${category}">[다음]</a>
							</c:if></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</section>
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>