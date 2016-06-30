<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&amp;A</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/common_css.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/board/qna_css.css" />
<script type="text/javascript" src="resources/js/qna/qna_js.js"></script>
</head>
<body>
	<div id="wrap">
		<%@ include file="../include/header.jsp"%>
		<script>
			function qnaWrite() {
				var user = "${userLogin}";

				if (user == null || user == "") {
					alert("로그인 후 글쓰기가 가능합니다.");
					return;
				}

				window.location = "/mommefatale/qnaWriteForm.do";
			}
		</script>

		<section class="contents">
		<div class="subody">
			<div class="first">
				<h2 class="title">FAQ</h2>
			</div>

			<div class="info">
				<button class="btn1" onclick="fn_spread('hiddenContent');">
					<img id="img1" src="resources/images/board/button2.png"
						width="20px" height="20px" />
				</button>
				<div class="dcontent">24시간 상담문의 안내</div>
				<br />
				<div id="hiddenContent">
					mommefatale의 비전은 가장신뢰받는 회사가 되는것입니다. <br /> 가장 규모가 큰 회사, 가장 수익성이 높은
					회사가 아니라 고객들로부터 신뢰와 존경을 받는 정직하고 윤리적인 회사가 되겠다는 것입니다.
				</div>
			</div>

			<div class="info">
				<button class="btn1" onclick="fn_spread2('hiddenContent2');">
					<img id="img2" src="resources/images/board/button2.png"
						width="20px" height="20px" />
				</button>
				<div class="dcontent">계좌정보를 넣지 않았는데 매출입금을 받을 수 있나요?</div>
				<br />
				<div id="hiddenContent2">계좌정보를 넣지 않았으면 매출입금을 받을 수 없습니다.</div>
			</div>

			<div class="info">
				<button class="btn1" onclick="fn_spread3('hiddenContent3');">
					<img id="img3" src="resources/images/board/button2.png"
						width="20px" height="20px" />
				</button>
				<div class="dcontent">배송전 주문취소 및 변경안내</div>
				<br />
				<div id="hiddenContent3">
					mommefatale의 비전은 가장신뢰받는 회사가 되는것입니다. <br /> 가장 규모가 큰 회사, 가장 수익성이 높은
					회사가 아니라 고객들로부터 신뢰와 존경을 받는 정직하고 윤리적인 회사가 되겠다는 것입니다.
				</div>

			</div>
			<div class="info">
				<button class="btn1" onclick="fn_spread4('hiddenContent4');">
					<img id="img4" src="resources/images/board/button2.png"
						width="20px" height="20px" />
				</button>
				<div class="dcontent">판매현황/계산내역/세금계산서도 볼수 있나요?</div>
				<br />
				<div id="hiddenContent4">
					mommefatale의 비전은 가장신뢰받는 회사가 되는것입니다. <br /> 가장 규모가 큰 회사, 가장 수익성이 높은
					회사가 아니라 고객들로부터 신뢰와 존경을 받는 정직하고 윤리적인 회사가 되겠다는 것입니다.
				</div>
			</div>
		</div>
		</section>
		<div class="board">
			<h2 class="title">Q&amp;A</h2>
			<table summary="QnA게시판" id="qna_board">
				<colgroup>
					<col width="8%">
					<col width="15%">
					<col>
					<col width="10%">
					<col width="18%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">NO</th>
						<th scope="col">말머리</th>
						<th scope="col">제목</th>
						<th scope="col">글쓴이</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${count == 0 }">

						<tr>
							<td></td>
							<td></td>
							<td>Q&amp;A게시판에 등록된 글이 없습니다.</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

					</c:if>
					<c:if test="${count != 0 }">
						<c:forEach var="vo" items="${vo}">
							<tr>
								<td><c:set var="num" value="${num+1}" scope="page" />${num}</td>
								<!-- 페이지에서만 유효한 글 번호 -->
								<!-- <td>${vo.no}</td>-->
								<!-- 실제 입력되는 순서의 글번호 -->
								<td>${vo.section}</td>
								<td class="align_left"><c:if test="${vo.depth > 0}">
										<c:set var="wid" value="${vo.depth*10}" />
										<img src="resources/images/board/level.gif" width="${wid}">
									</c:if> <c:if test="${vo.step ge 1}">
										<img src="resources/images/board/reply_complete_icon2.gif">
									</c:if> <a href="qnaContent.do?no=${vo.no}">${vo.subject }</a> 
									</td>
								<td>${vo.writer}</td>
								<td><fmt:formatDate value="${vo.regdate}" type="date"
										pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${vo.view}</td>
							</tr>
						</c:forEach>
					</c:if>
					<tr>
						<td colspan="6">
							<hr class="board_hr">
						</td>
					</tr>
					<tr>
						<td colspan="5"></td>
						<td>
							<button class="write_button" onclick="qnaWrite()">글쓰기</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="footList">
			<c:if test="${paging.isPre()}">
				<a
					href="qnaBoard.do?pageNum=${paging.getPage_Start()-paging.p_size}">[이전]</a>&nbsp;&nbsp;</c:if>
			<c:forEach var="counter" begin="${paging.getPage_Start()}"
				end="${paging.getPage_End()}">
				<c:if test="${paging.getCur_Page() eq counter}">[${counter}]
                     </c:if>
				<c:if test="${paging.getCur_Page() ne counter}">
					<a
						href="javascript:window.location='qnaBoard.do?pageNum=${counter}'">[${counter}]</a>
				</c:if>
			</c:forEach>
			<c:if test="${paging.isNext()}">
				<a
					href="qnaBoard.do?pageNum=${paging.getPage_Start()+paging.p_size}">[다음]</a>
			</c:if>

		</div>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>