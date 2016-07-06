<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Before&amp;After Gallery</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/gallery/gallery_css.css">
<script type="text/javascript" src="resources/ckeditor/ckeditor.js" charset="utf-8"></script> 
<script>

	function FormCheck() {
		var CKEDITOR;
		var writer = document.getElementById("writer");
		var subject = document.getElementById("subject");
		var content = document.getElementById("content");
		var galleryWriteForm = document.getElementById("writeForm");


		if (subject.value == null || subject.value == "") {
			alert("제목을 입력하세요!");
			subject.focus();
			return;
		}

		document.galleryWriteForm.submit();
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
			<h2 class="title">갤러리</h2>
			<form name="galleryWriteForm" method="post"
				action="galleryUpdateProc.do?no=${vo.no}" id="writeForm">
				<table summary="테이블 구성" id="gallery_board">
					<tr>
						<th>작성자</th>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="writer" id="writer"
							size="20" maxlength="20" value="${vo.writer}" readonly></td>
						<td  colspan="2" width="750"></td>
					</tr>
					<tr>
						<th>제&nbsp;&nbsp;&nbsp;목</th>
						<td colspan="3"><input type="text" name="subject" id="subject" size="120"
							value="${vo.subject}"></td>
					</tr>
					<tr>
						<th>내&nbsp;&nbsp;&nbsp;용&nbsp;</th>
						<td colspan="3">
							<textarea name="content" id="content" rows="50" cols="150">
						${vo.content}</textarea>
						<script type="text/javascript">
								//<![CDATA[
								CKEDITOR.replace('content');
								//]]
							</script>
						</td>
					</tr>
					<tr>
						<td colspan="4"><hr class="board_hr"></td>
					</tr>
					<tr>
						<td colspan="4"><input type="button" value="등록"
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