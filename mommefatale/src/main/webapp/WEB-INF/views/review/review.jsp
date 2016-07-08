<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/review/review.css">
</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<script>
		function reviewWrite() {
			var user = "${userLogin}";

			if (user == null || user == "") {
				alert("로그인 후 글쓰기가 가능합니다.");
				return;
			}

			window.location = "/mommefatale/reviewWrite.do";
		}
	</script>
	<section class="content">


	<div class="main">REVIEW</div>


	<table class="review" border="1">
		<colgroup>
			<col width="60px" />
			<col width="120px" />
			<col width="auto" />
			<col width="100px" />
			<col width="100px" />
			<col width="60px" />
		</colgroup>
		<thead>
			<tr>
				<th>NO</th>
				<th>RATING</th>
				<th>SUBJECT</th>
				<th>NAME</th>
				<th>DATE</th>
				<th>HIT</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${count == 0 }">
				<tr>
					<td></td>
					<td></td>
					<td>자유게시판에 등록된 글이 없습니다.</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</c:if>
			<c:if test="${count != 0 }">
				<c:forEach var="vo" items="${vo}" varStatus="i">
					<tr>
						<td>
							${vo.no}
						</td>
						<td>${vo.section}</td>
						<td><a href="review.do?no=${vo.no}">${vo.subject }</a></td>
						<td>${vo.writer }</td>
						<td><fmt:formatDate value="${vo.regdate}" type="date" 
						pattern="yyyy-MM-dd HH:mm"/></td>
						<td>vo.view</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<div class="buts">
		<input type="button" value="글쓰기" class="btn" onclick="reviewWrite()" />
	</div>
	
	<div id="footList">
				<c:if test="${paging.isPre()}">
					<a href="review.do?pageNum=${paging.getPage_Start()-paging.p_size}">[이전]</a>&nbsp;&nbsp;</c:if>
				<c:forEach var="counter" begin="${paging.getPage_Start()}"
					end="${paging.getPage_End()}">
					<c:if test="${paging.getCur_Page() eq counter}">[${counter}]
                     </c:if>
					<c:if test="${paging.getCur_Page() ne counter}">
						<a href="javascript:window.location='review.do?pageNum=${counter}'">[${counter}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.isNext()}">
					<a href="review.do?pageNum=${paging.getPage_Start()+paging.p_size}">[다음]</a>
				</c:if>

			</div>

	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
