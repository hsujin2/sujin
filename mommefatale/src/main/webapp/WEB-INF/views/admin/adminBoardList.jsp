<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>게시판 관리</title>
<link rel="stylesheet" type="text/css" href="resources/css/admin/boardmanage_css.css">
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css">
</head>

<body>
<div id="wrap">
<%@ include file="../include/header.jsp" %>
<section class="content">
	<div class="bm">
    	게시판관리
    </div>
    <div class="bl">
    	<span class="col">▶</span> 게시판목록
    </div>
    <table class="bot" border="1">
    	<colgroup>
        	<col width="45%"/>
            <col width="35%"/>
            <col width="20%"/>
        </colgroup>
        <thead>
        	<tr>
        		<th>게시판제목</th>
            	<th>권한(쓰기/읽기)</th>
            	<th>새글/총갯수</th>
            </tr>
        </thead>
        <tbody>
        	<tr>
            	<td><a href="#">공지사항</a></td>
                <td>관리자/비회원</td>
                <td>1/1</td>
            </tr>
            <tr>
            	<td><a href="#">자유게시판</a></td>
                <td>회원/비회원</td>
                <td>0/0</td>
            </tr>
            <tr>
            	<td><a href="#">갤러리</a></td>
                <td>회원/비회원</td>
                <td>0/0</td>
            </tr>
            <tr>
            	<td><a href="#">상품</a></td>
                <td>회원/비회원</td>
                <td>0/0</td>
            </tr>
            <tr>
            	<td><a href="#">Q&#38;A</a></td>
                <td>회원/비회원</td>
                <td>0/0</td>
            </tr>
        </tbody>
    </table>
</section>
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>
