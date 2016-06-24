<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css" href="resources/css/board/community_css.css">
</head>
<body>
<div id="wrap" >
<%@ include file="../include/header.jsp" %>
	<script>
					function communityWrite(){
						var user = "${userLogin}";
						var manager = "${isManager}";
	
						if(user == null && manager == "false"){
							alert("로그인 후 글쓰기가 가능합니다.");
							return;
						}
						if(user =="" && manager == ""){
							alert("로그인 후 글쓰기가 가능합니다.");
							return;
						}
						window.location="/mommefatale/communityWriteForm.do";
					}
				</script>
<div class="board">
					<table summary="자유게시판" id="community_board">
					<h2 class="title">자유 게시판</h2>
						<colgroup>
							<col width="8%" >
							<col width="15%">
							<col>
							<col width="10%">
							<col width="18%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">글번호</th>
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
							<c:forEach var="vo" items="${vo}">
								<tr>
									<!--  <td><c:set var="no" value="${no-1 }" scope="page"/></td>-->
									<td>${vo.no}</td>
									<td>${vo.section}</td>
									<td class="align_left"><a href="communityContent.do?no=${vo.no }">${vo.subject }</a></td>
									<td>${vo.writer }</td>
									<td><fmt:formatDate value="${vo.regdate }" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
									<td>${vo.view }</td>
								</tr>
							</c:forEach>
						</c:if>
						</tbody>
					</table>
				<hr class="board_hr">
				<button class="write_button" onclick="communityWrite()">글쓰기</button>
				<div id="footList">
				   <c:if test="${paging.isPre()}"><a href="communityBoard.do?pageNum=${paging.getPage_Start()-paging.p_size}">[이전]</a>&nbsp;&nbsp;</c:if>
                  <c:forEach var="counter" begin="${paging.getPage_Start()}" end="${paging.getPage_End()}">
                     <c:if test="${paging.getCur_Page() eq counter}">
                        [${counter}]
                     </c:if>
                     <c:if test="${paging.getCur_Page() ne counter}">
                        <a href="javascript:window.location='communityBoard.do?pageNum=${counter}'">[${counter}]</a>
                     </c:if>   
                  </c:forEach>
                  <c:if test="${paging.isNext()}">
                     <a href="communityBoard.do?pageNum=${paging.getPage_Start()+paging.p_size}">[다음]</a>
                  </c:if>
				
				</div>
			</div>
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>
