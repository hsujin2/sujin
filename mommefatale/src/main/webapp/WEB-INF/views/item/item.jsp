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
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
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
			saving = Math.floor(saving);
			document.getElementById("saving").value = saving;
			document.getElementById("savingTd").innerHTML = saving;
		}
		sum();
	}
	function sum(){
		var price = ${item.price_discount};
		$("#total").text((parseInt($("#count").val()) * parseInt(price))+"원");
	}
	
	
	function buychecklogin(){
	var check = ${login == null};
		if(check==true){
			alert("로그인 후 이용해주세요");
			window.location="login.do";
			return;
		}
		$("#payForm").submit();
	}
	
	function cartchecklogin(){
		var check = ${login == null};
			if(check==true){
				alert("로그인 후 이용해주세요");
				window.location="login.do";
				return;
			}
			alert("장바구니에 추가됐습니다");
			$("#payForm").attr("action", "cartInsert.do");
			$("#payForm").submit();
		}
	
	function wishchecklogin(){
		var check = ${login == null};
			if(check==true){
				alert("로그인 후 이용해주세요");
				window.location="login.do";
				return;
			}
			alert("위시리스트에 추가됐습니다");
			$("#payForm").attr("action", "wishInsert.do");
			$("#payForm").submit();
		}
</script>
</head>
<body>
<div id="wrap">
<%@ include file="../include/header.jsp" %>
<section class="content">
	<div class="img1" ><img src="/mommefatale/resources/images/uploadimg/${item.main_img}" alt="item"/></div>
    <form action="payment.do" method="post" id="payForm">
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
        	<td>적립금<input type="hidden" id="saving" name="saving" value="0"></td>
	        <td class="align" id="savingTd"></td>
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
            <td><input type="number" name="count" id="count" min="1" max="99" value="1" onchange="sum()"> 개</td>
        </tr>
        <tr>
        	<td height="30px">사이즈</td>
            <td>
            <c:choose>
            <c:when test="${item.category eq 6 || item.category eq 8}">
            	<select class="wid" id="size" name="size">
            		<option value="XS">XS</option>
                    <option value="S">S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                    <option value="XL">XL</option>
                    <option value="XXL">XXL</option>
            	</select>
            </c:when>
            <c:when test="${item.category eq 7}">
            	<select class="wid" id="size" name="size">
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
    	<li><a href="javascript:buychecklogin();"><div>BUY NOW</div></a></li>
        <li><a href="javascript:cartchecklogin();"><div>CART</div></a></li>
        <li><a href="javascript:wishchecklogin();"><div>WISH LIST</div></a></li>
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
    <img src="/mommefatale/resources/images/uploadimg/${item.content_img}" class="detail" />
    <div class="info">
		▶ 교환/반품 가능합니다.<br>
		▶ 배송정보<br>
		<p class="indent">
		배송기간 : 결제확인 후 3~5일 소요됩니다.(주말, 공휴일 제외, 제주/도서산간지역 1~2일 추가 소요예상)<br>
		*상품주문 시에 배송업체, 생산업체, 통관 문제 등으로 예기치 않게 품절, 지연 될 수 있습니다.</p>
		▶ 배송료<br>
		<p class="indent"> 
		스포츠웨어의 경우 30,000원 이상 구매 시 배송비(2,500원)는 무료이며, 도서지역 추가 배송비는 없습니다.<br>
		운동기구 등 부피가 큰 제품인 경우 배송비는 무게에 따라 차등 부과될 수 있으며 기본료는 50,000원 입니다.</p>
		▶ 택배회사<br>
		<p class="indent"> 
		CJ대한통운 (1588-1255) https://www.doortodoor.co.kr/main/index.jsp<p>
		▶ 교환/반품<br>
		 <p class="indent">교환/반품은 상품 수령일 포함 7일 이내에 마이 페이지에서 교환/반품 신청을 접수해 주시고 교환/반품 주소로 반송 상품을 보내주세요. <br>
		 재화의 내용이 표시,광고 내용과 다르거나 계약 내용이 다르게 이행된 경우 재화 수령일로부터 3개월 이내, <br>
		 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내 청약철회가 가능합니다.<br>
		 [ 교환반품이 불가능한 경우 ]<br>
		 - 고의로 상품을 훼손한 경우<br>
		 - 제품에 부착된 상품 텍(TAG)이 떼어졌거나 이미 사용된 흔적의 상품<br>
		 - 반송 시일을 지켜주지 못하셨을 경우<br>
		 * 더 궁금하신 사항은 Q&amp;A 반품/교환 방법 안내 참조<br>
		 </p>      
    </div>
</section>
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>