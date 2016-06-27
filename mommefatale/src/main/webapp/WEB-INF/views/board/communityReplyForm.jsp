<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 답변쓰기</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css" href="resources/css/board/community_css.css">
<script>
	function FormCheck() {
		var writer = document.getElementById("writer");
		var subject = document.getElementById("subject");
		var content = document.getElementById("content");
		var communityReplyForm = document.getElementById("replyForm");
		
		if (subject.value == null || subject.value == "") {
			alert("제목을 입력하세요!");
			subject.focus();
			return;
		}
		if (content.value == null || content.value == "") {
			alert("내용을 입력하세요!");
			content.focus();
			return;
		}

		document.communityReplyForm.submit();
	}

	function writeCancel() {
		history.go(-1);
	}
</script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div id="wrap">
		<div class="board">
		<h2 class="title">자유게시판</h2>
			<form name="communityReplyForm" method="post"
				action="communityReply.do" id="replyForm">
				<input type="hidden" value="${vo.ref}" name="ref" id="ref">
				<table summary="테이블 구성" id="community_board">
					<tr>
						<th>작성자</th>
						<td>&nbsp;&nbsp;<input type="text" name="writer" id="writer" size="10"
							maxlength="15" value="${userLogin.userid }" readonly></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>제&nbsp;&nbsp;&nbsp;목</th>
						<td><img src="resources/images/board/reply_icon.gif" alt="답변">
						</td>
						<td><input type="text" name="subject" id="subject" size="80" value="RE:'${vo.subject}'"></td>
					</tr>
					<tr>
						<th>내&nbsp;&nbsp;&nbsp;용</th>
						<td colspan="2"><textarea name="content" id="content" style="resize:none" rows="15" cols="100"></textarea></td>
					</tr>
					<!-- <tr>
						<th>첨부파일</th>
						<td colspan="2" class="align_left">&nbsp;&nbsp;<input type="file" name="filename"></td>
					</tr>-->
					<tr>
						<td colspan="3"><hr class="board_hr"></td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="button" value="등록" onClick="FormCheck()" class="commit_btn"> 
							<input type="button" value="취소" onclick="writeCancel()" class="commit_btn">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>