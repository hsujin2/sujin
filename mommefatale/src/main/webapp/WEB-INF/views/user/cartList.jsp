<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
<link rel="stylesheet" type="text/css" href="resources/css/cart/cart_css.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script type="text/javascript">
	function checkboxArr(check,all){
		var form = document.cartListForm;
		var checkArr=[];
		if(all){
			$("input[name='cartCheck']").each(function(){
				checkArr.push($(this).val());
			});
			$("input[name='arr']").val(checkArr);
			
			if(checkArr.length == 0)
			{
				alert("선택된 상품이 없습니다.");
				return;
			}
		}else{
			$("input[name='cartCheck']:checked").each(function(){
				checkArr.push($(this).val());
			});
			$("input[name='arr']").val(checkArr);
			
			if(checkArr.length == 0)
			{
				alert("선택된 상품이 없습니다.");
				return;
			}
		}
		
		if(check){
			$(form).attr("action", "payment.do");
		}else{
			$(form).attr("action", "cartdelete.do");
		}
		form.submit();
	}
	function buynow(){
		
		$('input:checkbox[id="cartCheck"]').attr("checked",true);
	}
</script>
</head>
<body>
<div id="wrap">
<%@ include file="../include/header.jsp" %>
<section class="content">
    <div id="jaemok">
            <span id="jaemok">장바구니</span>
        </div>
        <div class="list">국내배송상품 주문내역</div><a class="back" href="#">이전페이지 <span class="co">▶</span></a><br />
    <form name="cartListForm" action="" method="post">
    <input type="hidden" name="arr" value="">
      <table class="menu">
      
        <tr class="menu2">
            <td width="50px"><span class="aaaa"><strong>선택</strong></span></td>
            <td width="100px"><span class="aaaa"><strong>이미지</strong></span></td>
            <td width="350px"><span class="aaaa"><strong>상품정보</strong></span></td>
            <td width="70px"><span class="aaaa"><strong>판매가</strong></span></td>
            <td><span class="aaaa"><strong>수량</strong></span></td>
            <td><span class="aaaa"><strong>적립금</strong></span></td>
            <td><span class="aaaa"><strong>배송비</strong></span></td>
            <td width="70px"><span class="aaaa"><strong>합계</strong></span></td>
            <td width="80px"></td>
        </tr>
       <c:forEach var="vo" items="${cartlist }">
        <tr class="itemlist">
            <td class="firstline"><input type="checkbox" name="cartCheck" class="checking" id="cartCheck" value="${vo.cart_no}"/> </td>
            <td class="firstline"><a href="itemview.do?no=${vo.item_no}"><img
										src="/mommefatale/resources/images/uploadimg/${vo.main_img}"
										alt="${vo.item_name}" class="itemImg" height="100px"/></a></td>
            <td class="itemname">${vo.item_name } <br /><br />옵션 : ${vo.item_size }</td>
            <td>${vo.item_discount }</td>
            <td>${vo.cart_count }</td>
            <td>${vo.saving}p</td>
            <td>${vo.fee}원</td>
            <td>${vo.item_discount*vo.cart_count }원</td>
            <td width="80" class="firstline2">
                <div class="but"><a href="javascript:buynow(this)" class="te">바로구매 ▶</a></div>
                <div class="but2"><a href="#" class="te2">삭제</a></div>
            </td>
        </tr>
       </c:forEach>
      </table>
      <c:if test="${cartlist.size()==0 }">
      	<div>등록된 상품이 없습니다</div>
      </c:if>
      <div class="all">
    <div class="no">
   	[기본배송]</div>
    <div class="total">
    상품구매금액 : <span class="col">${total}</span> + 배송비 : <span class="col">${fee}<input type="hidden" name="fee" value="${fee }"></span> = 합계 :<span class="col">${total+fee }</span>원</div>
    </div>
    <div class="cash">
        	<table id="cash" cellpadding="1" cellspacing="0" border="1px">
            	<tr>
                	<td>총 상품금액</td>
                    <td width="33%">총 배송비</td>
                    <td width="33%">결제예정금액</td>
                </tr>
                <tr>
                	<td><span class="siz">${total }원</span></td>
                    <td><span class="siz">${fee }원</span></td>
                    <td><span class="siz">=${total+fee }원</span></td>
                </tr>
            </table>            
        </div><br />

		<div class="buts">
            <a href="javascript:checkboxArr(true,true)" id="but1"><span class="but3">전체상품주문</span></a>
            <a href="javascript:checkboxArr(true,false)" id="but2"><span class="but4">선택상품주문</span></a>
            <a href="javascript:checkboxArr(false,false)" id="bu4"><span class="but4">선택상품삭제</span></a>
            <a href="#" id="but3"><span class="but5">쇼핑계속하기</span></a>
        </div>
        </form>
</section>
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>