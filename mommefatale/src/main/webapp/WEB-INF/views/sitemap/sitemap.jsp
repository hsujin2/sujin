<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="userLogin" value="${sessionScope.login}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이트맵</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css" />
<link rel="stylesheet" type="text/css" href="resources/css/sitemap/sitemap_css.css" />
</head>
<body>
<div id="wrap">
	<%@ include file="../include/header.jsp"%>
	<div class="content">
	<div class="sub">
    	<span class="col">사이트</span><span class="col2">맵</span>
    </div>
        <ul class="nonli">
            <li>
                <table class="menu">
                    <tr>
                        <td><div class="bgimg">Board</div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="gallery.do">갤러리</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="communityBoard.do">공지사항</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="communityBoard.do">자유게시판</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="qnaBoard.do">Q&amp;A</a></div></td>
                    </tr>
                </table>
            </li>
            
            <li>
                <table class="menu">
                 <c:if test="${userLogin == null}">
                    <tr>
                        <td><div class="bgimg2">Member</div></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="joinagreement.do">회원가입</a></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="login.do">로그인</a></td>
                    </tr>
                   </c:if>
                    <c:if test="${userLogin != null}">
                    <tr>
                        <td><div class="bgimg2"><a href="mypage.do">MyPage</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="userUpdate.do">회원정보수정</a></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="paymentlist.do">주문내역</a></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="cartlist.do">장바구니</a></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="todayKcal.do">나의칼로리</a></td>
                    </tr>
                    </c:if>
                    
                </table>
            </li>
            <li>
                <table class="menu">
                    <tr>
                        <td><div class="bgimg3">Contents</div></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="exercise1.do?category=heathcare">건강증진</a></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="exercise1.do?category=bulkup">벌크업</a></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="exercise1.do?category=diet">다이어트</a></td>
                    </tr>
                </table>
            </li>
            
            <li>
                <table class="menu">
                    <tr>
                        <td><div class="bgimg">Equipment</div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="itemList.do?category=1&range=new">런닝머신</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="itemList.do?category=2&range=new">웨이트기구</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="itemList.do?category=3&range=new">헬스사이클</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="itemList.do?category=4&range=new">아령/덤벨</a></div></td>
                    </tr>
                </table>
            </li>
            <li>
                <table class="menu">
                    <tr>
                        <td><div class="bgimg2">SportsWear</div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="itemList.do?category=6&range=new">운동복</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="itemList.do?category=7&range=new">운동화/런닝화</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="itemList.do?category=8&range=new">스포츠브라</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="itemList.do?category=9&range=new">기타</a></div></td>
                    </tr>
                </table>
            </li>
            <li>
                <table class="menu">
                    <tr>
                        <td><div class="bgimg3">Food</div></td>
                    </tr>
                   <tr class="pad">
                        <td><div><a href="itemList.do?category=10&range=new">보충제</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="itemList.do?category=11&range=new">영양제</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="itemList.do?category=12&range=new">기타식품</a></div></td>
                    </tr>
                </table>
            </li>
        </ul>

</div>
	<%@ include file="../include/footer.jsp"%>
</div>
</body>
</html>