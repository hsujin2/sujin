<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/board/community_css.css">
	
<c:if test="${vo.no==null||no==''}">
	<script>
		alert("잘못된 접근이거나 해당 게시물은 존재하지 않습니다.");
		history.go(-1);
	</script>
</c:if>
</head>
	<script type="text/javascript">

		function deleteContent() { //글삭제
			var check = confirm("삭제하시겠습니까?");
			if (check == true) {
				window.location = "communityDelete.do?no=${vo.no}";
			} else {
				return;
			}
		}
	</script>
<body>	
	<div id="wrap">
	<%@ include file="../include/header.jsp"%>
		<div class="board">
			<h2 class="title">자유게시판</h2>
			<form name="communityContent" method="post" id="writeForm">
				<table summary="테이블 구성" id="community_board">
					<tr>
						<th class="no">NO.</th>
						<td id="no">${vo.no}</td>
						<td id="space"></td>
						<th class="writer">글쓴이</th>
						<td id="writer">${vo.writer}</td>
						<th>작성일자</th>
						<td id="regdate"><fmt:formatDate value="${vo.regdate}"
								type="date" pattern="yyyy-MM-dd HH:mm" /></td>
						<th>조회수</th>
						<td id="view">${vo.view}</td>
					</tr>
					<tr>
						<th colspan="2">제&nbsp;&nbsp;&nbsp;목</th>
						<td colspan="7" id="subject">&nbsp;&nbsp;&nbsp;${vo.section}
							- ${vo.subject}</td>
					</tr>
					<tr>
						<td colspan="9" id="content"><pre>${vo.content}</pre></td>
					</tr>
					<tr>
						<td colspan="9"><hr class="board_hr"></td>
					</tr>
					<tr>
						<td colspan="2">
						<c:if test="${userLogin ne null && vo.section ne '공지사항'}"> 
						<!-- 로그인을 하지 않았거나 글이 공지사항인 경우 답글을 달 수 없음 -->
							<input type="button" value="답글쓰기" onClick="window.location='communityReplyForm.do?no='+${vo.no}">		
						</c:if>
						</td>
						<td colspan="2"></td>
						<td class="align_right"><a href="communityBoard.do">목록보기</a>
						</td>
						<td colspan="2"></td>
						<td colspan="2">
						<c:if test="${vo.writer eq userLogin.userid || admin eq true}">
								<input type="button" value="수정"
									onClick="window.location='communityUpdate.do?no='+${vo.no}" class="commit_btn">
								<input type="button" value="삭제" onClick="deleteContent()" class="commit_btn">
							</c:if></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>