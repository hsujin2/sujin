<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="userLogin" value="${sessionScope.login}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mypage</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/user/mypage_css.css"/>
<script type="text/javascript">
	
	function OpenCouponPage(){
		url = "userCoupon.do";
		window.open(url, "get", "width=600,height=400", "status=no",
		"toolbar=no");
	}

</script>
</head>
<body>
<div id="wrap">
<%@ include file="../include/header.jsp" %>
<div class="mypage">
<section class="content">
  <div class="img">
    	<img src="resources/images/mypage/mypage.png"  />
  </div>
  <div class="ment">PERSONAL INFO | CONTENTS | MY POINT</div>
    <div class="ulli">
    	<ul class="list1">
        	<li class="li1">
            <table><tr><td rowspan="2"><img src="resources/images/mypage/key.png" width="24" height="39" /></td><td class="subject">PERSONAL INFO</td>																																																						
            </tr>
            <tr>
            <td class="sub">개인정보</td>
            </tr></table>
            	<ul>
                	<li><a href="userUpdate.do">회원정보수정</a></li>
                    <li><a href="userDelete.do">회원탈퇴</a></li>
                    
                </ul>
          </li>
            <li class="li1"><table><tr><td rowspan="2"><img src="resources/images/mypage/box.png" width="41" height="40" /></td><td class="subject">CONTENTS</td>																																																						
            </tr>
            <tr>
            <td class="sub">컨텐츠</td>
            </tr></table>
            	<ul>
                	<li><a href="paymentlist.do">주문내역</a></li>
                    <li><a href="cartlist.do">장바구니</a></li>
                    <li><a href="wishlist.do">위시리스트</a></li>
                    <li><a href="javascript:OpenCouponPage()">할인쿠폰내역</a></li>
                    <li><a href="todayKcal.do">나의칼로리</a></li>
                </ul>
            </li>
          <li><table><tr><td rowspan="2"><img src="resources/images/mypage/pad.png" width="33" height="40" /></td><td class="subject">MY POINT</td>																																																						
            </tr>
            <tr>
            <td class="sub">나의등급</td>
            </tr></table>
            	<ul>
                	<li><a href="#">등급 : ${userLogin.getGrade() }</a></li>
                    <li><a href="#">포인트 : ${userLogin.getPoint() }</a></li>
            </ul>
          </li>
        </ul>
    </div>
</section>
</div>
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>