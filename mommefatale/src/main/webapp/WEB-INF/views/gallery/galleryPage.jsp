<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/gallery/gallery_css.css" />

<title>Before&amp;After Gallery</title>
</head>
<body>
	<div id="wrap">
		<%@ include file="../include/header.jsp"%>
		<script>
			function galleryWrite() {
				var user = "${userLogin}";

				if (user == null || user == "") {
					alert("로그인 후 글쓰기가 가능합니다.");
					return;
				}

				window.location = "/mommefatale/galleryWriteForm.do";
			}
		</script>

		<div id="main_content">
			<div id="pageFor">
				<h2 class="title">Before - After Gallery</h2>
			</div>
			<ul class="galleryList">
				<c:if test="${count == 0 }">
					<li>갤러리에 등록된 글이 없습니다.</li>
				</c:if>
				<c:if test="${count != 0 }">
					<c:forEach var="vo" items="${vo}">
						<li><span><a href="galleryContent.do?no=${vo.no}">
									<img src="/mommefatale/resources/images/uploadimg/${vo.image}" id="image">
							</a></span> <span class="subject" id="subject"> <a
								href="galleryContent.do?no=${vo.no}">${vo.subject}</a></span></li>
					</c:forEach>
				</c:if>
			</ul>

			<table>
				<tr>
					<td colspan="6">
						<hr class="board_hr">
					</td>
				</tr>
				<tr>
					<td colspan="5"></td>
					<td>
						<button class="write_button" onclick="galleryWrite()">글쓰기</button>

					</td>
				</tr>
			</table>

			<div id="footList">
				<c:if test="${paging.isPre()}">
					<a
						href="gallery.do?pageNum=${paging.getPage_Start()-paging.p_size}">[이전]</a>&nbsp;&nbsp;</c:if>
				<c:forEach var="counter" begin="${paging.getPage_Start()}"
					end="${paging.getPage_End()}">
					<c:if test="${paging.getCur_Page() eq counter}">[${counter}]
                     </c:if>
					<c:if test="${paging.getCur_Page() ne counter}">
						<a
							href="javascript:window.location='gallery.do?pageNum=${counter}'">[${counter}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.isNext()}">
					<a
						href="gallery.do?pageNum=${paging.getPage_Start()+paging.p_size}">[다음]</a>
				</c:if>
			</div>
		</div>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>