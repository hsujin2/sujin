<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="userLogin" value="${sessionScope.login}"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/item/item_css.css"/>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
 var grade = "${userLogin.getGrade()}";
 
	window.onload=function(){
		var price = "${item.price_discount}";
		var dis = 0;
		switch(grade){
		case "bronze" : dis = 0.03;
			break;
		case "silver" : dis = 0.05;
			break;
		case "gold" : dis = 0.07;
			break;
		case "diamond" : dis = 0.1;
			break;
		}
		
		if(dis==0){
			document.getElementById("savingTd").innerHTML = "최대 10%";
		}else{
		var saving = price * dis;
		document.getElementById("saving").value = saving;
		document.getElementById("savingTd").innerHTML = saving;
		
		}
		sum();
	}
	function sum(){
		var price = ${item.price_discount};
		$("#total").text((parseInt($("#quantity").val()) * parseInt(price))+"원");
	}
</script>
</head>
<body>
<section class="content">
	<div class="img1" ><img src="/mommefatale/resources/images/uploadimg/${item.main_img}" alt="item"/></div>
    <form action="payment.do" method="post" id="payFrom">
    <input type="hidden" name="no" value="${item.no}">
    <table class="table1">
    	<tr>
        	<td colspan="2" height="100px" class="bor">${item.name}</td>
        </tr>
    	<tr>
        	<td>판매가</td>
            <td class="align">${item.price_sales} 원</td>
        </tr>
        <tr>
        	<td>할인가</td>
            <td class="align">${item.price_discount} 원</td>
        </tr>
        <tr>
        	<td>적립금</td>
	        <td class="align" id="savingTd"><input type="hidden" id="saving" name="saving"></td>
        </tr>
        <c:choose>
        <c:when test="${item.category eq 1 || item.category eq 2 }">
        <tr>
        	<td>배송비</td>
            <td class="align">50000<input type="hidden" name="fee" value="50000"></td>
        </tr>
        </c:when>
        <c:otherwise>
        <tr>
        	<td>배송비</td>
            <td class="align">2500<input type="hidden" name="fee" value="2500"></td>
        </tr>
        </c:otherwise>
        </c:choose>     
        <tr>
        	<td>제조사</td>
            <td class="align">${item.brand }</td>
        </tr>
    </table>
    <table class="table2">
    	<tr>
        	<td>수량</td>
            <td><input type="number" name="quantity" id="quantity" min="1" max="99" value="1" onchange="sum()"> 개</td>
        </tr>
        <tr>
        	<td height="30px">사이즈</td>
            <td>
            <c:choose>
            <c:when test="${item.category eq 6 || item.category eq 8}">
            	<select class="wid">
            		<option value="XS">XS</option>
                    <option value="S">S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                    <option value="XL">XL</option>
                    <option value="XXL">XXL</option>
            	</select>
            </c:when>
            <c:when test="${item.category eq 7}">
            	<select class="wid">
            		<option value="230">230</option>
            		<option value="235">235</option>
            		<option value="240">240</option>
            		<option value="245">245</option>
            		<option value="250">250</option>
            		<option value="255">255</option>
            		<option value="260">260</option>
            		<option value="265">265</option>
            		<option value="270">270</option>
            		<option value="275">275</option>
            		<option value="280">280</option>
            	</select>
            </c:when>
            <c:otherwise>
            	없음
            </c:otherwise>
            </c:choose>
            </td>
        </tr>
    </table>
    <div class="table2">총 금액 <p id="total" align="right"></p></div>
    <ul class="but">
    	<li><a href="#"><div>BUY NOW</div></a></li>
        <li><a href="#"><div>ADD TO CART</div></a></li>
        <li><a href="#"><div>WISH LIST</div></a></li>
    </ul><br />
</form>
    <ul class="menu">
    	<li><a href="#">상품정보</a></li>
    	<li>|</li>
        <li ><a href="#">상품리뷰</a></li>
        <li class="i">|</li>
        <li><a href="#">상품문의</a></li>
        <li class="i">|</li>
        <li><a href="#">교환/반품/배송</a></li>
    </ul>
    <img src="img/detail.PNG" class="detail" />
</section>
</body>
</html>