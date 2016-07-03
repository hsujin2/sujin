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
<link rel="stylesheet" type="text/css"
	href="resources/css/pay/pay_css.css" />
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	alert("dd");
	var tel = ${user.tel};
	var tel1 = "${fn:substring(tel,0,3)}";
		 $("select[name=tel1] option[value="+tel1+"]").attr("selected",true);
	
}
</script>
</head>
<body>
	<section class="content">
	<div id="jaemok">
		<span id="jaemok">결제</span>
	</div>
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
			<td width="85%"><input type="text" size="10px" value=${user.name }></td>
		</tr>
		<tr>
			<c:set var="zip" value="${user.zipcode }"></c:set>
			<td class="gre">주소<span class="red">*</span></td>
			<td><input type="text" size="3px" value="${fn:substring(zip,0,3) }"> - <input type="text"
				size="3px"  value="${fn:substring(zip,3,6) }"> <input type="button" value="찾기" ><br />
				<div class="mart">
					<input type="text" size="50px" value="${user.address1 }">기본주소<br />
				</div>
				<div class="mart">
					<input type="text" size="50px" value="${user.address2 }">상세주소
				</div></td>
		</tr>
		<tr>
			<td class="gre">휴대전화<span class="red">*</span></td>
			<td><select name="tel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
			</select> - <input type="text" size="3px" /> - <input type="text" size="3px" />
			</td>
		</tr>
		<tr>
			<td class="gre">이메일<span class="red">*</span></td>
			<td><input type="text" size="10px" /> @ <input type="text"
				size="10px" /> <select>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
					<option value="daum.net">daum.net</option>
					<option value="lycos.co.kr">lycos.co.kr</option>
			</select> <br /> <span class="aa">이메일을 통해 주문과정을 보내드립니다.<br /> 이메일
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
			<td width="85%"><input type="radio" name="check" /> <span
				class="qq">주문자 정보와 동일</span> &nbsp; <input type="radio" name="check" />
				<span class="qq">새로운 배송지</span></td>
		</tr>
		<tr>
			<td width="15%" class="gre">주문하시는 분<span class="red">*</span></td>
			<td width="85%"><input type="text" size="10px" /></td>
		</tr>
		<tr>
			<td class="gre">주소<span class="red">*</span></td>
			<td><input type="text" size="3px" /> - <input type="text"
				size="3px" /> <input type="button" value="찾기" /><br />
				<div class="mart">
					<input type="text" size="50px" />기본주소<br />
				</div>
				<div class="mart">
					<input type="text" size="50px" />상세주소
				</div></td>
		</tr>
		<tr>
			<td class="gre">일반전화</td>
			<td><select>
					<option>02</option>
					<option>031</option>
					<option>051</option>
					<option>053</option>
					<option>032</option>
					<option>062</option>
					<option>042</option>
					<option>052</option>
					<option>044</option>
					<option>033</option>
					<option>034</option>
					<option>041</option>
					<option>063</option>
					<option>061</option>
					<option>054</option>
					<option>055</option>
					<option>064</option>
			</select> - <input type="text" size="3px" /> - <input type="text" size="3px" />
			</td>
		</tr>
		<tr>
			<td class="gre">휴대전화<span class="red">*</span></td>
			<td><select>
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
			</select> - <input type="text" size="3px" /> - <input type="text" size="3px" />
			</td>
		</tr>
		<tr>
			<td class="gre">배송메세지</td>
			<td><textarea class="si"></textarea></td>
		</tr>
	</table>

	<div class="list2">-결정 예정 금액</div>
	<br />


	<div class="cash">
		<table id="cash" cellpadding="1" cellspacing="0" border="1px">
			<tr>
				<td>총 주문 금액 &nbsp;<a href="#" class="move">내역보기<span
						class="red">▶</span></a></td>
				<td width="33%">총 할인 + 부가결제 금액</td>
				<td width="33%">총 결제예정 금액</td>
			</tr>
			<tr>
				<td><span class="siz">199,000</span>원</td>
				<td><span class="siz">-0</span>원</td>
				<td><span class="siz">=199,000</span>원</td>
			</tr>
		</table>
	</div>
	<table id="cash2" cellpadding="1" cellspacing="0" border="1px">
		<tr>
			<td width="20%" class="bo">총 할인금액</td>
			<td>0원</td>
		</tr>
		<tr>
			<td class="bo">총 부가결제금액</td>
			<td>0원</td>
		</tr>
	</table>

	<!--<---------------------------------------------------------------------------------------------------------------->

	<div class="list2">-결제수단</div>
	<table class="payment" cellpadding="1" cellspacing="0" border="2">
		<tr>
			<td width="700px" class="bord" height="20px"><input type="radio"
				name="na" /> 무통장 입금 &nbsp;&nbsp; <input type="radio" name="na" /> 카드
				결제 &nbsp;&nbsp; <input type="radio" name="na" /> 휴대폰 결제 &nbsp;&nbsp;
				<input type="radio" name="na" /> 에스트로(실시간 계좌이체)</td>
			<td class="nonbor">무통장 입금 <span class="nonbo">최종결제 금액</span><br />
			<br /> <span class="siz">199,000</span>원
			</td>
		</tr>
		<tr>
			<td rowspan="3">
				<table class="tit">
					<tr>
						<td width="100px">입금자명</td>
						<td><input type="text" size="15px" /></td>
					</tr>
					<tr>
						<td>입금은행</td>
						<td><select class="wid">
								<option>:::입금은행선택:::</option>
								<option>농협</option>
								<option>국민은행</option>
								<option>신한은행</option>
								<option>우리은행</option>
								<option>하나은행</option>
								<option></option>
						</select> <a href="#" class="move">은행사이트 바로가기<span class="red">▶</span></a>
						</td>
					</tr>
				</table>
			</td>
			<td class="grbor"><input type="checkbox" /> 결제정보를 확인하였으며, 구매진행에
				동 &nbsp;&nbsp;&nbsp;의합니다.<br /> <a href="#" class="but"><div>결제하기</div></a>
			</td>
		</tr>
		<tr>
			<td class="rightbor">총 예정적립금액 <span class="rrig">100원</span>
			</td>

		</tr>
		<tr>
			<td class="right">상품별 적립금 <span class="rrig">100원</span><br />
				회원 적립금 <span class="rrig">0원</span><br /> 쿠폰 적립금 <span class="rrig">0원</span><br />
			</td>
		</tr>
	</table>
	</section>
</body>
</html>