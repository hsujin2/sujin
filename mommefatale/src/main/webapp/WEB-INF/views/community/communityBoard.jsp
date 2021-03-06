<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/board/community_css.css">
</head>
<body>
	<div id="wrap">
		<%@ include file="../include/header.jsp"%>
		<script>
			function communityWrite() {
				var user = "${userLogin}";
				

				if (user == null || user == "") {
					alert("로그인 후 글쓰기가 가능합니다.");
					return;
				}
				
				window.location = "/mommefatale/communityWriteForm.do";
			}
		</script>
		<div class="board">
		<h2 class="title">자유게시판</h2>
			<table summary="자유게시판" id="community_board" class="community_list">
				<colgroup>
					<col width="8%">
					<col width="15%">
					<col>
					<col width="10%">
					<col width="18%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">NO</th>
						<th scope="col">말머리</th>
						<th scope="col">제목</th>
						<th scope="col">글쓴이</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
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
							<td><c:set var="num" value="${number-i.index}"
									scope="page" />${num}</td> <!-- 페이지에서만 유효한 글 번호 -->
								<!-- <td>${vo.no}</td>--> <!-- 실제 입력되는 순서의 글번호 -->
								<c:choose>
									<c:when test="${vo.section=='공지사항'}">
									<td class="sectionStyle1">${vo.section}</td>
									</c:when>
									<c:otherwise>
									<td class="sectionStyle2">${vo.section}</td>
									</c:otherwise>
								</c:choose>
								<td class="align_left">
								<c:if test="${vo.depth > 0}">
								<c:set var="wid" value="${vo.depth*10}"/>
								<img src="resources/images/board/level.gif" width="${wid}">
								</c:if>
								<c:if test="${vo.step ge 1}"><img src="resources/images/board/reply_icon.gif"></c:if>
								<a href="communityContent.do?no=${vo.no}">&nbsp;${vo.subject }</a>
								<c:if test="${vo.view ge 20}"><img src="resources/images/board/hot.gif"></c:if>	
							 	</td>
								<td>${vo.writer}</td>
								<td class="regdates"><fmt:formatDate value="${vo.regdate}" type="date"
										pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${vo.view}</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<td colspan="6">
							<hr class="board_hr">
						</td>
					</tr>
					<tr>
						<td colspan="5">
						</td>
						<td>
							<button class="write_button" onclick="communityWrite()">글쓰기</button>
						</td>
					</tr>
				</tbody>
			</table>

			<div id="footList">
				<c:if test="${paging.isPre()}">
					<a href="communityBoard.do?pageNum=${paging.getPage_Start()-paging.p_size}">[이전]</a>&nbsp;&nbsp;</c:if>
				<c:forEach var="counter" begin="${paging.getPage_Start()}"
					end="${paging.getPage_End()}">
					<c:if test="${paging.getCur_Page() eq counter}">[${counter}]
                     </c:if>
					<c:if test="${paging.getCur_Page() ne counter}">
						<a href="javascript:window.location='communityBoard.do?pageNum=${counter}'">[${counter}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.isNext()}">
					<a href="communityBoard.do?pageNum=${paging.getPage_Start()+paging.p_size}">[다음]</a>
				</c:if>
			</div>
			<select id="searchCategory">
				<option value="section">말머리</option>
				<option value="writer">글쓴이</option>
				<option value="subject">글제목</option>
				<option value="content">글내용</option>
			</select>
			<input type="search" id="searchArticle" name="searchArticle">
			<input type="button" value="검색" onclick="">
		</div>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>
