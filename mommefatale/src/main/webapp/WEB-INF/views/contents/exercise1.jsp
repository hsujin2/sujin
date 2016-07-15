<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Exercise</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/contents/contents_css.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css" />
</head>


<body>
	<div id="wrap">
		<%@ include file="../include/header.jsp"%>
		<div id="wrapcontents">
			<div id="content_banner">
				<h1>${category}</h1>
				<a href="dietary.do?category=${category }"><img src="resources/images/contents/arrow-before-dietary.png" 	alt="before" /></a> 
				<a href="exercise1.do?category=${category }"><img src="resources/images/contents/contents-banner.png"	id="contentmain" alt="banner" /></a> 
				<a href="recommended_products.do?category=${category }"><img src="resources/images/contents/arrow-next-product.png" alt="next" /></a>
			</div>
		</div>


		<div id="main_content">
			<div id="pageFor">
				<h1 class="title">Exercise</h1>
			</div>
			<ul class="ExerciseList">
				<c:if test="${count == 0 }">
					<li>등록된 글이 없습니다.</li>
				</c:if>
				<c:if test="${count != 0 }">
					<c:forEach var="vo" items="${vo}">
						<li><span><a
								href="exerciseContent.do?category=${category}&no=${vo.no}">
									<img src="resources/images/uploadimg/images/${vo.image}"
									id="image">
							</a></span> <span class="subject" id="subject"> <a
								href="exerciseContent.do?category=${category}&no=${vo.no}">${vo.subject}</a></span></li>
					</c:forEach>
				</c:if>
			</ul>

			<table class="exercise_board">
				<tr>
					<td colspan="6">
						<hr class="board_hr">
					</td>
				</tr>
				<c:if test="${admin eq true}">
				<tr>
					<td colspan="5"></td>
					<td>
						<button class="write_button"
							onclick="location.href='exerciseWriteForm.do'">글쓰기</button>
					</td>
				</tr>
				</c:if>
			</table>

			<div id="footList">
				<c:if test="${paging.isPre()}">
					<a
						href="exercise1.do?pageNum=${paging.getPage_Start()-paging.p_size}&category=${category}">[이전]</a>&nbsp;&nbsp;</c:if>
				<c:forEach var="counter" begin="${paging.getPage_Start()}"
					end="${paging.getPage_End()}">
					<c:if test="${paging.getCur_Page() eq counter}">[${counter}]
                     </c:if>
					<c:if test="${paging.getCur_Page() ne counter}">
						<a
							href="javascript:window.location='exercise1.do?pageNum=${counter}&category=${category}'">[${counter}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.isNext()}">
					<a
						href="exercise1.do?pageNum=${paging.getPage_Start()+paging.p_size}&category=${category}">[다음]</a>
				</c:if>
			</div>
		</div>

		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>