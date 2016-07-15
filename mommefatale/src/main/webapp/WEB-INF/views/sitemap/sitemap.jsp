<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<section class="content">
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
                        <td><div><a href="#">sitemap</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="communityBoard.do">Community</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="qnaBoard.do">Q&#38;A</a></div></td>
                    </tr>
                    <tr class="pad">
                        <td><div><a href="gallery.do">Gallery</a></div></td>
                    </tr>
                </table>
            </li>
            <li>
                <table class="menu">
                    <tr>
                        <td><div class="bgimg2">Equipment</div></td>
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
                        <td><div class="bgimg3">SportsWear</div></td>
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
                        <td><div class="bgimg">Food</div></td>
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
            <li>
                <table class="menu">
                    <tr>
                        <td><div class="bgimg2">회원</div></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="joinagreement.do">Join</a></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="login.do">Login</a></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="#">BookMark</a></td>
                    </tr>
                    
                </table>
            </li>
            <li>
                <table class="menu">
                    <tr>
                        <td><div class="bgimg3">etc</div></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="exercise1.do?category=heathcare">HealthCare</a></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="exercise1.do?category=bulkup">Bulk-Up</a></td>
                    </tr>
                    <tr class="pad">
                        <td><a href="exercise1.do?category=diet">Diet</a></td>
                    </tr>
                    
                </table>
<div class="ma"></div>
            </li>
        </ul>
</section>
	<%@ include file="../include/footer.jsp"%>
</div>
</body>
</html>