<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 글내용 보기</title>
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css" href="resources/css/board/community_css.css">
     <c:if test="${vo.no==null||no==''}">
      <script>
			alert("잘못된 접근이거나 해당 게시물은 존재하지 않습니다.");
			history.go(-1);
      </script>
      </c:if>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	 <script type="text/javascript">
            	function deleteContent(){
            		
            		if(confirm("정말로 삭제 하시겠습니까?")){
            			var check = "${isManager}";
            			var loginUser = "${userLogin.userid}";
            			var user = "${vo.writer}";
            			
            			if(check ==  "false" || loginUser != user){
            				alert("글쓴이와 관리자만 삭제할 수 있습니다.")
            				return;
            			}
            			if(check == "true" || loginUser == user){
            				location.href="communityDelete.do?no="+${vo.no};
            			}
            		}else{
						return;            			
            		}
     
            	}
            	
            	function updateContent() {
            		var user = "${userLogin.userid}";
            		
            		if(user == "${vo.writer}" ){
            		
	            		var subject = document.getElementById("subject").childNodes[0].nodeValue;
	            		var writer = document.getElementById("writer").childNodes[0].nodeValue;
	            		var content = document.getElementById("content").childNodes[0].nodeValue;
	            		if(subject == ""){
	            			alert("제목을 입력하세요!");
	            		}
	            		if(writer == ""){
	            			alert("작성자를 입력하세요");
	            		}
	            		if(content == ""){
	            			alert("내용을 입력하세요!");
	            		}
	            		
	            		window.location="communityUpdate.do?no="+${vo.no};
            		}
            		if(user != "${vo.writer}"){
            			alert("글쓴이만 수정 할 수 있습니다");
            			return;
            		}
            	}
            </script>
	<div id="wrap">
		<div class="board">
		<h2 class="title">자유게시판</h2>
			<form name="communityContent" method="post"
				action="communityUpdate.do" id="writeForm">
				<input type="hidden" name="no"/>
				<table summary="테이블 구성" id="community_board">
					<tr>
						<th class="no">NO.</th>
						<td id="no">${vo.no}</td>
						<td id="space"></td>
						<th class="writer">글쓴이</th>
						<td id="writer">${vo.writer}</td>
						<th>작성일자</th>
						<td id="regdate"><fmt:formatDate value="${vo.regdate}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
						<th>조회수</th>
						<td id="view">${vo.view}</td>
					</tr>
					<tr>
						<th colspan="2">제&nbsp;&nbsp;&nbsp;목</th>
						<td colspan="7" id="subject">&nbsp;&nbsp;&nbsp;${vo.section} - ${vo.subject}</td>
					</tr>
					<tr>
						<td colspan="9" id="content"><pre>${vo.content}</pre></td>
					</tr>
					<tr>
						<td colspan="9"><hr class="board_hr"></td>
					</tr>
					<tr>
						<td colspan="4">
						</td>
						<td class="align_right">
							<a href="communityBoard.do">목록보기</a>
						</td>
						<td colspan="2">
						</td>
						<td colspan="2">
							<input type="submit" value="글수정" onClick="updateContent()" class="commit_btn"> 
							<input type="button" value="글삭제" onclick="deleteContent()" class="commit_btn">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>