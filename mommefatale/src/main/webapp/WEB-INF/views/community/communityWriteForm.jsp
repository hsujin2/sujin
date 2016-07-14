<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/board/community_css.css">
<script type="text/javascript"
	src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	function FormCheck() {
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
		var writer = document.getElementById("writer");
		var subject = document.getElementById("subject");
		var content = document.getElementById("content");
		var communityWriteForm = document.getElementById("writeForm");

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

		document.communityWriteForm.submit();
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
			<h2 class="title">자유게시판</h2>
			<form name="communityWriteForm" method="post"
				action="communityWrite.do" id="writeForm">
				<table summary="테이블 구성" id="community_board">
					<tr>
						<th>작성자</th>
						<td>&nbsp;&nbsp;<input type="text" name="writer" id="writer"
							size="10" maxlength="15" value="${userLogin.userid }" readonly></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>제&nbsp;&nbsp;&nbsp;목</th>
						<td>&nbsp;&nbsp;<select name="section" id="section">
								<option value="">말머리 선택</option>
								<c:if test ="${admin eq true}">
								<option value="공지사항">공지사항</option>
								</c:if>
								<c:if test = "${userLogin ne null && admin eq false}">
								<option value="건강증진">건강증진</option>
								<option value="벌크업">벌크업</option>
								<option value="다이어트">다이어트</option>
								<option value="기타">기타</option>
								</c:if>
						</select>
						</td>
						<td><input type="text" name="subject" id="subject" size="80"></td>
					</tr>
					<tr>
						<th>내&nbsp;&nbsp;&nbsp;용&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<td colspan="2">&nbsp;&nbsp;&nbsp;
							<!-- <textarea name="content" id="content" style="resize:none" rows="15" cols="100"></textarea> -->
							<textarea name="content" id="content" rows="22"
								style="width: 715px"></textarea> 
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