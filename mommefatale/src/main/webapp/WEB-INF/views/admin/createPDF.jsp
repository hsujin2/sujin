<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PDF 출력</title>
<style type="text/css">
#adder{
width: 200px;

}
.pdfwrap{width:"800"; margin:0 auto;}
</style>
<script type="text/javascript">
function fileCheck(){
	var form= document.pdfForm;
	if(form.file.value==""){
		alert("이미지파일을 첨부해주세요!");
		form.file.focus();
		return;
	}
	
	alert("PDF파일이 생성되었습니다.");
	form.submit();
}
var fileCnt= 0;
function addFile(){
	var container= document.getElementById('adder');
	var inputFile= document.createElement('input');
	inputFile.setAttribute('type', 'file');
	inputFile.setAttribute('name', 'file'+fileCnt);
	
	container.appendChild(inputFile);
	fileCnt++;
}
</script>
</head>
<body>
<center>
<br><br><br>
<div class="pdfwrap">
<h3>※PDF 파일이 저장되는 경로 - C:\Temp\'파일명(작성일로 기본설정되어있습니다.).pdf'</h3>
<form method="post" action="createPDF.admin" enctype="multipart/form-data" name="pdfForm">
<b>파일명 : </b></b><input type="text" name="pdfName" /><br><br>
<b>이미지 파일을 첨부해 주세요.</b>&nbsp;&nbsp;<input type="button" name="add" value="이미지 추가" onClick="addFile();"><br><br>
<div id="adder">
<input type="file" name="file"/>
</div>
<br><br>
<textarea cols="40" rows="15" name="content" placeholder="내용을 입력해주세요."></textarea><br><br>
<input type="button" value="PDF파일 생성" onClick="fileCheck()"/><br><br><br><br><br>
</form>
</div>
</center>
</body>
</html>