<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&amp;A</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css" href="resources/css/board/qna_css.css">
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	function FormCheck() {
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
		var writer = document.getElementById("writer");
		var subject = document.getElementById("subject");
		var content = document.getElementById("content");
		var qnaAnswerForm = document.getElementById("answerForm");
		
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

		document.qnaAnswerForm.submit();
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
		<h2 class="title">Q&amp;A</h2>
			<form name="qnaAnswerForm" method="post"
				action="qnaAnswer.admin" id="answerForm">
				<input type="hidden" value="${vo.ref}" name="ref" id="ref">
				<input type="hidden" value="${vo.step}" name="step" id="step">
				<input type="hidden" value="${vo.depth}" name="depth" id="depth">
				<input type="hidden" value="${vo.section}" name="section" id="section">
				<table summary="테이블 구성" id="qna_board">
					<tr>
						<th>작성자</th>
						<td colspan="4" align="left">&nbsp;&nbsp;<input type="text" name="writer" id="writer" size="10"
							maxlength="15" value="${userLogin.userid}" readonly></td>
					</tr>
					<tr>
						<th>제&nbsp;&nbsp;&nbsp;목</th>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="resources/images/board/reply_icon.gif" alt="답변">
						</td>
						<td colspan="2"><input type="text" name="subject" id="subject" size="70" value="${vo.subject}"></td>
					</tr>
					<tr>
						<th>내&nbsp;&nbsp;&nbsp;용&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<td colspan="3">
						<!-- <textarea name="content" id="content" style="resize:none" rows="15" cols="100">${vo.content}</textarea> -->
					<textarea name="content" id="content" rows="22"
								style="width: 670px">${vo.content}</textarea> <script type="text/javascript">
									var oEditors = [];

									nhn.husky.EZCreator
											.createInIFrame({
												oAppRef : oEditors,
												elPlaceHolder : "content", //textarea에서 지정한 id와 일치해야 합니다.
												sSkinURI : "resources/smarteditor/SmartEditor2Skin.html",
												fCreator : "createSEditor2"

											});
								</script>
					</td>
					</tr>
					<tr>
						<td colspan="4"><hr class="board_hr"></td>
					</tr>
					<tr>
						<td colspan="2"></td>
						<td align="right">
							<input type="button" value="등록" onClick="FormCheck()" class="commit_btn"> 
							<input type="button" value="취소" onclick="writeCancel()" class="commit_btn">
						</td>
						<td class="align_right"><a href="qnaBoard.do">목록보기</a>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</body>
</html>