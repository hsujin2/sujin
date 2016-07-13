<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>상품관리</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">	
<link rel="stylesheet" type="text/css" href="resources/css/common_css.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/item/itemManage_css.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.0.0.js"></script>
<script type="text/javascript">
	window.onload=function(){
		var range = "${range}";
		$("select[name=range] option[value="+range+"]").attr("selected",true);
		
	}
	function modifyOpen(item_no){
		var item_no = item_no;
		$.ajax({
			url : "/mommefatale/modifyOpen.json",
			type : "POST",
			data : {'item_no' : item_no},
			async : false,
			success : function(response){
				var item = response.item;
				$('#item_no').val(item.no);
				$('#itemname').val(item.name);
				$('#brand').val(item.brand);
				$('#origin').val(item.origin);
				$('#price').val(item.price_origin);
				$('#sales').val(item.price_sales);
				$('#discount').val(item.price_discount);
				$('#stock').val(item.stock);
				$('#color').val(item.color);
				$("select[name=category] option[value="+item.category+"]").attr("selected",true);
				$("select[name=option_size] option[value="+item.option_size+"]").attr("selected",true);
			},
			error : function(request, status, error){
				alert("code : "+request.status +"\r\nmessage : "
                        + request.reponseText + "\r\nerror : " + error);
			}
		})
		
		
	}
	function save(){
		var form = document.itemModifyForm;
		if(form.itemname.value==""){
			alert("상품명을 입력해주세요");
			return
		}
		if(form.brand.value==""){
			alert("브랜드를 입력해주세요");
			return
		}
		if(form.origin.value==""){
			alert("원산지를 입력해주세요");
			return
		}
		if(form.price.value==""){
			alert("원가를 입력해주세요");
			return
		}
		if(form.sales.value==""){
			alert("판매가를 입력해주세요");
			return
		}
		if(form.discount.value==""){
			alert("할인가를 입력해주세요");
			return
		}
		if(form.stock.value==""){
			alert("재고를 입력해주세요");
			return
		}
		
		document.itemModifyForm.submit();
	}
	function deleteItem(item_no){
		var up = confirm("정말로 삭제하시겠습니까?");
		if(up){
			window.location="deleteItem.admin?item_no="+item_no;
		}else{
			return;
		}
	}
	function range(){
		var range = $('#range').val();
		window.location="itemlist.admin?range="+range;
	}
	function searchItem(){
		var group = $('#group').val();
		var text = $('#search').val();
		window.location="itemlist.admin?range=new&group="+group+"&text="+text;
	}
</script>


</head>
<body>
<div id="wrap">
<%@ include file="../include/header.jsp" %>
<section class="content">
	<div class="upmenu">
    	<select class="itemName" id="group" name="group">
            <option value="상품명">상품명</option>
            <option value="카테고리">카테고리</option>
            <option value="가격">가격</option>
        </select>
        <input type="text" class="text" id="search" name="search"><input type="button" value="검 색" class="btn" onclick="searchItem()">
        <select class="sort" id="range" name="range" onchange="range()">
        	<option value="new">신상품순</option>
            <option value="high">높은가격순</option>
            <option value="low">낮은가격순</option>
            <option value="count">판매량순</option>
            <option value="stock">재고순</option>
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
                    <col width="10%" />
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
		                   	<c:choose>
		                    	<c:when test="${item.category eq 1}">
		                    		<td>런닝머신</td>
		                    	</c:when>
		                    	<c:when test="${item.category eq 2}">
		                    		<td>웨이트기구</td>
		                    	</c:when>
		                    	<c:when test="${item.category eq 3}">
		                    		<td>사이클</td>
		                    	</c:when>
		                    	<c:when test="${item.category eq 4}">
		                    		<td>아령</td>
		                    	</c:when>
		                    	<c:when test="${item.category eq 5}">
		                    		<td>기타</td>
		                    	</c:when>
		                    	<c:when test="${item.category eq 6}">
		                    		<td>운동복</td>
		                    	</c:when>
		                    	<c:when test="${item.category eq 7}">
		                    		<td>운동화</td>
		                    	</c:when>
		                    	<c:when test="${item.category eq 8}">
		                    		<td>스포츠브라</td>
		                    	</c:when>
		                    	<c:when test="${item.category eq 9}">
		                    		<td>기타</td>
		                    	</c:when>
		                    	<c:when test="${item.category eq 10}">
		                    		<td>보충제</td>
		                    	</c:when>
		                    	<c:when test="${item.category eq 11}">
		                    		<td>영양제</td>
		                    	</c:when>
		                    	<c:when test="${item.category eq 12}">
		                    		<td>기타식품</td>
		                    	</c:when>	
		                    </c:choose>
		                    <td>${item.option_size }</td>
		                    <td>${item.color }</td>
		                    <td>${item.sales_quantity}</td>
		                    <td>${item.stock }</td>
		                    <td>${item.view }</td>
		                    <td><fmt:formatNumber value="${item.price_discount}" pattern="#,###,###"/>원</td>
		                    <td><fmt:formatDate value="${item.update_date }" type="both" pattern="yyyy-MM-dd(E)"/></td>
		                    <td>
		                    	<button class="btn btn-primary btn-lg" value=${item.no } data-toggle="modal" data-target="#myModal" onclick="modifyOpen(this.value)">수정</button>
		                    	<button class="btn2" value=${item.no } onclick="deleteItem(this.value)">삭제</button>
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

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel"><div class="sub">
        	<span class="col">▶</span> 상품 수정
        </div></h4>
	      </div>
	      <div class="modal-body">
	      <form action="modifyItem.admin" method="post" enctype="multipart/form-data" name="itemModifyForm" id="itemModifyForm" class="info">
			<table id="modifytable">
			<tr>
				<td class="itemInfo">상품번호</td>
				<td><input type="text" id="item_no" name="item_no" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="itemInfo" width="30%">카테고리</td>
				<td width="70%"><select name="category" class="full">
						<option value=1>Equipment - 런닝머신</option>
						<option value=2>Equipment - 웨이트기구</option>
						<option value=3>Equipment - 헬스사이클</option>
						<option value=4>Equipment - 아령</option>
						<option value=5>Equipment - 기타</option>
						<option value=6>SportsWear - 운동복</option>
						<option value=7>SportsWear - 운동화/런닝화</option>
						<option value=8>SportsWear - 스포츠브라</option>
						<option value=9>SportsWear - 기타</option>
						<option value=10>Food - 보충제</option>
						<option value=11>Food - 영양제</option>
						<option value=12>Food - 기타식품</option>
				</select></td>
			</tr>
			
			<tr>
				<td class="itemInfo">상품명</td>
				<td><input type="text" size="20" maxlength="15" name="name" id="itemname"  class="full"></td>
			</tr>
			<tr>
				<td class="itemInfo">브랜드</td>
				<td><input type="text" size="10" maxlength="15" name="brand" id="brand"  class="full"></td>
			</tr>
			<tr>
				<td class="itemInfo">원산지</td>
				<td><input type="text" size="10" maxlength="15" name="origin" id="origin"  class="full"></td>
			</tr>
			<tr>
				<td class="itemInfo">원가</td>
				<td><input type="text" size="10" maxlength="10" name="price" id="price"  class="full"></td>
			</tr>
			<tr>
				<td class="itemInfo">판매가</td>
				<td><input type="text" size="10" maxlength="10" name="sales" id="sales"  class="full"></td>
			</tr>
			<tr>
				<td class="itemInfo">할인가</td>
				<td><input type="text" size="10" maxlength="10" name="discount" id="discount"  class="full"></td>
			</tr>
			<tr>
				<td class="itemInfo">사이즈</td>
				<td><select name="option_size">
						<option value="">선택</option>
						<option value="XL">XS</option>
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
						<option value="XL">XL</option>
						<option value="XL">XXL</option>
						<option value="230">230</option>
						<option value="235">235</option>
						<option value="240">240</option>
						<option value="245">245</option>
						<option value="250">250</option>
						<option value="255">255</option>
						<option value="260">260</option>
						<option value="265">265</option>
						<option value="270">270</option>
						<option value="275">275</option>
						<option value="280">280</option>
				</select></td>
			</tr>
			<tr>
				<td class="itemInfo">재고수량</td>
				<td ><input type="text" size="3" maxlength="10" name="stock" id="stock"></td>
			</tr>
			<tr>
				<td class="itemInfo">색상</td>
				<td><input type="text" size="5" maxlength="10" name="color" id="color"></td>
			</tr>
			<tr>
				<td class="itemInfo">등록사진&nbsp;(메인)</td>
				<td><input type="file"  name="main-img"/></td>
			</tr>
			<tr>
				<td class="itemInfo">등록사진&nbsp;(상세)</td>
				<td><input type="file" name="content-img"/></td>
			</tr>

		</table>
		</form>
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="button" class="btn btn-primary" onclick="save()">수정</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>