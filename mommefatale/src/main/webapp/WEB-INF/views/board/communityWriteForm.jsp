<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 글쓰기폼</title>
<script>
			function FormCheck(){
				var writer = document.getElementById("writer");
				var subject = document.getElementById("subject");
				var content = document.getElementById("content");
				var writeForm = document.getElementById("writeForm");
				if(writer.value==null || writer.value==""){
					alert("작성자를 입력하세요!");
					writer.focus();
					return;
				}
				 if(subject.value==null || subject.value==""){
				alert("제목을 입력하세요!");
				subject.focus();
				return;
				} if(content.value==null || content.value==""){
				alert("내용을 입력하세요!");
				content.focus();
				return;
				}
				
				document.knowHowWriteForm.submit();
			}
			
			function writeCancel(){
				history.go(-1);
			}
		</script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div id="wrap">
		<div class="board">
			<form name="communityWriteForm" method="post"
				action="communityWrite.do">
				<table summary="테이블 구성">
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" id="writer" size="15"
							maxlength="15" value="${userLogin.id }" readonly></td>
					</tr>
					<tr>
						<td>제 목</td>
						<td><input type="text" name="subject" id="subject" size="80"></td>
					</tr>
					<tr>
						<td>내 용</td>
						<td><textarea name="content" id="content" rows="10" cols="80"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><hr size="1"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="등록"
							onClick="FormCheck()" class="commit_btn"> <input
							type="button" value="취소" onclick="writeCancel()"
							class="commit_btn"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>