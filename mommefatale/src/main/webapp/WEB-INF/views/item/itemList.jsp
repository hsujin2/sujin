<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품리스트</title>
<link rel="stylesheet" type="text/css" href="resources/css/equipment/running.css">
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	window.onload=function(){
		var category = "${category}";
		$.ajax({
			url : "/mommefatale/bestitemlist.json",
			type : "POST",
			async : false,
			data : {'category' : category},
			success : function(response){
				var items = response.itemlist;
				if(items.length != 0){
					var ul = $("<ul>",{class:'bestitem',id:'bestitems'});
					 for(var i=0; i<items.length; i++){
						 var li = $("<li>");
						 li.append($("<span>").append($("<a>").attr("href","itemview.do?no="+items[i].no).append($("<img>",{src:'/mommefatale/resources/images/uploadimg/'+items[i].main_img, class:'itemname'}))));
						 var a = $("<a>",{href:'#'});
						 a.append($("<span>",{text:items[i].name}).append($("<br>")));
						 a.append($("<hr>",{class:'hr3'}));
						 a.append($("<span>",{text:'브랜드 : '+items[i].brand}).append($("<br>")));
						 a.append($("<span>",{text:'원산지 : '+items[i].origin}).append($("<br>")));
						 a.append($("<span>",{class:'sales',text:items[i].price_sales}).append($("<br>")));
						 a.append($("<span>",{text:items[i].price_discount}).append($("<br>")));
						 li.append(a);
						 ul.append(li)
					 }
					 $("#bestitems").replaceWith(ul);
				}else{
					alert("best 상품이 없음");
				}
			},
			error : function(){
				
			}
			
		})
	}
</script>
</head>
<body>
<div id="wrap">
<%@ include file="../include/header.jsp" %>
<section class="contents">
	<div id="itemwrapper">
		<div>
			<div class="items">
				<ul class="array">
					<li><a href="itemList.do?category=1&range=new">신상품</a></li>
					<li>|</li>
					<li><a href="itemList.do?category=1&range=pop">인기순</a></li>
					<li>|</li>
					<li><a href="itemList.do?category=1&range=low">낮은가격순</a></li>
					<li>|</li>
					<li><a href="itemList.do?category=1&range=high">높은가격순</a></li>
				</ul>
				<br />
				<hr class="hr1" />
				<br />
				<h3 class="besttitle">BEST상품</h3>
				<ul class="bestitem" id="bestitems">
					
				</ul>
				<div style="clear:both"></div>
				<hr class="hr2" />
				<h3 class="besttitle">전체 상품</h3>
				<ul class="allitem">
					<c:if test="${count == 0}">
						<ul>
							<li>등록된 상품이 없습니다.</li>
						</ul>
					</c:if>
					<c:if test="${count != 0}">
						<c:forEach var="item" items="${itemlist}">
							<li><span><a href="itemview.do?no=${item.no}">
										<img
										src="/mommefatale/resources/images/uploadimg/${item.main_img}"
										alt="${item.name}" class="itemImg" />
									  </a>
								</span>
								<a href="#">
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
									href="itemList.do?pageNum=${paging.getPage_Start()-paging.pageNavi}&category=${category}&range=${range}">[이전]</a>&nbsp;&nbsp;</c:if>
							<c:forEach var="counter" begin="${paging.getPage_Start()}"
								end="${paging.getPage_End()}">
								<c:if test="${paging.getCur_Page() eq counter}">
								[${counter}]
							</c:if>
								<c:if test="${paging.getCur_Page() ne counter}">
									<a
										href="javascript:window.location='itemList.do?pageNum=${counter}&category=${category}&range=${range}'">[${counter}]</a>
								</c:if>
							</c:forEach> <c:if test="${paging.isNext()}">
								<a
									href="itemList.do?pageNum=${paging.getPage_Start()+pagingNum.pageNavi}&category=${category}&range=${range}">[다음]</a>
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