<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css" href="resources/css/board/qna_css.css">
<script type="text/javascript"
	src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>

	function FormCheck() {
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
		var writer = document.getElementById("writer");
		var subject = document.getElementById("subject");
		var content = document.getElementById("content");
		var qnaWriteForm = document.getElementById("writeForm");

		if (writer.value == null || writer.value == "") {
			alert("작성자를 입력하세요!");
			writer.focus();
			return;
		}
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

		document.qnaWriteForm.submit();
	}

	function writeCancel() {
		history.go(-1);
	}
</script>
</head>
<body>
<div id="wrap">
	<%@ include file="../include/header.jsp"%>
		<div class="board">
			<h2 class="title">Q&amp;A</h2>
			<form name="qnaWriteForm" method="post"
				action="qnaUpdateProc.do?no=${vo.no}" id="writeForm">
				<table summary="테이블 구성" id="qna_board">
					<tr>
						<th>작성자</th>
						<td>&nbsp;&nbsp;<input type="text" name="writer" id="writer"
							size="10" maxlength="15" value="${vo.writer}" readonly></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>제&nbsp;&nbsp;&nbsp;목</th>
						<td>&nbsp;&nbsp;<select name="section" id="section">
									<option value="">말머리 선택</option>
									<option value="상품문의">상품문의</option>
									<option value="배송문의">배송문의</option>
									<option value="교환/환불">교환/환불</option>
									<option value="결제문의">결제문의</option>
									<option value="기타문의">기타문의</option>
								</select>
						</td>
						<td><input type="text" name="subject" id="subject" size="70"
							value="${vo.subject}"></td>
					</tr>
					<tr>
						<th>내&nbsp;&nbsp;&nbsp;용&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<td colspan="2">
							<!--<textarea name="content" id="content" style="resize:none" rows="15" cols="100">
						${vo.content}</textarea>--> 
						<textarea name="content" id="content" rows="22" style="width: 700px">${vo.content}</textarea> 
						<script type="text/javascript">
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
						<td colspan="3"><hr class="board_hr"></td>
					</tr>
					<tr>
						<td colspan="3"><input type="button" value="등록"
							onClick="FormCheck()" class="commit_btn"> <input
							type="button" value="취소" onclick="writeCancel()"
							class="commit_btn"></td>
					</tr>
				</table>
			</form>
		</div>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>