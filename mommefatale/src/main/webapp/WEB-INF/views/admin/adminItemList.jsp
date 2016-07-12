<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>상품관리</title>
<link rel="stylesheet" type="text/css" href="resources/css/item/itemManage_css.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.0.0.js"></script>
<script type="text/javascript">
	function modify(item_no){
		alert(item_no);
	}
</script>

</head>
<body>
<form id="modifyArea" method="post" action="">
	<div id="modify">
		상품명 : <input type="text" name="itemname"><br>
	</div>
</form>
<section class="content">
	<div class="upmenu">
    	<select class="itemName">
            <option>상품명</option>
            <option>품번</option>
            <option>가격</option>
            <option>번호</option>
        </select>
        <input type="text" class="text"><input type="button" value="검 색" class="btn"/>
        <select class="sort">
        	<option>기본정렬</option>
            <option>높은가격순</option>
            <option>낮은가격순</option>
            <option>판매량순</option>
        </select>
    </div>
    <table class="item" border="1">
                <colgroup>
                    <col width="2%" />
                    <col width="10%" />
                    <col width="auto" />
                    <col width="10%" />
                    <col width="7%" />
                    <col width="7%" />
                    <col width="7%" />
                    <col width="7%" />
                    <col width="5%" />
                    <col width="8%" />
                    <col width="8%" />
                    <col width="5%" />
                </colgroup>
                <thead>
                    <tr>
                        <th></th>
                        <th>이미지</th>
                        <th>상품명</th>
                        <th>카테고리</th>
                        <th>사이즈</th>
                        <th>색상</th>
                        <th>판매량</th>
                        <th>재고</th>
                        <th>조회</th>
                        <th>가격</th>
                        <th>수정일</th>
                        <th>수정<br />삭제</th>
                    </tr>
                </thead>
                <tbody>
                <c:if test="${count == 0}">
                	<tr>
                		<td>등록된 상품이 없습니다.</td>
                	</tr>
                </c:if>
                <c:if test="${count != 0}">
	                <c:forEach var="item" items="${itemlist}">
		                <tr>
		                	<td><input type="checkbox"/></td>
		                    <td><a href="itemview.do?no=${item.no}">
										<img
										src="/mommefatale/resources/images/uploadimg/${item.main_img}"
										alt="${item.name}" class="itemImg" width="110px">
									  </a></td>
		                    <td class="aleft"><a href="itemview.do?no=${item.no}">${item.name}</a></td>
		                    <td>${item.category}</td>
		                    <td>${item.option_size }</td>
		                    <td>${item.color }</td>
		                    <td>${item.sales_quantity}</td>
		                    <td>${item.stock }</td>
		                    <td>${item.view }</td>
		                    <td>${item.price_discount}원</td>
		                    <td>${item.update_date }</td>
		                    <td>
		                    	<button class="btn1" value=${item.no } onclick="modify(this.value)">수정</button>
		                        <input type="button" class="btn2" value="삭제" onclick=""/>
		                    </td>
		                </tr>
	                </c:forEach>
                </c:if>
                
                </tbody>
                
            </table>
            <table>
            	<tr>
						<td colspan="3" align="center"><c:if test="${paging.isPre()}">
								<a
									href="itemlist.admin?pageNum=${paging.getPage_Start()-paging.pageNavi}&category=${category}&range=${range}">[이전]</a>&nbsp;&nbsp;</c:if>
							<c:forEach var="counter" begin="${paging.getPage_Start()}"
								end="${paging.getPage_End()}">
								<c:if test="${paging.getCur_Page() eq counter}">
								[${counter}]
							</c:if>
								<c:if test="${paging.getCur_Page() ne counter}">
									<a
										href="javascript:window.location='itemlist.admin?pageNum=${counter}&category=${category}&range=${range}'">[${counter}]</a>
								</c:if>
							</c:forEach> <c:if test="${paging.isNext()}">
								<a href="itemlist.admin?pageNum=${paging.getPage_Start()+pagingNum.pageNavi}&category=${category}&range=${range}">[다음]</a>
							</c:if></td>
					</tr>
            </table>
</section>
</body>
</html>