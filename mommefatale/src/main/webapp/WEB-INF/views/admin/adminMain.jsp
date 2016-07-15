<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css" href="resources/css/admin/admin_css.css">
</head>
<body>
	<div id="wrap">
		<%@ include file="../include/header.jsp"%>
		
		<section class="content">
    <div class="subcon">
    	<span class="sub">
        	MANAGEMENT
        </span>
        </div>
        <table class="menu">
        	<tr>
            	<td><div id="menu1"><a href="member.admin" class="menu1"><img src="resources/images/admin/고객관리.png" width="80" height="80" /><br />
고객관리 </a></div></td>
                <td><div id="menu1"><a href="board.admin" class="menu1"><img src="resources/images/admin/게시판관리.png" width="80" height="80" /><br />
게시판관리 </a></div></td>
                <td><div id="menu1"><a href="itemAdd.admin" class="menu1"><img src="resources/images/admin/상품등록.png" width="80" height="80" /><br />
상품등록 </a></div></td>
            </tr>
            <tr>
            	<td><div id="menu1"><a href="itemlist.admin?range=new" class="menu1"><img src="resources/images/admin/상품관리.png" width="80" height="80" /><br />
상품관리 </a></div></td>
                <td><div id="menu1"><a href="adminpaymentlist.admin" class="menu1"><img src="resources/images/admin/주문관리.png" width="80" height="80" /><br />
주문관리 </a></div></td>
                <td><div id="menu1"><a href="sitestatus.admin" class="menu1"><img src="resources/images/admin/현황.png" width="80" height="80" /><br />
매출현황 </a></div></td>
            </tr>
            <tr>
            <td><div id="menu1"><a href="createPDFpage.admin" class="menu1"><img src="resources/images/admin/문서출력.png" width="80" height="80" /><br />
문서출력 </a></div></td>
            </tr>
        </table>
    </section>
		
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>