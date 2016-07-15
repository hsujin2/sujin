<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %> --%>
<%-- <%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Exercise</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/contents/contents_css.css">
<script type="text/javascript" src="ckeditor/ckeditor.js" charset="utf-8"></script> 
<script>

	function FormCheck() {
		var CKEDITOR;
		/* var writer = document.getElementById("writer"); */
		var subject = document.getElementById("subject");
		var content = document.getElementById("content");
		var exerciseWriteForm = document.getElementById("writeForm");

		if (subject.value == null || subject.value == "") {
			alert("제목을 입력하세요!");
			subject.focus();
			return;
		}

		document.exerciseWriteForm.submit();
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
			<h1 class="title">Exercise</h1>
			<form name="exerciseWriteForm" method="post"
				action="exerciseWrite.do" id="writeForm">
				<table summary="테이블 구성" id="exercise_board">
					<%-- <tr>
						<th>작성자</th>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="writer" id="writer"
							size="20" maxlength="20" value="${userLogin.userid }" readonly></td>
							<td  colspan="2" width="750"></td>
					</tr> --%>
					<tr>
						<th class="itemInfo">카테고리</th>
						<td><select name="category" id="category">
								<option value="healthcare">Health Care</option>
								<option value="bulkup">Bulk-Up</option>
								<option value="diet">Diet</option>
						</select></td>
						<td colspan="2" width="520px">
						</td>
					</tr>
					<tr>
						<th>제&nbsp;&nbsp;&nbsp;목</th>
						<td colspan="3"><input type="text" name="subject"
							id="subject" size="115"></td>
					</tr>
					<tr>
						<th>내&nbsp;&nbsp;&nbsp;용&nbsp;</th>
						<td colspan="3">&nbsp;&nbsp;&nbsp;
							<textarea name="content" id="content" rows="50" cols="150"></textarea>
							<script type="text/javascript">
								//<![CDATA[
								CKEDITOR.replace('content',{ width:'850px', height : '500px', });
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