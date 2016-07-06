<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="userLogin" value="${sessionScope.login}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제화면</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
<link rel="stylesheet" type="text/css"
	href="resources/css/pay/pay_css.css" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	var tel = "${user.tel}";
	var tel1 = tel.substring(0,3);
	var tel2 = tel.substring(3,7);
	var tel3 = tel.substring(7,11);
	$(document).ready(function() {
		 $("select[name=tel1] option[value="+tel1+"]").attr("selected",true);
		 $("input[name=tel2]").val(tel2);
		 $("input[name=tel3]").val(tel3);
	$('#rcheck1').click(function () {
        $('#receivername').val($('#ordername:text').val()); 
        $('#receiverzip1').val($('#orderzip1:text').val()); 
        $('#receiverzip2').val($('#orderzip2:text').val()); 
        $('#receiveraddr1').val($('#orderaddr1:text').val()); 
        $('#receiveraddr2').val($('#orderaddr2:text').val());
        var otel1 = $('#ordertel1').val();
		$("select[id=receivertel1] option[value="+otel1+"]").attr("selected",true);
        $('#receivertel2').val($('#ordertel2:text').val()); 
        $('#receivertel3').val($('#ordertel3:text').val()); 
    });
	$('#rcheck2').click(function () {
        $('#receivername').val(""); 
        $('#receiverzip1').val(""); 
        $('#receiverzip2').val(""); 
        $('#receiveraddr1').val(""); 
        $('#receiveraddr2').val("");
        $("select[id=receivertel1] option[value="+"010"+"]").attr("selected",true);
        $('#receivertel2').val(""); 
        $('#receivertel3').val(""); 
    });
	
});
	function useDiscount(){
		var coupon_no = $("select[name='coupon']").val();
		var point = $("#usepoint").val();
		var total = "${total+fee}";
		$.ajax({
			url : "useDiscount.do",
			type : "POST",
			data : {coupon_no : coupon_no, total : total, point : point},
			cache : false,
			async : false,
			dataType : "text",
			
			success : function(response){
				var couponamount = response - total;
				var dis = Number(couponamount) + Number(point);
				$("span[name='discount']").html(dis);
				$("span[name='total_pay']").html(response);
				$("input[name='totalpay']").val(response);
			},
			error : function(request, status, error){
				if(request.status != '0'){
					alert("code : "+request.status +"\r\nmessage : "
			                  + request.reponseText + "\r\nerror : " + error);
				}
			}
		})
	}
	function payCheck(){
		var Form=document.payForm;
		if(Form.receivername.value=="" || Form.receiverzip1==""||Form.receiverzip2==""||Form.receiveraddr1==""||Form.receiveraddr2==""||Form.receivertel2==""||Form.receivertel3==""){
			alert("배송지 정보를 입력해주세요");
			return;
		}
		
		if(Form.confirm.checked){
			Form.submit();
		}else{
			alert("구매진행 동의에 체크해주세요");
			return;
		}
	}
</script>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<section class="content">
	<div id="jaemok">
		<span id="jaemok">결제</span>
	</div>
	<form action="paymentcomplete.do" method="POST" name="payForm" id="payForm">
	<input type="hidden" name="userid" value="${userLogin.getUserid()}">
	<div class="list"></div>
	<a class="back" href="#" onClick="history.back()">이전페이지 <span class="co">▶</span></a>
	<br />
	<table class="menu">
		
		<tr id="menu2">
			<td width="100px"><span class="aaaa"><strong>이미지</strong></span></td>
			<td><span class="aaaa"><strong>상품정보</strong></span></td>
			<td width="70px"><span class="aaaa"><strong>판매가</strong></span></td>
			<td width="70px"><span class="aaaa"><strong>수량</strong></span></td>
			<td width="70px"><span class="aaaa"><strong>적립금</strong></span></td>
			<td width="70px"><span class="aaaa"><strong>배송비</strong></span></td>
			<td width="70px"><span class="aaaa"><strong>합계</strong></span></td>
		</tr>
		
		<c:forEach var="vo" items="${item}" varStatus="i">
		<tr id="menu3">
			<td class="firstline"><img src="/mommefatale/resources/images/uploadimg/${vo.main_img}"
				height="100px" /></td>
			<td class="qqq">${vo.name } <br />
			<br />옵션 : ${size.get(i.index)}
			</td>
			<td>${vo.price_discount }원</td>
			<td>${count.get(i.index)} 개</td>
			<td>${saving.get(i.index)}p</td>
			<td>${fee}원</td>
			<td>${vo.price_discount*count.get(i.index)+fee} 원</td> 
		<tr>
		</c:forEach>
	</table>
	
	<div class="all">
		<div class="no">[기본배송]</div>
		<div class="total">
			상품구매금액 : <span class="col">${total}</span> + 배송비 <span class="col">${fee}</span>
			= 합계 :<span class="col">${total+fee}</span>
		</div>
	</div>
	<!-- --------------------------------------------------------------- -->
	<div class="mar">
		<div class="list2">-주문자정보</div>
		<div class="back2">
			<span class="red">*</span>필수입력사항
		</div>
	</div>
	<table class="info" cellpadding="1" cellspacing="0" border="1px">

		<tr>
			<td width="15%" class="gre">주문하시는 분<span class="red">*</span></td>
			<td width="85%"><input type="text" size="10px" value=${user.name }
			id="ordername" name="ordername"></td>
		</tr>
		<tr>
			<c:set var="zip" value="${user.zipcode }"></c:set>
			<td class="gre">주소<span class="red">*</span></td>
			<td><input type="text" size="3px" value="${fn:substring(zip,0,3) }" id="orderzip1"> - <input type="text"
				size="3px"  value="${fn:substring(zip,3,6) }" id="orderzip2"> <input type="button" value="찾기" ><br />
				<div class="mart">
					<input type="text" size="50px" value="${user.address1 }" id="orderaddr1">기본주소<br />
				</div>
				<div class="mart">
					<input type="text" size="50px" value="${user.address2 }" id="orderaddr2">상세주소
				</div></td>
		</tr>
		<tr>
			<td class="gre">휴대전화<span class="red">*</span></td>
			<td><select name="tel1" id="ordertel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
			</select> - <input type="text" size="3px" name="tel2" id="ordertel2"> - <input type="text" size="3px" name="tel3" id="ordertel3">
			</td>
		</tr>
		<tr>
			<td class="gre">이메일<span class="red">*</span></td>
			<c:set var="email" value="${user.useremail}"/>
			<c:set var="ecut" value="@"/>
			<td><input type="text" size="10px" value="${fn:substringBefore(email,ecut) }"> @ <input type="text"
				size="10px" value="${fn:substringAfter(email,ecut) }"> <br /> <span class="aa">이메일을 통해 주문과정을 보내드립니다.<br /> 이메일
					주소란에는 반드시 수신가능한 이메일주소를 입력해주시기 바랍니다.
			</span></td>
		</tr>
	</table>

	<!------------------------------------------------------------------------------------------------------------------->
	<div class="mar">
		<div class="list2">-배송지 정보</div>
		<div class="back2">
			<span class="red">*</span>필수입력사항
		</div>
	</div>
	<table class="info2" cellpadding="1" cellspacing="0" border="1px">
		<tr>
			<td width="15%" class="gre">배송지선택<span class="red">*</span></td>
			<td width="85%"><input type="radio" name="rcheck" id="rcheck1"> <span
				class="qq">주문자 정보와 동일</span> &nbsp; <input type="radio" name="rcheck" id="rcheck2" checked="checked">
				<span class="qq">새로운 배송지</span></td>
		</tr>
		<tr>
			<td width="15%" class="gre">주문하시는 분<span class="red">*</span></td>
			<td width="85%"><input type="text" size="10px" id="receivername" name="receivername"></td>
		</tr>
		<tr>
			<td class="gre">주소<span class="red">*</span></td>
			<td><input type="text" size="3px" id="receiverzip1" name="receiverzip1"> - <input type="text"
				size="3px" id="receiverzip2" name="receiverzip2"> <input type="button" value="찾기" /><br />
				<div class="mart">
					<input type="text" size="50px" id="receiveraddr1" name="receiveraddr1">기본주소<br />
				</div>
				<div class="mart">
					<input type="text" size="50px" id="receiveraddr2" name="receiveraddr2">상세주소
				</div></td>
		</tr>
		<tr>
			<td class="gre">휴대전화<span class="red">*</span></td>
			<td><select id="receivertel1" name="receivertel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
			</select> - <input type="text" size="3px" id="receivertel2" name="receivertel2"> - <input type="text" size="3px" id="receivertel3" name="receivertel3">
			</td>
		</tr>
		<tr>
			<td class="gre">배송메세지</td>
			<td><textarea class="si" name="memo"></textarea></td>
		</tr>
		<tr>
			<td>쿠폰</td>
			<td>
				<select id="coupon" name="coupon" onchange="useDiscount()">
					<option value="99">선택</option>
			<c:forEach var="co" items="${coupon}"> 
				<option value="${co.coupon_no }">${co.name }</option>
			</c:forEach>	
				</select>
			</td>
		</tr>
		<tr>
			<td>포인트</td>
			<td><input type="text" name="usepoint" id="usepoint" onblur="useDiscount()" value="0">원 &nbsp;(총 사용가능 적립금 : <span class="point">${user.point }</span>원)</td>
		</tr>
	</table>

	<div class="list2">-결정 예정 금액</div>
	<br />


	<div class="cash">
		<table id="cash" cellpadding="1" cellspacing="0" border="1px">
			<tr>
				<td>총 주문 금액 &nbsp;</td>
				<td width="33%">총 할인 + 부가결제 금액</td>
				<td width="33%">총 결제예정 금액</td>
			</tr>
			<tr>
				<td><span class="siz">${total+fee}</span>원</td>
				<td>-<span class="siz" name="discount" id="discount">0</span>원</td>
				<td><span class="siz" name="total_pay" id="total_pay">${total+fee}</span>원</td>
				<td><input type="hidden" name="totalpay" value="${total+fee }"></td>
			</tr>
		</table>
	</div>

	<!--<---------------------------------------------------------------------------------------------------------------->

	<div class="list2">-결제수단</div>
	<table class="payment" cellpadding="1" cellspacing="0" border="2">
		<tr>
			<td width="700px" class="bord" height="20px"><input type="radio"
				name="pay_way" checked="checked" value="무통장입금"> 무통장 입금 &nbsp;&nbsp; <input type="radio" name="na" disabled="disabled"> 카드
				결제 &nbsp;&nbsp; <input type="radio" name="na"  disabled="disabled"> 휴대폰 결제 &nbsp;&nbsp;
			<td class="nonbor">무통장 입금 <span class="nonbo">최종결제 금액</span><br />
			<br /> <span class="siz" name="total_pay">${total+fee}</span>원
			</td>
		</tr>
		<tr>
			<td rowspan="3">
				<table class="tit">
					<tr>
						<td width="100px">입금자명</td>
						<td><input type="text" size="15px" name="deposit_name" id="deposit_name"></td>
					</tr>
					<tr>
						<td>입금은행</td>
						<td><select class="wid" name="bank" id="bank">
							<option value="">:::입금은행선택:::</option>
							<c:forEach var="b" items="${bank}">
								<option value="${b.bank_name }">${b.bank_name} : ${b.bank_account_number }</option>
							</c:forEach>
						</select></td>
					</tr>
				</table>
			</td>
			<td class="grbor"><input type="checkbox" name="confirm" id="confirm"> 결제정보를 확인하였으며, 구매진행에
				동 &nbsp;&nbsp;&nbsp;의합니다.<br /> <a href="#" class="but" onclick="payCheck()"><div>결제하기</div></a>
			</td>
		</tr>
		<tr>
			<td class="rightbor">총 예정적립금액 <span class="rrig">원</span>
			</td>

		</tr>
		
	</table>
	</form>
	</section>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>